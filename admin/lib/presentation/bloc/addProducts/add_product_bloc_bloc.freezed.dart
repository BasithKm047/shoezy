// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_product_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddProductBlocEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductBlocEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddProductBlocEvent()';
}


}

/// @nodoc
class $AddProductBlocEventCopyWith<$Res>  {
$AddProductBlocEventCopyWith(AddProductBlocEvent _, $Res Function(AddProductBlocEvent) __);
}


/// Adds pattern-matching-related methods to [AddProductBlocEvent].
extension AddProductBlocEventPatterns on AddProductBlocEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _BrandChanged value)?  brandChanged,TResult Function( _CategorySelected value)?  categorySelected,TResult Function( _SizeSelected value)?  sizeSelected,TResult Function( _StockUpdated value)?  stockUpdated,TResult Function( _ImageAdded value)?  imageAdded,TResult Function( _ImageRemoved value)?  imageRemoved,TResult Function( _ColorChanged value)?  colorChanged,TResult Function( _NameChanged value)?  nameChanged,TResult Function( _DescriptionChanged value)?  descriptionChanged,TResult Function( _PriceChanged value)?  priceChanged,TResult Function( _Submit value)?  submit,TResult Function( _Reset value)?  reset,TResult Function( _ImagesUpdated value)?  imagesUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandChanged() when brandChanged != null:
return brandChanged(_that);case _CategorySelected() when categorySelected != null:
return categorySelected(_that);case _SizeSelected() when sizeSelected != null:
return sizeSelected(_that);case _StockUpdated() when stockUpdated != null:
return stockUpdated(_that);case _ImageAdded() when imageAdded != null:
return imageAdded(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _ColorChanged() when colorChanged != null:
return colorChanged(_that);case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _PriceChanged() when priceChanged != null:
return priceChanged(_that);case _Submit() when submit != null:
return submit(_that);case _Reset() when reset != null:
return reset(_that);case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _BrandChanged value)  brandChanged,required TResult Function( _CategorySelected value)  categorySelected,required TResult Function( _SizeSelected value)  sizeSelected,required TResult Function( _StockUpdated value)  stockUpdated,required TResult Function( _ImageAdded value)  imageAdded,required TResult Function( _ImageRemoved value)  imageRemoved,required TResult Function( _ColorChanged value)  colorChanged,required TResult Function( _NameChanged value)  nameChanged,required TResult Function( _DescriptionChanged value)  descriptionChanged,required TResult Function( _PriceChanged value)  priceChanged,required TResult Function( _Submit value)  submit,required TResult Function( _Reset value)  reset,required TResult Function( _ImagesUpdated value)  imagesUpdated,}){
final _that = this;
switch (_that) {
case _BrandChanged():
return brandChanged(_that);case _CategorySelected():
return categorySelected(_that);case _SizeSelected():
return sizeSelected(_that);case _StockUpdated():
return stockUpdated(_that);case _ImageAdded():
return imageAdded(_that);case _ImageRemoved():
return imageRemoved(_that);case _ColorChanged():
return colorChanged(_that);case _NameChanged():
return nameChanged(_that);case _DescriptionChanged():
return descriptionChanged(_that);case _PriceChanged():
return priceChanged(_that);case _Submit():
return submit(_that);case _Reset():
return reset(_that);case _ImagesUpdated():
return imagesUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _BrandChanged value)?  brandChanged,TResult? Function( _CategorySelected value)?  categorySelected,TResult? Function( _SizeSelected value)?  sizeSelected,TResult? Function( _StockUpdated value)?  stockUpdated,TResult? Function( _ImageAdded value)?  imageAdded,TResult? Function( _ImageRemoved value)?  imageRemoved,TResult? Function( _ColorChanged value)?  colorChanged,TResult? Function( _NameChanged value)?  nameChanged,TResult? Function( _DescriptionChanged value)?  descriptionChanged,TResult? Function( _PriceChanged value)?  priceChanged,TResult? Function( _Submit value)?  submit,TResult? Function( _Reset value)?  reset,TResult? Function( _ImagesUpdated value)?  imagesUpdated,}){
final _that = this;
switch (_that) {
case _BrandChanged() when brandChanged != null:
return brandChanged(_that);case _CategorySelected() when categorySelected != null:
return categorySelected(_that);case _SizeSelected() when sizeSelected != null:
return sizeSelected(_that);case _StockUpdated() when stockUpdated != null:
return stockUpdated(_that);case _ImageAdded() when imageAdded != null:
return imageAdded(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _ColorChanged() when colorChanged != null:
return colorChanged(_that);case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _PriceChanged() when priceChanged != null:
return priceChanged(_that);case _Submit() when submit != null:
return submit(_that);case _Reset() when reset != null:
return reset(_that);case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String brand)?  brandChanged,TResult Function( String category)?  categorySelected,TResult Function( String size,  bool selected)?  sizeSelected,TResult Function( String size,  String stock)?  stockUpdated,TResult Function( Uint8List image)?  imageAdded,TResult Function( int index)?  imageRemoved,TResult Function( String color)?  colorChanged,TResult Function( String name)?  nameChanged,TResult Function( String description)?  descriptionChanged,TResult Function( String price)?  priceChanged,TResult Function()?  submit,TResult Function()?  reset,TResult Function( List<Uint8List> images)?  imagesUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandChanged() when brandChanged != null:
return brandChanged(_that.brand);case _CategorySelected() when categorySelected != null:
return categorySelected(_that.category);case _SizeSelected() when sizeSelected != null:
return sizeSelected(_that.size,_that.selected);case _StockUpdated() when stockUpdated != null:
return stockUpdated(_that.size,_that.stock);case _ImageAdded() when imageAdded != null:
return imageAdded(_that.image);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.index);case _ColorChanged() when colorChanged != null:
return colorChanged(_that.color);case _NameChanged() when nameChanged != null:
return nameChanged(_that.name);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case _PriceChanged() when priceChanged != null:
return priceChanged(_that.price);case _Submit() when submit != null:
return submit();case _Reset() when reset != null:
return reset();case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String brand)  brandChanged,required TResult Function( String category)  categorySelected,required TResult Function( String size,  bool selected)  sizeSelected,required TResult Function( String size,  String stock)  stockUpdated,required TResult Function( Uint8List image)  imageAdded,required TResult Function( int index)  imageRemoved,required TResult Function( String color)  colorChanged,required TResult Function( String name)  nameChanged,required TResult Function( String description)  descriptionChanged,required TResult Function( String price)  priceChanged,required TResult Function()  submit,required TResult Function()  reset,required TResult Function( List<Uint8List> images)  imagesUpdated,}) {final _that = this;
switch (_that) {
case _BrandChanged():
return brandChanged(_that.brand);case _CategorySelected():
return categorySelected(_that.category);case _SizeSelected():
return sizeSelected(_that.size,_that.selected);case _StockUpdated():
return stockUpdated(_that.size,_that.stock);case _ImageAdded():
return imageAdded(_that.image);case _ImageRemoved():
return imageRemoved(_that.index);case _ColorChanged():
return colorChanged(_that.color);case _NameChanged():
return nameChanged(_that.name);case _DescriptionChanged():
return descriptionChanged(_that.description);case _PriceChanged():
return priceChanged(_that.price);case _Submit():
return submit();case _Reset():
return reset();case _ImagesUpdated():
return imagesUpdated(_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String brand)?  brandChanged,TResult? Function( String category)?  categorySelected,TResult? Function( String size,  bool selected)?  sizeSelected,TResult? Function( String size,  String stock)?  stockUpdated,TResult? Function( Uint8List image)?  imageAdded,TResult? Function( int index)?  imageRemoved,TResult? Function( String color)?  colorChanged,TResult? Function( String name)?  nameChanged,TResult? Function( String description)?  descriptionChanged,TResult? Function( String price)?  priceChanged,TResult? Function()?  submit,TResult? Function()?  reset,TResult? Function( List<Uint8List> images)?  imagesUpdated,}) {final _that = this;
switch (_that) {
case _BrandChanged() when brandChanged != null:
return brandChanged(_that.brand);case _CategorySelected() when categorySelected != null:
return categorySelected(_that.category);case _SizeSelected() when sizeSelected != null:
return sizeSelected(_that.size,_that.selected);case _StockUpdated() when stockUpdated != null:
return stockUpdated(_that.size,_that.stock);case _ImageAdded() when imageAdded != null:
return imageAdded(_that.image);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.index);case _ColorChanged() when colorChanged != null:
return colorChanged(_that.color);case _NameChanged() when nameChanged != null:
return nameChanged(_that.name);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case _PriceChanged() when priceChanged != null:
return priceChanged(_that.price);case _Submit() when submit != null:
return submit();case _Reset() when reset != null:
return reset();case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that.images);case _:
  return null;

}
}

}

