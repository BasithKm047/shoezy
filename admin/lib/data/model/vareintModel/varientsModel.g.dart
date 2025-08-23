// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'varientsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Variantsmodel _$VariantsmodelFromJson(Map<String, dynamic> json) =>
    _Variantsmodel(
      id: json['id'] as String?,
      brandId: json['brandId'] as String?,
      color: json['color'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      size: (json['size'] as List<dynamic>).map((e) => e as String).toList(),
      stock: json['stock'] as String,
    );

Map<String, dynamic> _$VariantsmodelToJson(_Variantsmodel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brandId': instance.brandId,
      'color': instance.color,
      'images': instance.images,
      'size': instance.size,
      'stock': instance.stock,
    };
