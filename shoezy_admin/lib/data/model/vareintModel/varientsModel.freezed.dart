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

// String ? id,
 List<String> get color; List<String> get images; List<Map<String, dynamic>> get sizeStock;
/// Create a copy of Variantsmodel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantsmodelCopyWith<Variantsmodel> get copyWith => _$VariantsmodelCopyWithImpl<Variantsmodel>(this as Variantsmodel, _$identity);

  /// Serializes this Variantsmodel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Variantsmodel&&const DeepCollectionEquality().equals(other.color, color)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.sizeStock, sizeStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(color),const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(sizeStock));

@override
String toString() {
  return 'Variantsmodel(color: $color, images: $images, sizeStock: $sizeStock)';
}


}

/// @nodoc
abstract mixin class $VariantsmodelCopyWith<$Res>  {
  factory $VariantsmodelCopyWith(Variantsmodel value, $Res Function(Variantsmodel) _then) = _$VariantsmodelCopyWithImpl;
@useResult
$Res call({
 List<String> color, List<String> images, List<Map<String, dynamic>> sizeStock
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
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,Object? images = null,Object? sizeStock = null,}) {
  return _then(_self.copyWith(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as List<String>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,sizeStock: null == sizeStock ? _self.sizeStock : sizeStock // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> color,  List<String> images,  List<Map<String, dynamic>> sizeStock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Variantsmodel() when $default != null:
return $default(_that.color,_that.images,_that.sizeStock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> color,  List<String> images,  List<Map<String, dynamic>> sizeStock)  $default,) {final _that = this;
switch (_that) {
case _Variantsmodel():
return $default(_that.color,_that.images,_that.sizeStock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> color,  List<String> images,  List<Map<String, dynamic>> sizeStock)?  $default,) {final _that = this;
switch (_that) {
case _Variantsmodel() when $default != null:
return $default(_that.color,_that.images,_that.sizeStock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Variantsmodel implements Variantsmodel {
   _Variantsmodel({required final  List<String> color, required final  List<String> images, required final  List<Map<String, dynamic>> sizeStock}): _color = color,_images = images,_sizeStock = sizeStock;
  factory _Variantsmodel.fromJson(Map<String, dynamic> json) => _$VariantsmodelFromJson(json);

// String ? id,
 final  List<String> _color;
// String ? id,
@override List<String> get color {
  if (_color is EqualUnmodifiableListView) return _color;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_color);
}

 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<Map<String, dynamic>> _sizeStock;
@override List<Map<String, dynamic>> get sizeStock {
  if (_sizeStock is EqualUnmodifiableListView) return _sizeStock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizeStock);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Variantsmodel&&const DeepCollectionEquality().equals(other._color, _color)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._sizeStock, _sizeStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_color),const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_sizeStock));

@override
String toString() {
  return 'Variantsmodel(color: $color, images: $images, sizeStock: $sizeStock)';
}


}

/// @nodoc
abstract mixin class _$VariantsmodelCopyWith<$Res> implements $VariantsmodelCopyWith<$Res> {
  factory _$VariantsmodelCopyWith(_Variantsmodel value, $Res Function(_Variantsmodel) _then) = __$VariantsmodelCopyWithImpl;
@override @useResult
$Res call({
 List<String> color, List<String> images, List<Map<String, dynamic>> sizeStock
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
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,Object? images = null,Object? sizeStock = null,}) {
  return _then(_Variantsmodel(
color: null == color ? _self._color : color // ignore: cast_nullable_to_non_nullable
as List<String>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,sizeStock: null == sizeStock ? _self._sizeStock : sizeStock // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
