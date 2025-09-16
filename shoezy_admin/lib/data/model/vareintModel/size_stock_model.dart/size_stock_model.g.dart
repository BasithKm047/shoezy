// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SizeStockModel _$SizeStockModelFromJson(Map<String, dynamic> json) =>
    _SizeStockModel(
      size: json['size'] as String,
      stock: (json['stock'] as num).toInt(),
    );

Map<String, dynamic> _$SizeStockModelToJson(_SizeStockModel instance) =>
    <String, dynamic>{'size': instance.size, 'stock': instance.stock};
