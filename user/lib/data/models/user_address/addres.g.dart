// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      addressLine: json['addressLine'] as String,
      pincode: json['pincode'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'addressLine': instance.addressLine,
      'pincode': instance.pincode,
    };
