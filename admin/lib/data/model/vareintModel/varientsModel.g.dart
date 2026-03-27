// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'varientsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Variantsmodel _$VariantsmodelFromJson(Map<String, dynamic> json) =>
    _Variantsmodel(
      id: json['id'] as String?,
      size: (json['size'] as List<dynamic>).map((e) => e as String).toList(),
      color: (json['color'] as List<dynamic>).map((e) => e as String).toList(),
      stock: (json['stock'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$VariantsmodelToJson(_Variantsmodel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'color': instance.color,
      'stock': instance.stock,
      'images': instance.images,
    };
