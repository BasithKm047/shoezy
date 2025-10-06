// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Usermodel {

 String? get id; String? get userName; String? get email; String? get phone; String? get address; String? get profileImage; bool? get isAdmin; bool? get isBlocked; DateTime? get createdAt;
/// Create a copy of Usermodel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsermodelCopyWith<Usermodel> get copyWith => _$UsermodelCopyWithImpl<Usermodel>(this as Usermodel, _$identity);

  /// Serializes this Usermodel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Usermodel&&(identical(other.id, id) || other.id == id)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userName,email,phone,address,profileImage,isAdmin,isBlocked,createdAt);

@override
String toString() {
  return 'Usermodel(id: $id, userName: $userName, email: $email, phone: $phone, address: $address, profileImage: $profileImage, isAdmin: $isAdmin, isBlocked: $isBlocked, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UsermodelCopyWith<$Res>  {
  factory $UsermodelCopyWith(Usermodel value, $Res Function(Usermodel) _then) = _$UsermodelCopyWithImpl;
@useResult
$Res call({
 String? id, String? userName, String? email, String? phone, String? address, String? profileImage, bool? isAdmin, bool? isBlocked, DateTime? createdAt
});




}
/// @nodoc
class _$UsermodelCopyWithImpl<$Res>
    implements $UsermodelCopyWith<$Res> {
  _$UsermodelCopyWithImpl(this._self, this._then);

  final Usermodel _self;
  final $Res Function(Usermodel) _then;

/// Create a copy of Usermodel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userName = freezed,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? profileImage = freezed,Object? isAdmin = freezed,Object? isBlocked = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,isAdmin: freezed == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool?,isBlocked: freezed == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Usermodel].
extension UsermodelPatterns on Usermodel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Usermodel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Usermodel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Usermodel value)  $default,){
final _that = this;
switch (_that) {
case _Usermodel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Usermodel value)?  $default,){
final _that = this;
switch (_that) {
case _Usermodel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? userName,  String? email,  String? phone,  String? address,  String? profileImage,  bool? isAdmin,  bool? isBlocked,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Usermodel() when $default != null:
return $default(_that.id,_that.userName,_that.email,_that.phone,_that.address,_that.profileImage,_that.isAdmin,_that.isBlocked,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? userName,  String? email,  String? phone,  String? address,  String? profileImage,  bool? isAdmin,  bool? isBlocked,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Usermodel():
return $default(_that.id,_that.userName,_that.email,_that.phone,_that.address,_that.profileImage,_that.isAdmin,_that.isBlocked,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? userName,  String? email,  String? phone,  String? address,  String? profileImage,  bool? isAdmin,  bool? isBlocked,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Usermodel() when $default != null:
return $default(_that.id,_that.userName,_that.email,_that.phone,_that.address,_that.profileImage,_that.isAdmin,_that.isBlocked,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Usermodel implements Usermodel {
   _Usermodel({this.id, this.userName, this.email, this.phone, this.address, this.profileImage, this.isAdmin, this.isBlocked, this.createdAt});
  factory _Usermodel.fromJson(Map<String, dynamic> json) => _$UsermodelFromJson(json);

@override final  String? id;
@override final  String? userName;
@override final  String? email;
@override final  String? phone;
@override final  String? address;
@override final  String? profileImage;
@override final  bool? isAdmin;
@override final  bool? isBlocked;
@override final  DateTime? createdAt;

/// Create a copy of Usermodel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsermodelCopyWith<_Usermodel> get copyWith => __$UsermodelCopyWithImpl<_Usermodel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsermodelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Usermodel&&(identical(other.id, id) || other.id == id)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userName,email,phone,address,profileImage,isAdmin,isBlocked,createdAt);

@override
String toString() {
  return 'Usermodel(id: $id, userName: $userName, email: $email, phone: $phone, address: $address, profileImage: $profileImage, isAdmin: $isAdmin, isBlocked: $isBlocked, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UsermodelCopyWith<$Res> implements $UsermodelCopyWith<$Res> {
  factory _$UsermodelCopyWith(_Usermodel value, $Res Function(_Usermodel) _then) = __$UsermodelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? userName, String? email, String? phone, String? address, String? profileImage, bool? isAdmin, bool? isBlocked, DateTime? createdAt
});




}
/// @nodoc
class __$UsermodelCopyWithImpl<$Res>
    implements _$UsermodelCopyWith<$Res> {
  __$UsermodelCopyWithImpl(this._self, this._then);

  final _Usermodel _self;
  final $Res Function(_Usermodel) _then;

/// Create a copy of Usermodel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userName = freezed,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? profileImage = freezed,Object? isAdmin = freezed,Object? isBlocked = freezed,Object? createdAt = freezed,}) {
  return _then(_Usermodel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,isAdmin: freezed == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool?,isBlocked: freezed == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