/// @nodoc


class _BrandChanged implements AddProductBlocEvent {
  const _BrandChanged(this.brand);
  

 final  String brand;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandChangedCopyWith<_BrandChanged> get copyWith => __$BrandChangedCopyWithImpl<_BrandChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandChanged&&(identical(other.brand, brand) || other.brand == brand));
}


@override
int get hashCode => Object.hash(runtimeType,brand);

@override
String toString() {
  return 'AddProductBlocEvent.brandChanged(brand: $brand)';
}


}

/// @nodoc
abstract mixin class _$BrandChangedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$BrandChangedCopyWith(_BrandChanged value, $Res Function(_BrandChanged) _then) = __$BrandChangedCopyWithImpl;
@useResult
$Res call({
 String brand
});




}
/// @nodoc
class __$BrandChangedCopyWithImpl<$Res>
    implements _$BrandChangedCopyWith<$Res> {
  __$BrandChangedCopyWithImpl(this._self, this._then);

  final _BrandChanged _self;
  final $Res Function(_BrandChanged) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? brand = null,}) {
  return _then(_BrandChanged(
null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CategorySelected implements AddProductBlocEvent {
  const _CategorySelected(this.category);
  

 final  String category;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategorySelectedCopyWith<_CategorySelected> get copyWith => __$CategorySelectedCopyWithImpl<_CategorySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategorySelected&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'AddProductBlocEvent.categorySelected(category: $category)';
}


}

/// @nodoc
abstract mixin class _$CategorySelectedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$CategorySelectedCopyWith(_CategorySelected value, $Res Function(_CategorySelected) _then) = __$CategorySelectedCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class __$CategorySelectedCopyWithImpl<$Res>
    implements _$CategorySelectedCopyWith<$Res> {
  __$CategorySelectedCopyWithImpl(this._self, this._then);

  final _CategorySelected _self;
  final $Res Function(_CategorySelected) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_CategorySelected(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SizeSelected implements AddProductBlocEvent {
  const _SizeSelected(this.size, this.selected);
  

 final  String size;
 final  bool selected;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SizeSelectedCopyWith<_SizeSelected> get copyWith => __$SizeSelectedCopyWithImpl<_SizeSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SizeSelected&&(identical(other.size, size) || other.size == size)&&(identical(other.selected, selected) || other.selected == selected));
}


@override
int get hashCode => Object.hash(runtimeType,size,selected);

@override
String toString() {
  return 'AddProductBlocEvent.sizeSelected(size: $size, selected: $selected)';
}


}

/// @nodoc
abstract mixin class _$SizeSelectedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$SizeSelectedCopyWith(_SizeSelected value, $Res Function(_SizeSelected) _then) = __$SizeSelectedCopyWithImpl;
@useResult
$Res call({
 String size, bool selected
});




}
/// @nodoc
class __$SizeSelectedCopyWithImpl<$Res>
    implements _$SizeSelectedCopyWith<$Res> {
  __$SizeSelectedCopyWithImpl(this._self, this._then);

  final _SizeSelected _self;
  final $Res Function(_SizeSelected) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? size = null,Object? selected = null,}) {
  return _then(_SizeSelected(
null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _StockUpdated implements AddProductBlocEvent {
  const _StockUpdated(this.size, this.stock);
  

 final  String size;
 final  String stock;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockUpdatedCopyWith<_StockUpdated> get copyWith => __$StockUpdatedCopyWithImpl<_StockUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockUpdated&&(identical(other.size, size) || other.size == size)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,size,stock);

@override
String toString() {
  return 'AddProductBlocEvent.stockUpdated(size: $size, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$StockUpdatedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$StockUpdatedCopyWith(_StockUpdated value, $Res Function(_StockUpdated) _then) = __$StockUpdatedCopyWithImpl;
@useResult
$Res call({
 String size, String stock
});




}
/// @nodoc
class __$StockUpdatedCopyWithImpl<$Res>
    implements _$StockUpdatedCopyWith<$Res> {
  __$StockUpdatedCopyWithImpl(this._self, this._then);

  final _StockUpdated _self;
  final $Res Function(_StockUpdated) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? size = null,Object? stock = null,}) {
  return _then(_StockUpdated(
null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ImageAdded implements AddProductBlocEvent {
  const _ImageAdded(this.image);
  

 final  Uint8List image;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageAddedCopyWith<_ImageAdded> get copyWith => __$ImageAddedCopyWithImpl<_ImageAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageAdded&&const DeepCollectionEquality().equals(other.image, image));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(image));

@override
String toString() {
  return 'AddProductBlocEvent.imageAdded(image: $image)';
}


}

/// @nodoc
abstract mixin class _$ImageAddedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$ImageAddedCopyWith(_ImageAdded value, $Res Function(_ImageAdded) _then) = __$ImageAddedCopyWithImpl;
@useResult
$Res call({
 Uint8List image
});




}
/// @nodoc
class __$ImageAddedCopyWithImpl<$Res>
    implements _$ImageAddedCopyWith<$Res> {
  __$ImageAddedCopyWithImpl(this._self, this._then);

  final _ImageAdded _self;
  final $Res Function(_ImageAdded) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_ImageAdded(
null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

/// @nodoc


class _ImageRemoved implements AddProductBlocEvent {
  const _ImageRemoved(this.index);
  

 final  int index;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageRemovedCopyWith<_ImageRemoved> get copyWith => __$ImageRemovedCopyWithImpl<_ImageRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageRemoved&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'AddProductBlocEvent.imageRemoved(index: $index)';
}


}

/// @nodoc
abstract mixin class _$ImageRemovedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$ImageRemovedCopyWith(_ImageRemoved value, $Res Function(_ImageRemoved) _then) = __$ImageRemovedCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$ImageRemovedCopyWithImpl<$Res>
    implements _$ImageRemovedCopyWith<$Res> {
  __$ImageRemovedCopyWithImpl(this._self, this._then);

  final _ImageRemoved _self;
  final $Res Function(_ImageRemoved) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_ImageRemoved(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ColorChanged implements AddProductBlocEvent {
  const _ColorChanged(this.color);
  

 final  String color;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorChangedCopyWith<_ColorChanged> get copyWith => __$ColorChangedCopyWithImpl<_ColorChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorChanged&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'AddProductBlocEvent.colorChanged(color: $color)';
}


}

/// @nodoc
abstract mixin class _$ColorChangedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$ColorChangedCopyWith(_ColorChanged value, $Res Function(_ColorChanged) _then) = __$ColorChangedCopyWithImpl;
@useResult
$Res call({
 String color
});




}
/// @nodoc
class __$ColorChangedCopyWithImpl<$Res>
    implements _$ColorChangedCopyWith<$Res> {
  __$ColorChangedCopyWithImpl(this._self, this._then);

  final _ColorChanged _self;
  final $Res Function(_ColorChanged) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_ColorChanged(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NameChanged implements AddProductBlocEvent {
  const _NameChanged(this.name);
  

 final  String name;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NameChangedCopyWith<_NameChanged> get copyWith => __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NameChanged&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'AddProductBlocEvent.nameChanged(name: $name)';
}


}

/// @nodoc
abstract mixin class _$NameChangedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$NameChangedCopyWith(_NameChanged value, $Res Function(_NameChanged) _then) = __$NameChangedCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$NameChangedCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(this._self, this._then);

  final _NameChanged _self;
  final $Res Function(_NameChanged) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_NameChanged(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DescriptionChanged implements AddProductBlocEvent {
  const _DescriptionChanged(this.description);
  

 final  String description;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DescriptionChangedCopyWith<_DescriptionChanged> get copyWith => __$DescriptionChangedCopyWithImpl<_DescriptionChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DescriptionChanged&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'AddProductBlocEvent.descriptionChanged(description: $description)';
}


}

/// @nodoc
abstract mixin class _$DescriptionChangedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$DescriptionChangedCopyWith(_DescriptionChanged value, $Res Function(_DescriptionChanged) _then) = __$DescriptionChangedCopyWithImpl;
@useResult
$Res call({
 String description
});




}
/// @nodoc
class __$DescriptionChangedCopyWithImpl<$Res>
    implements _$DescriptionChangedCopyWith<$Res> {
  __$DescriptionChangedCopyWithImpl(this._self, this._then);

  final _DescriptionChanged _self;
  final $Res Function(_DescriptionChanged) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? description = null,}) {
  return _then(_DescriptionChanged(
null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PriceChanged implements AddProductBlocEvent {
  const _PriceChanged(this.price);
  

 final  String price;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceChangedCopyWith<_PriceChanged> get copyWith => __$PriceChangedCopyWithImpl<_PriceChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceChanged&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,price);

@override
String toString() {
  return 'AddProductBlocEvent.priceChanged(price: $price)';
}


}

/// @nodoc
abstract mixin class _$PriceChangedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$PriceChangedCopyWith(_PriceChanged value, $Res Function(_PriceChanged) _then) = __$PriceChangedCopyWithImpl;
@useResult
$Res call({
 String price
});




}
/// @nodoc
class __$PriceChangedCopyWithImpl<$Res>
    implements _$PriceChangedCopyWith<$Res> {
  __$PriceChangedCopyWithImpl(this._self, this._then);

  final _PriceChanged _self;
  final $Res Function(_PriceChanged) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? price = null,}) {
  return _then(_PriceChanged(
null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Submit implements AddProductBlocEvent {
  const _Submit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddProductBlocEvent.submit()';
}


}




/// @nodoc


class _Reset implements AddProductBlocEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddProductBlocEvent.reset()';
}


}




/// @nodoc


class _ImagesUpdated implements AddProductBlocEvent {
  const _ImagesUpdated(final  List<Uint8List> images): _images = images;
  

 final  List<Uint8List> _images;
 List<Uint8List> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImagesUpdatedCopyWith<_ImagesUpdated> get copyWith => __$ImagesUpdatedCopyWithImpl<_ImagesUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImagesUpdated&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'AddProductBlocEvent.imagesUpdated(images: $images)';
}


}

/// @nodoc
abstract mixin class _$ImagesUpdatedCopyWith<$Res> implements $AddProductBlocEventCopyWith<$Res> {
  factory _$ImagesUpdatedCopyWith(_ImagesUpdated value, $Res Function(_ImagesUpdated) _then) = __$ImagesUpdatedCopyWithImpl;
@useResult
$Res call({
 List<Uint8List> images
});




}
/// @nodoc
class __$ImagesUpdatedCopyWithImpl<$Res>
    implements _$ImagesUpdatedCopyWith<$Res> {
  __$ImagesUpdatedCopyWithImpl(this._self, this._then);

  final _ImagesUpdated _self;
  final $Res Function(_ImagesUpdated) _then;

/// Create a copy of AddProductBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(_ImagesUpdated(
null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

/// @nodoc
mixin _$AddProductBlocState {

 String get productName; List<Uint8List> get productImage; String get price; String get productDescription; Map<String, int?> get sizeStockMap; CategoryModel? get selectedCategory; Brandmodel? get selectedBrand; List<String> get selectedSizes; List<String> get availableColors; String get selectedColor; String get productStock; List<CategoryModel> get availableCategories; List<Brandmodel> get availableBrands; List<String> get availableSize; bool get isSubmitting; bool get isSuccess; String? get errorMessage;
/// Create a copy of AddProductBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddProductBlocStateCopyWith<AddProductBlocState> get copyWith => _$AddProductBlocStateCopyWithImpl<AddProductBlocState>(this as AddProductBlocState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProductBlocState&&(identical(other.productName, productName) || other.productName == productName)&&const DeepCollectionEquality().equals(other.productImage, productImage)&&(identical(other.price, price) || other.price == price)&&(identical(other.productDescription, productDescription) || other.productDescription == productDescription)&&const DeepCollectionEquality().equals(other.sizeStockMap, sizeStockMap)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.selectedBrand, selectedBrand) || other.selectedBrand == selectedBrand)&&const DeepCollectionEquality().equals(other.selectedSizes, selectedSizes)&&const DeepCollectionEquality().equals(other.availableColors, availableColors)&&(identical(other.selectedColor, selectedColor) || other.selectedColor == selectedColor)&&(identical(other.productStock, productStock) || other.productStock == productStock)&&const DeepCollectionEquality().equals(other.availableCategories, availableCategories)&&const DeepCollectionEquality().equals(other.availableBrands, availableBrands)&&const DeepCollectionEquality().equals(other.availableSize, availableSize)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,productName,const DeepCollectionEquality().hash(productImage),price,productDescription,const DeepCollectionEquality().hash(sizeStockMap),selectedCategory,selectedBrand,const DeepCollectionEquality().hash(selectedSizes),const DeepCollectionEquality().hash(availableColors),selectedColor,productStock,const DeepCollectionEquality().hash(availableCategories),const DeepCollectionEquality().hash(availableBrands),const DeepCollectionEquality().hash(availableSize),isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'AddProductBlocState(productName: $productName, productImage: $productImage, price: $price, productDescription: $productDescription, sizeStockMap: $sizeStockMap, selectedCategory: $selectedCategory, selectedBrand: $selectedBrand, selectedSizes: $selectedSizes, availableColors: $availableColors, selectedColor: $selectedColor, productStock: $productStock, availableCategories: $availableCategories, availableBrands: $availableBrands, availableSize: $availableSize, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AddProductBlocStateCopyWith<$Res>  {
  factory $AddProductBlocStateCopyWith(AddProductBlocState value, $Res Function(AddProductBlocState) _then) = _$AddProductBlocStateCopyWithImpl;
@useResult
$Res call({
 String productName, List<Uint8List> productImage, String price, String productDescription, Map<String, int?> sizeStockMap, CategoryModel? selectedCategory, Brandmodel? selectedBrand, List<String> selectedSizes, List<String> availableColors, String selectedColor, String productStock, List<CategoryModel> availableCategories, List<Brandmodel> availableBrands, List<String> availableSize, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$AddProductBlocStateCopyWithImpl<$Res>
    implements $AddProductBlocStateCopyWith<$Res> {
  _$AddProductBlocStateCopyWithImpl(this._self, this._then);

  final AddProductBlocState _self;
  final $Res Function(AddProductBlocState) _then;

/// Create a copy of AddProductBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = null,Object? productImage = null,Object? price = null,Object? productDescription = null,Object? sizeStockMap = null,Object? selectedCategory = freezed,Object? selectedBrand = freezed,Object? selectedSizes = null,Object? availableColors = null,Object? selectedColor = null,Object? productStock = null,Object? availableCategories = null,Object? availableBrands = null,Object? availableSize = null,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productImage: null == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,productDescription: null == productDescription ? _self.productDescription : productDescription // ignore: cast_nullable_to_non_nullable
as String,sizeStockMap: null == sizeStockMap ? _self.sizeStockMap : sizeStockMap // ignore: cast_nullable_to_non_nullable
as Map<String, int?>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as CategoryModel?,selectedBrand: freezed == selectedBrand ? _self.selectedBrand : selectedBrand // ignore: cast_nullable_to_non_nullable
as Brandmodel?,selectedSizes: null == selectedSizes ? _self.selectedSizes : selectedSizes // ignore: cast_nullable_to_non_nullable
as List<String>,availableColors: null == availableColors ? _self.availableColors : availableColors // ignore: cast_nullable_to_non_nullable
as List<String>,selectedColor: null == selectedColor ? _self.selectedColor : selectedColor // ignore: cast_nullable_to_non_nullable
as String,productStock: null == productStock ? _self.productStock : productStock // ignore: cast_nullable_to_non_nullable
as String,availableCategories: null == availableCategories ? _self.availableCategories : availableCategories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,availableBrands: null == availableBrands ? _self.availableBrands : availableBrands // ignore: cast_nullable_to_non_nullable
as List<Brandmodel>,availableSize: null == availableSize ? _self.availableSize : availableSize // ignore: cast_nullable_to_non_nullable
as List<String>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddProductBlocState].
extension AddProductBlocStatePatterns on AddProductBlocState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddProductBlocState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddProductBlocState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddProductBlocState value)  $default,){
final _that = this;
switch (_that) {
case _AddProductBlocState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddProductBlocState value)?  $default,){
final _that = this;
switch (_that) {
case _AddProductBlocState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productName,  List<Uint8List> productImage,  String price,  String productDescription,  Map<String, int?> sizeStockMap,  CategoryModel? selectedCategory,  Brandmodel? selectedBrand,  List<String> selectedSizes,  List<String> availableColors,  String selectedColor,  String productStock,  List<CategoryModel> availableCategories,  List<Brandmodel> availableBrands,  List<String> availableSize,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddProductBlocState() when $default != null:
return $default(_that.productName,_that.productImage,_that.price,_that.productDescription,_that.sizeStockMap,_that.selectedCategory,_that.selectedBrand,_that.selectedSizes,_that.availableColors,_that.selectedColor,_that.productStock,_that.availableCategories,_that.availableBrands,_that.availableSize,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productName,  List<Uint8List> productImage,  String price,  String productDescription,  Map<String, int?> sizeStockMap,  CategoryModel? selectedCategory,  Brandmodel? selectedBrand,  List<String> selectedSizes,  List<String> availableColors,  String selectedColor,  String productStock,  List<CategoryModel> availableCategories,  List<Brandmodel> availableBrands,  List<String> availableSize,  bool isSubmitting,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AddProductBlocState():
return $default(_that.productName,_that.productImage,_that.price,_that.productDescription,_that.sizeStockMap,_that.selectedCategory,_that.selectedBrand,_that.selectedSizes,_that.availableColors,_that.selectedColor,_that.productStock,_that.availableCategories,_that.availableBrands,_that.availableSize,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productName,  List<Uint8List> productImage,  String price,  String productDescription,  Map<String, int?> sizeStockMap,  CategoryModel? selectedCategory,  Brandmodel? selectedBrand,  List<String> selectedSizes,  List<String> availableColors,  String selectedColor,  String productStock,  List<CategoryModel> availableCategories,  List<Brandmodel> availableBrands,  List<String> availableSize,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AddProductBlocState() when $default != null:
return $default(_that.productName,_that.productImage,_that.price,_that.productDescription,_that.sizeStockMap,_that.selectedCategory,_that.selectedBrand,_that.selectedSizes,_that.availableColors,_that.selectedColor,_that.productStock,_that.availableCategories,_that.availableBrands,_that.availableSize,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AddProductBlocState implements AddProductBlocState {
  const _AddProductBlocState({required this.productName, required final  List<Uint8List> productImage, required this.price, required this.productDescription, required final  Map<String, int?> sizeStockMap, required this.selectedCategory, required this.selectedBrand, required final  List<String> selectedSizes, required final  List<String> availableColors, required this.selectedColor, required this.productStock, required final  List<CategoryModel> availableCategories, required final  List<Brandmodel> availableBrands, required final  List<String> availableSize, required this.isSubmitting, required this.isSuccess, required this.errorMessage}): _productImage = productImage,_sizeStockMap = sizeStockMap,_selectedSizes = selectedSizes,_availableColors = availableColors,_availableCategories = availableCategories,_availableBrands = availableBrands,_availableSize = availableSize;
  

@override final  String productName;
 final  List<Uint8List> _productImage;
@override List<Uint8List> get productImage {
  if (_productImage is EqualUnmodifiableListView) return _productImage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productImage);
}

@override final  String price;
@override final  String productDescription;
 final  Map<String, int?> _sizeStockMap;
@override Map<String, int?> get sizeStockMap {
  if (_sizeStockMap is EqualUnmodifiableMapView) return _sizeStockMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sizeStockMap);
}

@override final  CategoryModel? selectedCategory;
@override final  Brandmodel? selectedBrand;
 final  List<String> _selectedSizes;
@override List<String> get selectedSizes {
  if (_selectedSizes is EqualUnmodifiableListView) return _selectedSizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedSizes);
}

 final  List<String> _availableColors;
@override List<String> get availableColors {
  if (_availableColors is EqualUnmodifiableListView) return _availableColors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableColors);
}

@override final  String selectedColor;
@override final  String productStock;
 final  List<CategoryModel> _availableCategories;
@override List<CategoryModel> get availableCategories {
  if (_availableCategories is EqualUnmodifiableListView) return _availableCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableCategories);
}

 final  List<Brandmodel> _availableBrands;
@override List<Brandmodel> get availableBrands {
  if (_availableBrands is EqualUnmodifiableListView) return _availableBrands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableBrands);
}

 final  List<String> _availableSize;
@override List<String> get availableSize {
  if (_availableSize is EqualUnmodifiableListView) return _availableSize;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableSize);
}

@override final  bool isSubmitting;
@override final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of AddProductBlocState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddProductBlocStateCopyWith<_AddProductBlocState> get copyWith => __$AddProductBlocStateCopyWithImpl<_AddProductBlocState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddProductBlocState&&(identical(other.productName, productName) || other.productName == productName)&&const DeepCollectionEquality().equals(other._productImage, _productImage)&&(identical(other.price, price) || other.price == price)&&(identical(other.productDescription, productDescription) || other.productDescription == productDescription)&&const DeepCollectionEquality().equals(other._sizeStockMap, _sizeStockMap)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.selectedBrand, selectedBrand) || other.selectedBrand == selectedBrand)&&const DeepCollectionEquality().equals(other._selectedSizes, _selectedSizes)&&const DeepCollectionEquality().equals(other._availableColors, _availableColors)&&(identical(other.selectedColor, selectedColor) || other.selectedColor == selectedColor)&&(identical(other.productStock, productStock) || other.productStock == productStock)&&const DeepCollectionEquality().equals(other._availableCategories, _availableCategories)&&const DeepCollectionEquality().equals(other._availableBrands, _availableBrands)&&const DeepCollectionEquality().equals(other._availableSize, _availableSize)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,productName,const DeepCollectionEquality().hash(_productImage),price,productDescription,const DeepCollectionEquality().hash(_sizeStockMap),selectedCategory,selectedBrand,const DeepCollectionEquality().hash(_selectedSizes),const DeepCollectionEquality().hash(_availableColors),selectedColor,productStock,const DeepCollectionEquality().hash(_availableCategories),const DeepCollectionEquality().hash(_availableBrands),const DeepCollectionEquality().hash(_availableSize),isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'AddProductBlocState(productName: $productName, productImage: $productImage, price: $price, productDescription: $productDescription, sizeStockMap: $sizeStockMap, selectedCategory: $selectedCategory, selectedBrand: $selectedBrand, selectedSizes: $selectedSizes, availableColors: $availableColors, selectedColor: $selectedColor, productStock: $productStock, availableCategories: $availableCategories, availableBrands: $availableBrands, availableSize: $availableSize, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AddProductBlocStateCopyWith<$Res> implements $AddProductBlocStateCopyWith<$Res> {
  factory _$AddProductBlocStateCopyWith(_AddProductBlocState value, $Res Function(_AddProductBlocState) _then) = __$AddProductBlocStateCopyWithImpl;
