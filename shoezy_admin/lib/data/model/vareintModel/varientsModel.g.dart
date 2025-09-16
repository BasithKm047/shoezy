// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'varientsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Variantsmodel _$VariantsmodelFromJson(Map<String, dynamic> json) =>
    _Variantsmodel(
      color: (json['color'] as List<dynamic>).map((e) => e as String).toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sizeStock: (json['sizeStock'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$VariantsmodelToJson(_Variantsmodel instance) =>
    <String, dynamic>{
      'color': instance.color,
      'images': instance.images,
      'sizeStock': instance.sizeStock,
    };
