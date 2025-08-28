// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String?,
      productName: json['productName'] as String,
      brandId: json['brandId'] as String,
      categoryId: json['categoryId'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      variants: (json['variants'] as List<dynamic>)
          .map((e) => Variantsmodel.fromJson(e as Map<String, dynamic>))
          .toList(),
      stock: (json['stock'] as List<dynamic>).map((e) => e as String).toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'brandId': instance.brandId,
      'categoryId': instance.categoryId,
      'price': instance.price,
      'description': instance.description,
      'variants': instance.variants,
      'stock': instance.stock,
      'images': instance.images,
    };
