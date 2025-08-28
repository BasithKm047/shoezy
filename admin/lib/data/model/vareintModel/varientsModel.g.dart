// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'varientsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Variantsmodel _$VariantsmodelFromJson(Map<String, dynamic> json) =>
    _Variantsmodel(
      id: json['id'] as String?,
      color: json['color'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      size: (json['size'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VariantsmodelToJson(_Variantsmodel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'images': instance.images,
      'size': instance.size,
    };
