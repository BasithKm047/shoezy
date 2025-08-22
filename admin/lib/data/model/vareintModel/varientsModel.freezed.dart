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
mixin _$Varientsmodel {

 String get color; List<String> get images; int get size; List<int> get stock;
/// Create a copy of Varientsmodel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VarientsmodelCopyWith<Varientsmodel> get copyWith => _$VarientsmodelCopyWithImpl<Varientsmodel>(this as Varientsmodel, _$identity);

  /// Serializes this Varientsmodel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Varientsmodel&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.stock, stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,const DeepCollectionEquality().hash(images),size,const DeepCollectionEquality().hash(stock));

@override
String toString() {
  return 'Varientsmodel(color: $color, images: $images, size: $size, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $VarientsmodelCopyWith<$Res>  {
  factory $VarientsmodelCopyWith(Varientsmodel value, $Res Function(Varientsmodel) _then) = _$VarientsmodelCopyWithImpl;
@useResult
$Res call({
 String color, List<String> images, int size, List<int> stock
});




}
/// @nodoc
class _$VarientsmodelCopyWithImpl<$Res>
    implements $VarientsmodelCopyWith<$Res> {
  _$VarientsmodelCopyWithImpl(this._self, this._then);

  final Varientsmodel _self;
  final $Res Function(Varientsmodel) _then;

/// Create a copy of Varientsmodel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,Object? images = null,Object? size = null,Object? stock = null,}) {
  return _then(_self.copyWith(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [Varientsmodel].
extension VarientsmodelPatterns on Varientsmodel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Varientsmodel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Varientsmodel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Varientsmodel value)  $default,){
final _that = this;
switch (_that) {
case _Varientsmodel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Varientsmodel value)?  $default,){
final _that = this;
switch (_that) {
case _Varientsmodel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String color,  List<String> images,  int size,  List<int> stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Varientsmodel() when $default != null:
return $default(_that.color,_that.images,_that.size,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String color,  List<String> images,  int size,  List<int> stock)  $default,) {final _that = this;
switch (_that) {
case _Varientsmodel():
return $default(_that.color,_that.images,_that.size,_that.stock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String color,  List<String> images,  int size,  List<int> stock)?  $default,) {final _that = this;
switch (_that) {
case _Varientsmodel() when $default != null:
return $default(_that.color,_that.images,_that.size,_that.stock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Varientsmodel implements Varientsmodel {
   _Varientsmodel({required this.color, required final  List<String> images, required this.size, required final  List<int> stock}): _images = images,_stock = stock;
  factory _Varientsmodel.fromJson(Map<String, dynamic> json) => _$VarientsmodelFromJson(json);

@override final  String color;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  int size;
 final  List<int> _stock;
@override List<int> get stock {
  if (_stock is EqualUnmodifiableListView) return _stock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stock);
}


/// Create a copy of Varientsmodel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VarientsmodelCopyWith<_Varientsmodel> get copyWith => __$VarientsmodelCopyWithImpl<_Varientsmodel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VarientsmodelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Varientsmodel&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._stock, _stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,const DeepCollectionEquality().hash(_images),size,const DeepCollectionEquality().hash(_stock));

@override
String toString() {
  return 'Varientsmodel(color: $color, images: $images, size: $size, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$VarientsmodelCopyWith<$Res> implements $VarientsmodelCopyWith<$Res> {
  factory _$VarientsmodelCopyWith(_Varientsmodel value, $Res Function(_Varientsmodel) _then) = __$VarientsmodelCopyWithImpl;
@override @useResult
$Res call({
 String color, List<String> images, int size, List<int> stock
});




}
/// @nodoc
class __$VarientsmodelCopyWithImpl<$Res>
    implements _$VarientsmodelCopyWith<$Res> {
  __$VarientsmodelCopyWithImpl(this._self, this._then);

  final _Varientsmodel _self;
  final $Res Function(_Varientsmodel) _then;

/// Create a copy of Varientsmodel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,Object? images = null,Object? size = null,Object? stock = null,}) {
  return _then(_Varientsmodel(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self._stock : stock // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
