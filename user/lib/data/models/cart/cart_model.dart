import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
abstract class CartModel with _$CartModel {
  const factory CartModel({
    String? id,
    required String productId,
    required String image,
    required String name,
    required String color,
    required String size,
    required double price,
    required String userId,

    required int quantity,
  }) = _CartModel;  

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
