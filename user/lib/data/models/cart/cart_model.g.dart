// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartModel _$CartModelFromJson(Map<String, dynamic> json) => _CartModel(
  id: json['id'] as String?,
  productId: json['productId'] as String,
  color: json['color'] as String,
  size: json['size'] as String,
  price: json['price'] as String,
  userId: json['userId'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$CartModelToJson(_CartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'color': instance.color,
      'size': instance.size,
      'price': instance.price,
      'userId': instance.userId,
      'quantity': instance.quantity,
    };
