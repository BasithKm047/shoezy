// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Usermodel _$UsermodelFromJson(Map<String, dynamic> json) => _Usermodel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  profileImage: json['profileImage'] as String?,
  isAdmin: json['isAdmin'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UsermodelToJson(_Usermodel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'profileImage': instance.profileImage,
      'isAdmin': instance.isAdmin,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
