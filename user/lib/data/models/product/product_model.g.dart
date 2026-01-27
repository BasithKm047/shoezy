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
      variants: (json['variants'] as List<dynamic>)
          .map((e) => Variantsmodel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizeStock: (json['sizeStock'] as List<dynamic>)
          .map((e) => SizeStockModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tag: json['tag'] as String,
      gender: json['gender'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isFavourite: json['isFavourite'] as bool?,
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'brandName': instance.brandName,
      'categoryName': instance.categoryName,
      'price': instance.price,
      'description': instance.description,
      'variants': instance.variants,
      'sizeStock': instance.sizeStock,
      'tag': instance.tag,
      'gender': instance.gender,
      'createdAt': instance.createdAt.toIso8601String(),
      'isFavourite': instance.isFavourite,
    };
