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
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      colorName: json['colorName'] as String,
      colorCode: json['colorCode'] as String,
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
      'images': instance.images,
      'colorName': instance.colorName,
      'colorCode': instance.colorCode,
    };
