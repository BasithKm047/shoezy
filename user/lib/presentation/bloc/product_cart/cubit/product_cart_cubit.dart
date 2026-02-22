import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy/data/auth/auth_services.dart';
import 'package:shoezy/data/models/user_model.dart';
import 'package:shoezy/data/models/cart/cart_model.dart';
import 'package:shoezy/data/repositories/cart_repository.dart'; // adjust import path
import 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  final CartRepository _repo;
  final AuthServices _authServices;

  StreamSubscription<List<CartModel>>? _subscription;
  UserModel? _currentUser;

  ProductCartCubit(this._authServices, {required CartRepository repository})
    : _repo = repository,
      super(const ProductCartState.initial()) {
    // Proactive: Initial fallback from FirebaseAuth data to avoid null state while Firestore loads
    final authUser = _authServices.currentUser;
    if (authUser != null) {
      _currentUser = UserModel(
        id: authUser.uid,
        userName: authUser.displayName ?? '',
        email: authUser.email ?? '',
        phoneNumber: authUser.phoneNumber ?? '',
        imagePath: '',
        isAdmin: false,
        isBlocked: false,
      );
    }

    getUser();
    _startListening();
  }

  void _startListening() {
    emit(const ProductCartState.loading());
    // Subscribe to real-time updates from repository
    _subscription = _repo.cartItemsStream().listen(
      (items) {
        Logger().i("Stream received ${items.length} items");
        // filter to current user (repo already scopes by user but keep safe)
        final userItems = items.where((i) => i.userId == _repo.uid).toList();
        Logger().i("Filtered to ${userItems.length} items for current user");
        emit(ProductCartState.loaded(userItems, user: _currentUser));
      },
      onError: (err, st) {
        Logger().e("Stream error: $err");
        emit(ProductCartState.error(err.toString(), user: _currentUser));
      },
    );
  }

  /// Add item to cart. Repository will merge/increment if necessary.
  Future<void> addItem(CartModel newItem) async {
    try {
      await _repo.addToCart(newItem);
      emit(const ProductCartState.success());
      Logger().i('Successfully added/updated cart item: ${newItem.productId}');
    } catch (e) {
      Logger().e('Error adding to cart: $e');
      emit(ProductCartState.error(e.toString(), user: _currentUser));
    }
  }

  Future<void> removeItem(String cartItemId) async {
    try {
      await _repo.removeFromCart(cartItemId);
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  /// Clear all cart items for the user
  Future<void> clearCart() async {
    try {
      await _repo.clearCart();
      // stream will update UI
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  /// Set new absolute quantity (>=1). Use transaction in repository.
  Future<void> updateQuantity(String id, int qty) async {
    if (qty < 1) {
      emit(
        ProductCartState.error(
          'Quantity must be at least 1',
          user: _currentUser,
        ),
      );
      return;
    }

    try {
      await _repo.updateQuantity(id, qty);
      // stream will emit updated list
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  Future<List<CartModel>> getCartItems() async {
    try {
      final items = await _repo.getCartItems();

      emit(ProductCartState.loaded(items, user: _currentUser));
      Logger().i(
        'Fetched cart items: ${items.length} items for user ${_repo.uid}',
      );
      return items;
    } catch (e) {
      emit(ProductCartState.error(e.toString(), user: _currentUser));
      return [];
    }
  }

  /// Convenience: increment quantity by 1
  Future<void> incrementQuantity(String cartItemId) async {
    final state = this.state;
    final item = state.maybeWhen(
      loaded: (items, user) => items.firstWhere(
        (i) => i.id == cartItemId,
        orElse: () => throw Exception('Cart item not found'),
      ),
      orElse: () => throw Exception('Cart state not loaded'),
    );

    try {
      await _repo.updateQuantity(cartItemId, item.quantity + 1);
    } catch (e) {
      emit(ProductCartState.error(e.toString(), user: _currentUser));
    }
  }

  /// Convenience: decrement quantity by 1 (removes item if result < 1)
  Future<void> decrementQuantity(String cartItemId) async {
    final state = this.state;
    final item = state.maybeWhen(
      loaded: (items, user) => items.firstWhere(
        (i) => i.id == cartItemId,
        orElse: () => throw Exception('Cart item not found'),
      ),
      orElse: () => throw Exception('Cart state not loaded'),
    );
    try {
      final newQty = item.quantity - 1;
      if (newQty < 1) {
        await _repo.removeFromCart(cartItemId);
      } else {
        await _repo.updateQuantity(cartItemId, newQty);
      }
    } catch (e) {
      emit(ProductCartState.error(e.toString(), user: _currentUser));
    }
  }

  double getTotalPrice() {
    return state.maybeWhen(
      loaded: (items, user) {
        return items.fold(
          0.0,
          (total, item) => total + (item.price * item.quantity),
        );
      },
      orElse: () => 0.0,
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  Future<void> getUser() async {
    try {
      _currentUser = await _authServices.getUser();
      state.maybeWhen(
        loaded: (cartItems, user) =>
            emit(ProductCartState.loaded(cartItems, user: _currentUser)),
        orElse: () => emit(ProductCartState.userLoaded(_currentUser)),
      );
    } catch (e) {
      Logger().e("Error fetching user: $e");
      // Fallback: Use FirebaseAuth data if Firestore is unreachable
      final authUser = _authServices.currentUser;
      if (authUser != null && _currentUser == null) {
        _currentUser = UserModel(
          id: authUser.uid,
          userName: authUser.displayName ?? '',
          email: authUser.email ?? '',
          phoneNumber: authUser.phoneNumber ?? '',
          imagePath: '',
          isAdmin: false,
          isBlocked: false,
          address: '',
        );
        state.maybeWhen(
          loaded: (cartItems, user) =>
              emit(ProductCartState.loaded(cartItems, user: _currentUser)),
          orElse: () => emit(ProductCartState.userLoaded(_currentUser)),
        );
      }
    }
  }
}
