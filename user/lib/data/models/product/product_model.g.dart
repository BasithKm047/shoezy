// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String?,
      productName: json['productName'] as String,
      brandName: json['brandName'] as String,
      categoryName: json['categoryName'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      color: (json['color'] as List<dynamic>).map((e) => e as String).toList(),
      size: (json['size'] as List<dynamic>).map((e) => e as String).toList(),
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      stock: (json['stock'] as List<dynamic>).map((e) => e as String).toList(),
      tag: json['tag'] as String,
      gender: json['gender'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'brandName': instance.brandName,
      'categoryName': instance.categoryName,
      'price': instance.price,
      'description': instance.description,
      'color': instance.color,
      'size': instance.size,
      'image': instance.image,
      'stock': instance.stock,
      'tag': instance.tag,
      'gender': instance.gender,
      'createdAt': instance.createdAt.toIso8601String(),
    };