@override @useResult
$Res call({
 String productName, List<Uint8List> productImage, String price, String productDescription, Map<String, int?> sizeStockMap, CategoryModel? selectedCategory, Brandmodel? selectedBrand, List<String> selectedSizes, List<String> availableColors, String selectedColor, String productStock, List<CategoryModel> availableCategories, List<Brandmodel> availableBrands, List<String> availableSize, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$AddProductBlocStateCopyWithImpl<$Res>
    implements _$AddProductBlocStateCopyWith<$Res> {
  __$AddProductBlocStateCopyWithImpl(this._self, this._then);

  final _AddProductBlocState _self;
  final $Res Function(_AddProductBlocState) _then;

/// Create a copy of AddProductBlocState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = null,Object? productImage = null,Object? price = null,Object? productDescription = null,Object? sizeStockMap = null,Object? selectedCategory = freezed,Object? selectedBrand = freezed,Object? selectedSizes = null,Object? availableColors = null,Object? selectedColor = null,Object? productStock = null,Object? availableCategories = null,Object? availableBrands = null,Object? availableSize = null,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_AddProductBlocState(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productImage: null == productImage ? _self._productImage : productImage // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,productDescription: null == productDescription ? _self.productDescription : productDescription // ignore: cast_nullable_to_non_nullable
as String,sizeStockMap: null == sizeStockMap ? _self._sizeStockMap : sizeStockMap // ignore: cast_nullable_to_non_nullable
as Map<String, int?>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as CategoryModel?,selectedBrand: freezed == selectedBrand ? _self.selectedBrand : selectedBrand // ignore: cast_nullable_to_non_nullable
as Brandmodel?,selectedSizes: null == selectedSizes ? _self._selectedSizes : selectedSizes // ignore: cast_nullable_to_non_nullable
as List<String>,availableColors: null == availableColors ? _self._availableColors : availableColors // ignore: cast_nullable_to_non_nullable
as List<String>,selectedColor: null == selectedColor ? _self.selectedColor : selectedColor // ignore: cast_nullable_to_non_nullable
as String,productStock: null == productStock ? _self.productStock : productStock // ignore: cast_nullable_to_non_nullable
as String,availableCategories: null == availableCategories ? _self._availableCategories : availableCategories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,availableBrands: null == availableBrands ? _self._availableBrands : availableBrands // ignore: cast_nullable_to_non_nullable
as List<Brandmodel>,availableSize: null == availableSize ? _self._availableSize : availableSize // ignore: cast_nullable_to_non_nullable
as List<String>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
