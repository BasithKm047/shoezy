// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'size_stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SizeStockModel {

 String? get id; String get size; int get stock;
/// Create a copy of SizeStockModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SizeStockModelCopyWith<SizeStockModel> get copyWith => _$SizeStockModelCopyWithImpl<SizeStockModel>(this as SizeStockModel, _$identity);

  /// Serializes this SizeStockModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizeStockModel&&(identical(other.id, id) || other.id == id)&&(identical(other.size, size) || other.size == size)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,size,stock);

@override
String toString() {
  return 'SizeStockModel(id: $id, size: $size, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $SizeStockModelCopyWith<$Res>  {
  factory $SizeStockModelCopyWith(SizeStockModel value, $Res Function(SizeStockModel) _then) = _$SizeStockModelCopyWithImpl;
@useResult
$Res call({
 String? id, String size, int stock
});




}
/// @nodoc
class _$SizeStockModelCopyWithImpl<$Res>
    implements $SizeStockModelCopyWith<$Res> {
  _$SizeStockModelCopyWithImpl(this._self, this._then);

  final SizeStockModel _self;
  final $Res Function(SizeStockModel) _then;

/// Create a copy of SizeStockModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? size = null,Object? stock = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SizeStockModel].
extension SizeStockModelPatterns on SizeStockModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SizeStockModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SizeStockModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SizeStockModel value)  $default,){
final _that = this;
switch (_that) {
case _SizeStockModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SizeStockModel value)?  $default,){
final _that = this;
switch (_that) {
case _SizeStockModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String size,  int stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SizeStockModel() when $default != null:
return $default(_that.id,_that.size,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String size,  int stock)  $default,) {final _that = this;
switch (_that) {
case _SizeStockModel():
return $default(_that.id,_that.size,_that.stock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String size,  int stock)?  $default,) {final _that = this;
switch (_that) {
case _SizeStockModel() when $default != null:
return $default(_that.id,_that.size,_that.stock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SizeStockModel implements SizeStockModel {
   _SizeStockModel({this.id, required this.size, required this.stock});
  factory _SizeStockModel.fromJson(Map<String, dynamic> json) => _$SizeStockModelFromJson(json);

@override final  String? id;
@override final  String size;
@override final  int stock;

/// Create a copy of SizeStockModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SizeStockModelCopyWith<_SizeStockModel> get copyWith => __$SizeStockModelCopyWithImpl<_SizeStockModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SizeStockModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SizeStockModel&&(identical(other.id, id) || other.id == id)&&(identical(other.size, size) || other.size == size)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,size,stock);

@override
String toString() {
  return 'SizeStockModel(id: $id, size: $size, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$SizeStockModelCopyWith<$Res> implements $SizeStockModelCopyWith<$Res> {
  factory _$SizeStockModelCopyWith(_SizeStockModel value, $Res Function(_SizeStockModel) _then) = __$SizeStockModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String size, int stock
});




}
/// @nodoc
class __$SizeStockModelCopyWithImpl<$Res>
    implements _$SizeStockModelCopyWith<$Res> {
  __$SizeStockModelCopyWithImpl(this._self, this._then);

  final _SizeStockModel _self;
  final $Res Function(_SizeStockModel) _then;

/// Create a copy of SizeStockModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? size = null,Object? stock = null,}) {
  return _then(_SizeStockModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
