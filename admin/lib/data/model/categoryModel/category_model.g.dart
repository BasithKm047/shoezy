// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      name: (json['name'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'id': instance.id,
    };
