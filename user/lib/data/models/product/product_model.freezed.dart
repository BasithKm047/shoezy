// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

 String? get id; String get productName; String get brandName; String get categoryName; String get price; String get description; List<String> get color; List<String> get size; List<String> get image; List<String> get stock; String get tag; String get gender; DateTime get createdAt;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.color, color)&&const DeepCollectionEquality().equals(other.size, size)&&const DeepCollectionEquality().equals(other.image, image)&&const DeepCollectionEquality().equals(other.stock, stock)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productName,brandName,categoryName,price,description,const DeepCollectionEquality().hash(color),const DeepCollectionEquality().hash(size),const DeepCollectionEquality().hash(image),const DeepCollectionEquality().hash(stock),tag,gender,createdAt);

@override
String toString() {
  return 'ProductModel(id: $id, productName: $productName, brandName: $brandName, categoryName: $categoryName, price: $price, description: $description, color: $color, size: $size, image: $image, stock: $stock, tag: $tag, gender: $gender, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 String? id, String productName, String brandName, String categoryName, String price, String description, List<String> color, List<String> size, List<String> image, List<String> stock, String tag, String gender, DateTime createdAt
});




}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? productName = null,Object? brandName = null,Object? categoryName = null,Object? price = null,Object? description = null,Object? color = null,Object? size = null,Object? image = null,Object? stock = null,Object? tag = null,Object? gender = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as List<String>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as List<String>,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as List<String>,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String productName,  String brandName,  String categoryName,  String price,  String description,  List<String> color,  List<String> size,  List<String> image,  List<String> stock,  String tag,  String gender,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.productName,_that.brandName,_that.categoryName,_that.price,_that.description,_that.color,_that.size,_that.image,_that.stock,_that.tag,_that.gender,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String productName,  String brandName,  String categoryName,  String price,  String description,  List<String> color,  List<String> size,  List<String> image,  List<String> stock,  String tag,  String gender,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.productName,_that.brandName,_that.categoryName,_that.price,_that.description,_that.color,_that.size,_that.image,_that.stock,_that.tag,_that.gender,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String productName,  String brandName,  String categoryName,  String price,  String description,  List<String> color,  List<String> size,  List<String> image,  List<String> stock,  String tag,  String gender,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.productName,_that.brandName,_that.categoryName,_that.price,_that.description,_that.color,_that.size,_that.image,_that.stock,_that.tag,_that.gender,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel implements ProductModel {
  const _ProductModel({this.id, required this.productName, required this.brandName, required this.categoryName, required this.price, required this.description, required final  List<String> color, required final  List<String> size, required final  List<String> image, required final  List<String> stock, required this.tag, required this.gender, required this.createdAt}): _color = color,_size = size,_image = image,_stock = stock;
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override final  String? id;
@override final  String productName;
@override final  String brandName;
@override final  String categoryName;
@override final  String price;
@override final  String description;
 final  List<String> _color;
@override List<String> get color {
  if (_color is EqualUnmodifiableListView) return _color;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_color);
}

 final  List<String> _size;
@override List<String> get size {
  if (_size is EqualUnmodifiableListView) return _size;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_size);
}

 final  List<String> _image;
@override List<String> get image {
  if (_image is EqualUnmodifiableListView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_image);
}

 final  List<String> _stock;
@override List<String> get stock {
  if (_stock is EqualUnmodifiableListView) return _stock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stock);
}

@override final  String tag;
@override final  String gender;
@override final  DateTime createdAt;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._color, _color)&&const DeepCollectionEquality().equals(other._size, _size)&&const DeepCollectionEquality().equals(other._image, _image)&&const DeepCollectionEquality().equals(other._stock, _stock)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productName,brandName,categoryName,price,description,const DeepCollectionEquality().hash(_color),const DeepCollectionEquality().hash(_size),const DeepCollectionEquality().hash(_image),const DeepCollectionEquality().hash(_stock),tag,gender,createdAt);

@override
String toString() {
  return 'ProductModel(id: $id, productName: $productName, brandName: $brandName, categoryName: $categoryName, price: $price, description: $description, color: $color, size: $size, image: $image, stock: $stock, tag: $tag, gender: $gender, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String productName, String brandName, String categoryName, String price, String description, List<String> color, List<String> size, List<String> image, List<String> stock, String tag, String gender, DateTime createdAt
});




}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? productName = null,Object? brandName = null,Object? categoryName = null,Object? price = null,Object? description = null,Object? color = null,Object? size = null,Object? image = null,Object? stock = null,Object? tag = null,Object? gender = null,Object? createdAt = null,}) {
  return _then(_ProductModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self._color : color // ignore: cast_nullable_to_non_nullable
as List<String>,size: null == size ? _self._size : size // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as List<String>,stock: null == stock ? _self._stock : stock // ignore: cast_nullable_to_non_nullable
as List<String>,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
