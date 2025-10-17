// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    _FavoriteModel(
      userId: json['userId'] as String?,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FavoriteModelToJson(_FavoriteModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'product': instance.product,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
