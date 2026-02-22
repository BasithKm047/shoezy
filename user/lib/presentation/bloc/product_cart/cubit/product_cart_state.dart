// lib/presentation/bloc/product_cart/product_cart_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy/data/models/cart/cart_model.dart';
import 'package:shoezy/data/models/user_model.dart';

part 'product_cart_state.freezed.dart';

@freezed
class ProductCartState with _$ProductCartState {
  const factory ProductCartState.initial() = _Initial;
  const factory ProductCartState.success() = _Success;
  const factory ProductCartState.userLoaded(UserModel? user) = _UserLoaded;
  const factory ProductCartState.loading() = _Loading;
  const factory ProductCartState.loaded(
    List<CartModel> cartItems, {
    UserModel? user,
  }) = _Loaded;
  const factory ProductCartState.error(String message, {UserModel? user}) =
      _Error;
}
