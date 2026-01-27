// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailsState {

 String get selectedColor; String get selectedImage; String? get selectedSize;
/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailsStateCopyWith<ProductDetailsState> get copyWith => _$ProductDetailsStateCopyWithImpl<ProductDetailsState>(this as ProductDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsState&&(identical(other.selectedColor, selectedColor) || other.selectedColor == selectedColor)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.selectedSize, selectedSize) || other.selectedSize == selectedSize));
}


@override
int get hashCode => Object.hash(runtimeType,selectedColor,selectedImage,selectedSize);

@override
String toString() {
  return 'ProductDetailsState(selectedColor: $selectedColor, selectedImage: $selectedImage, selectedSize: $selectedSize)';
}


}

/// @nodoc
abstract mixin class $ProductDetailsStateCopyWith<$Res>  {
  factory $ProductDetailsStateCopyWith(ProductDetailsState value, $Res Function(ProductDetailsState) _then) = _$ProductDetailsStateCopyWithImpl;
@useResult
$Res call({
 String selectedColor, String selectedImage, String? selectedSize
});




}
/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._self, this._then);

  final ProductDetailsState _self;
  final $Res Function(ProductDetailsState) _then;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedColor = null,Object? selectedImage = null,Object? selectedSize = freezed,}) {
  return _then(_self.copyWith(
selectedColor: null == selectedColor ? _self.selectedColor : selectedColor // ignore: cast_nullable_to_non_nullable
as String,selectedImage: null == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as String,selectedSize: freezed == selectedSize ? _self.selectedSize : selectedSize // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetailsState].
extension ProductDetailsStatePatterns on ProductDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selectedColor,  String selectedImage,  String? selectedSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
return $default(_that.selectedColor,_that.selectedImage,_that.selectedSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selectedColor,  String selectedImage,  String? selectedSize)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsState():
return $default(_that.selectedColor,_that.selectedImage,_that.selectedSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selectedColor,  String selectedImage,  String? selectedSize)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
return $default(_that.selectedColor,_that.selectedImage,_that.selectedSize);case _:
  return null;

}
}

}

/// @nodoc


class _ProductDetailsState implements ProductDetailsState {
  const _ProductDetailsState({required this.selectedColor, required this.selectedImage, this.selectedSize});
  

@override final  String selectedColor;
@override final  String selectedImage;
@override final  String? selectedSize;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailsStateCopyWith<_ProductDetailsState> get copyWith => __$ProductDetailsStateCopyWithImpl<_ProductDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailsState&&(identical(other.selectedColor, selectedColor) || other.selectedColor == selectedColor)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.selectedSize, selectedSize) || other.selectedSize == selectedSize));
}


@override
int get hashCode => Object.hash(runtimeType,selectedColor,selectedImage,selectedSize);

@override
String toString() {
  return 'ProductDetailsState(selectedColor: $selectedColor, selectedImage: $selectedImage, selectedSize: $selectedSize)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailsStateCopyWith<$Res> implements $ProductDetailsStateCopyWith<$Res> {
  factory _$ProductDetailsStateCopyWith(_ProductDetailsState value, $Res Function(_ProductDetailsState) _then) = __$ProductDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 String selectedColor, String selectedImage, String? selectedSize
});




}
/// @nodoc
class __$ProductDetailsStateCopyWithImpl<$Res>
    implements _$ProductDetailsStateCopyWith<$Res> {
  __$ProductDetailsStateCopyWithImpl(this._self, this._then);

  final _ProductDetailsState _self;
  final $Res Function(_ProductDetailsState) _then;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedColor = null,Object? selectedImage = null,Object? selectedSize = freezed,}) {
  return _then(_ProductDetailsState(
selectedColor: null == selectedColor ? _self.selectedColor : selectedColor // ignore: cast_nullable_to_non_nullable
as String,selectedImage: null == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as String,selectedSize: freezed == selectedSize ? _self.selectedSize : selectedSize // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
