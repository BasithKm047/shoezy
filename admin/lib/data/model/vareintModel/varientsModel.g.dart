// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'varientsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Varientsmodel _$VarientsmodelFromJson(Map<String, dynamic> json) =>
    _Varientsmodel(
      color: json['color'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      size: (json['size'] as num).toInt(),
      stock: (json['stock'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$VarientsmodelToJson(_Varientsmodel instance) =>
    <String, dynamic>{
      'color': instance.color,
      'images': instance.images,
      'size': instance.size,
      'stock': instance.stock,
    };
