import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoezy/data/models/cart/cart_model.dart';
import 'package:shoezy/data/repositories/cart_repository.dart'; // adjust import path
import 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  final CartRepository _repo;
  final String userId;

  StreamSubscription<List<CartModel>>? _subscription;

  ProductCartCubit({
    required CartRepository repository,
    required this.userId,
  })  : _repo = repository,
        super(const ProductCartState.initial()) {
    _startListening();
  }

  void _startListening() {
    emit(const ProductCartState.loading());
    // Subscribe to real-time updates from repository
    _subscription = _repo.cartItemsStream().listen(
      (items) {
        // filter to current user (repo already scopes by user but keep safe)
        final userItems = items.where((i) => i.userId == userId).toList();
        emit(ProductCartState.loaded(userItems));
      },
      onError: (err, st) {
        emit(ProductCartState.error(err.toString()));
      },
    );
  }

  /// Add item to cart. Repository will merge/increment if necessary.
  Future<void> addItem(CartModel newItem) async {
    emit(const ProductCartState.loading());
    try {
      await _repo.addToCart(newItem);
      // success — the stream will emit the updated list; no further emit needed
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  Future<void> removeItem(String cartItemId) async {
    emit(const ProductCartState.loading());
    try {
      await _repo.removeFromCart(cartItemId);
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  /// Clear all cart items for the user
  Future<void> clearCart() async {
    emit(const ProductCartState.loading());
    try {
      await _repo.clearCart();
      // stream will update UI
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  /// Set new absolute quantity (>=1). Use transaction in repository.
  Future<void> updateQuantity(String cartItemId, int newQuantity) async {
    if (newQuantity < 1) {
      emit(const ProductCartState.error('Quantity must be at least 1'));
      return;
    }
    emit(const ProductCartState.loading());
    try {
      await _repo.updateQuantity(cartItemId, newQuantity);
      // stream will emit updated list
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  /// Convenience: increment quantity by 1
  Future<void> incrementQuantity(String cartItemId, int currentQuantity) async {
    emit(const ProductCartState.loading());
    try {
      await _repo.updateQuantity(cartItemId, currentQuantity + 1);
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  /// Convenience: decrement quantity by 1 (removes item if result < 1)
  Future<void> decrementQuantity(String cartItemId, int currentQuantity) async {
    emit(const ProductCartState.loading());
    try {
      final newQty = currentQuantity - 1;
      if (newQty < 1) {
        // optional: remove the item instead of setting zero
        await _repo.removeFromCart(cartItemId);
      } else {
        await _repo.updateQuantity(cartItemId, newQty);
      }
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
