// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'varientsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Variantsmodel {

 String? get id; String get color; List<String> get images; List<String> get size;
/// Create a copy of Variantsmodel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantsmodelCopyWith<Variantsmodel> get copyWith => _$VariantsmodelCopyWithImpl<Variantsmodel>(this as Variantsmodel, _$identity);

  /// Serializes this Variantsmodel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Variantsmodel&&(identical(other.id, id) || other.id == id)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.size, size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,color,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(size));

@override
String toString() {
  return 'Variantsmodel(id: $id, color: $color, images: $images, size: $size)';
}


}

/// @nodoc
abstract mixin class $VariantsmodelCopyWith<$Res>  {
  factory $VariantsmodelCopyWith(Variantsmodel value, $Res Function(Variantsmodel) _then) = _$VariantsmodelCopyWithImpl;
@useResult
$Res call({
 String? id, String color, List<String> images, List<String> size
});




}
/// @nodoc
class _$VariantsmodelCopyWithImpl<$Res>
    implements $VariantsmodelCopyWith<$Res> {
  _$VariantsmodelCopyWithImpl(this._self, this._then);

  final Variantsmodel _self;
  final $Res Function(Variantsmodel) _then;

/// Create a copy of Variantsmodel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? color = null,Object? images = null,Object? size = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Variantsmodel].
extension VariantsmodelPatterns on Variantsmodel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Variantsmodel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Variantsmodel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Variantsmodel value)  $default,){
final _that = this;
switch (_that) {
case _Variantsmodel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Variantsmodel value)?  $default,){
final _that = this;
switch (_that) {
case _Variantsmodel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String color,  List<String> images,  List<String> size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Variantsmodel() when $default != null:
return $default(_that.id,_that.color,_that.images,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String color,  List<String> images,  List<String> size)  $default,) {final _that = this;
switch (_that) {
case _Variantsmodel():
return $default(_that.id,_that.color,_that.images,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String color,  List<String> images,  List<String> size)?  $default,) {final _that = this;
switch (_that) {
case _Variantsmodel() when $default != null:
return $default(_that.id,_that.color,_that.images,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Variantsmodel implements Variantsmodel {
   _Variantsmodel({this.id, required this.color, required final  List<String> images, required final  List<String> size}): _images = images,_size = size;
  factory _Variantsmodel.fromJson(Map<String, dynamic> json) => _$VariantsmodelFromJson(json);

@override final  String? id;
@override final  String color;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<String> _size;
@override List<String> get size {
  if (_size is EqualUnmodifiableListView) return _size;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_size);
}


/// Create a copy of Variantsmodel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantsmodelCopyWith<_Variantsmodel> get copyWith => __$VariantsmodelCopyWithImpl<_Variantsmodel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariantsmodelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Variantsmodel&&(identical(other.id, id) || other.id == id)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._size, _size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,color,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_size));

@override
String toString() {
  return 'Variantsmodel(id: $id, color: $color, images: $images, size: $size)';
}


}

/// @nodoc
abstract mixin class _$VariantsmodelCopyWith<$Res> implements $VariantsmodelCopyWith<$Res> {
  factory _$VariantsmodelCopyWith(_Variantsmodel value, $Res Function(_Variantsmodel) _then) = __$VariantsmodelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String color, List<String> images, List<String> size
});




}
/// @nodoc
class __$VariantsmodelCopyWithImpl<$Res>
    implements _$VariantsmodelCopyWith<$Res> {
  __$VariantsmodelCopyWithImpl(this._self, this._then);

  final _Variantsmodel _self;
  final $Res Function(_Variantsmodel) _then;

/// Create a copy of Variantsmodel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? color = null,Object? images = null,Object? size = null,}) {
  return _then(_Variantsmodel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,size: null == size ? _self._size : size // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
