import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy/data/models/cart/cart_model.dart';
import 'package:shoezy/data/repositories/cart_repository.dart'; // adjust import path
import 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  final CartRepository _repo;

  StreamSubscription<List<CartModel>>? _subscription;

  ProductCartCubit({required CartRepository repository})
    : _repo = repository,
      super(const ProductCartState.initial()) {
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
        emit(ProductCartState.loaded(userItems));
      },
      onError: (err, st) {
        Logger().e("Stream error: $err");
        emit(ProductCartState.error(err.toString()));
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
      emit(ProductCartState.error(e.toString()));
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
      emit(const ProductCartState.error('Quantity must be at least 1'));
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

      emit(ProductCartState.loaded(items));
      Logger().i(
        'Fetched cart items: ${items.length} items for user ${_repo.uid}',
      );
      return items;
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
      return [];
    }
  }

  /// Convenience: increment quantity by 1
  Future<void> incrementQuantity(String cartItemId) async {
    final state = this.state;
    final item = state.maybeWhen(
      loaded: (items) => items.firstWhere(
        (i) => i.id == cartItemId,
        orElse: () => throw Exception('Cart item not found'),
      ),
      orElse: () => throw Exception('Cart state not loaded'),
    );

    try {
      await _repo.updateQuantity(cartItemId, item.quantity + 1);
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  /// Convenience: decrement quantity by 1 (removes item if result < 1)
  Future<void> decrementQuantity(String cartItemId) async {
    final state = this.state;
    final item = state.maybeWhen(
      loaded: (items) => items.firstWhere(
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
      emit(ProductCartState.error(e.toString()));
    }
  }

  double getTotalPrice() {
    return state.maybeWhen(
      loaded: (items) {
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
}
