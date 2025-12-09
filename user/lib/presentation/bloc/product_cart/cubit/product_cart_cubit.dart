// lib/presentation/bloc/product_cart/product_cart_cubit.dart
import 'package:bloc/bloc.dart';

import 'package:shoezy/data/models/cart/cart_model.dart';
import 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  ProductCartCubit() : super(const ProductCartState.initial());

  final List<CartModel> _items = [];

  Future<void> loadCart(String userId) async {
    emit(const ProductCartState.loading());
    try {
      final userItems =
          _items.where((item) => item.userId == userId).toList();
      emit(ProductCartState.loaded(userItems));
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  Future<void> addItem(CartModel newItem) async {
    emit(const ProductCartState.loading());

    try {
      final index = _items.indexWhere(
        (item) =>
            item.userId == newItem.userId &&
            item.productId == newItem.productId &&
            item.color == newItem.color &&
            item.size == newItem.size,
      );

      if (index >= 0) {
        final existing = _items[index];
        _items[index] = existing.copyWith(
          quantity: existing.quantity + newItem.quantity,
        );
      } else {
        _items.add(newItem);
      }

      final userItems =
          _items.where((item) => item.userId == newItem.userId).toList();
      emit(ProductCartState.loaded(userItems));
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  Future<void> removeItem(String cartItemId, String userId) async {
    emit(const ProductCartState.loading());

    try {
      _items.removeWhere((item) => item.id == cartItemId);
      final userItems =
          _items.where((item) => item.userId == userId).toList();
      emit(ProductCartState.loaded(userItems));
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  Future<void> clearCart(String userId) async {
    emit(const ProductCartState.loading());
    try {
      _items.removeWhere((item) => item.userId == userId);
      emit(const ProductCartState.loaded([]));
    } catch (e) {
      emit(ProductCartState.error(e.toString()));
    }
  }

  
}
