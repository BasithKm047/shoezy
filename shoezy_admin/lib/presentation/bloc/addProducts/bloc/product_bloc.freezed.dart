// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddProduct value)?  addProduct,TResult Function( _RemoveProduct value)?  removeProduct,TResult Function( _UpdateProduct value)?  updateProduct,TResult Function( _UploadImage value)?  uploadImage,TResult Function( _RemoveImage value)?  removeImage,TResult Function( _GetProduct value)?  getProduct,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddProduct() when addProduct != null:
return addProduct(_that);case _RemoveProduct() when removeProduct != null:
return removeProduct(_that);case _UpdateProduct() when updateProduct != null:
return updateProduct(_that);case _UploadImage() when uploadImage != null:
return uploadImage(_that);case _RemoveImage() when removeImage != null:
return removeImage(_that);case _GetProduct() when getProduct != null:
return getProduct(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddProduct value)  addProduct,required TResult Function( _RemoveProduct value)  removeProduct,required TResult Function( _UpdateProduct value)  updateProduct,required TResult Function( _UploadImage value)  uploadImage,required TResult Function( _RemoveImage value)  removeImage,required TResult Function( _GetProduct value)  getProduct,}){
final _that = this;
switch (_that) {
case _AddProduct():
return addProduct(_that);case _RemoveProduct():
return removeProduct(_that);case _UpdateProduct():
return updateProduct(_that);case _UploadImage():
return uploadImage(_that);case _RemoveImage():
return removeImage(_that);case _GetProduct():
return getProduct(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddProduct value)?  addProduct,TResult? Function( _RemoveProduct value)?  removeProduct,TResult? Function( _UpdateProduct value)?  updateProduct,TResult? Function( _UploadImage value)?  uploadImage,TResult? Function( _RemoveImage value)?  removeImage,TResult? Function( _GetProduct value)?  getProduct,}){
final _that = this;
switch (_that) {
case _AddProduct() when addProduct != null:
return addProduct(_that);case _RemoveProduct() when removeProduct != null:
return removeProduct(_that);case _UpdateProduct() when updateProduct != null:
return updateProduct(_that);case _UploadImage() when uploadImage != null:
return uploadImage(_that);case _RemoveImage() when removeImage != null:
return removeImage(_that);case _GetProduct() when getProduct != null:
return getProduct(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProductModel product)?  addProduct,TResult Function()?  removeProduct,TResult Function()?  updateProduct,TResult Function( List<Uint8List> images)?  uploadImage,TResult Function( int index)?  removeImage,TResult Function()?  getProduct,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddProduct() when addProduct != null:
return addProduct(_that.product);case _RemoveProduct() when removeProduct != null:
return removeProduct();case _UpdateProduct() when updateProduct != null:
return updateProduct();case _UploadImage() when uploadImage != null:
return uploadImage(_that.images);case _RemoveImage() when removeImage != null:
return removeImage(_that.index);case _GetProduct() when getProduct != null:
return getProduct();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProductModel product)  addProduct,required TResult Function()  removeProduct,required TResult Function()  updateProduct,required TResult Function( List<Uint8List> images)  uploadImage,required TResult Function( int index)  removeImage,required TResult Function()  getProduct,}) {final _that = this;
switch (_that) {
case _AddProduct():
return addProduct(_that.product);case _RemoveProduct():
return removeProduct();case _UpdateProduct():
return updateProduct();case _UploadImage():
return uploadImage(_that.images);case _RemoveImage():
return removeImage(_that.index);case _GetProduct():
return getProduct();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProductModel product)?  addProduct,TResult? Function()?  removeProduct,TResult? Function()?  updateProduct,TResult? Function( List<Uint8List> images)?  uploadImage,TResult? Function( int index)?  removeImage,TResult? Function()?  getProduct,}) {final _that = this;
switch (_that) {
case _AddProduct() when addProduct != null:
return addProduct(_that.product);case _RemoveProduct() when removeProduct != null:
return removeProduct();case _UpdateProduct() when updateProduct != null:
return updateProduct();case _UploadImage() when uploadImage != null:
return uploadImage(_that.images);case _RemoveImage() when removeImage != null:
return removeImage(_that.index);case _GetProduct() when getProduct != null:
return getProduct();case _:
  return null;

}
}

}

/// @nodoc


class _AddProduct implements ProductEvent {
  const _AddProduct({required this.product});
  

 final  ProductModel product;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddProductCopyWith<_AddProduct> get copyWith => __$AddProductCopyWithImpl<_AddProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddProduct&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'ProductEvent.addProduct(product: $product)';
}


}

/// @nodoc
abstract mixin class _$AddProductCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$AddProductCopyWith(_AddProduct value, $Res Function(_AddProduct) _then) = __$AddProductCopyWithImpl;
@useResult
$Res call({
 ProductModel product
});


$ProductModelCopyWith<$Res> get product;

}
/// @nodoc
class __$AddProductCopyWithImpl<$Res>
    implements _$AddProductCopyWith<$Res> {
  __$AddProductCopyWithImpl(this._self, this._then);

  final _AddProduct _self;
  final $Res Function(_AddProduct) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(_AddProduct(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,
  ));
}

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get product {
  
  return $ProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

/// @nodoc


class _RemoveProduct implements ProductEvent {
  const _RemoveProduct();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveProduct);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.removeProduct()';
}


}




/// @nodoc


class _UpdateProduct implements ProductEvent {
  const _UpdateProduct();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProduct);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.updateProduct()';
}


}




/// @nodoc


class _UploadImage implements ProductEvent {
  const _UploadImage(final  List<Uint8List> images): _images = images;
  

 final  List<Uint8List> _images;
 List<Uint8List> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadImageCopyWith<_UploadImage> get copyWith => __$UploadImageCopyWithImpl<_UploadImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadImage&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'ProductEvent.uploadImage(images: $images)';
}


}

/// @nodoc
abstract mixin class _$UploadImageCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$UploadImageCopyWith(_UploadImage value, $Res Function(_UploadImage) _then) = __$UploadImageCopyWithImpl;
@useResult
$Res call({
 List<Uint8List> images
});




}
/// @nodoc
class __$UploadImageCopyWithImpl<$Res>
    implements _$UploadImageCopyWith<$Res> {
  __$UploadImageCopyWithImpl(this._self, this._then);

  final _UploadImage _self;
  final $Res Function(_UploadImage) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(_UploadImage(
null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

/// @nodoc


class _RemoveImage implements ProductEvent {
  const _RemoveImage(this.index);
  

 final  int index;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveImageCopyWith<_RemoveImage> get copyWith => __$RemoveImageCopyWithImpl<_RemoveImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveImage&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'ProductEvent.removeImage(index: $index)';
}


}

/// @nodoc
abstract mixin class _$RemoveImageCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$RemoveImageCopyWith(_RemoveImage value, $Res Function(_RemoveImage) _then) = __$RemoveImageCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$RemoveImageCopyWithImpl<$Res>
    implements _$RemoveImageCopyWith<$Res> {
  __$RemoveImageCopyWithImpl(this._self, this._then);

  final _RemoveImage _self;
  final $Res Function(_RemoveImage) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_RemoveImage(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GetProduct implements ProductEvent {
  const _GetProduct();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProduct);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.getProduct()';
}


}




/// @nodoc
mixin _$ProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState()';
}


}

/// @nodoc
class $ProductStateCopyWith<$Res>  {
$ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  inintial,TResult Function( _Success value)?  success,TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _Loaded value)?  loaded,TResult Function( _ImagesUpdated value)?  imagesUpdated,TResult Function( _ImageRemoved value)?  imageRemoved,TResult Function( _Cleared value)?  cleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when inintial != null:
return inintial(_that);case _Success() when success != null:
return success(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Loaded() when loaded != null:
return loaded(_that);case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _Cleared() when cleared != null:
return cleared(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  inintial,required TResult Function( _Success value)  success,required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _Loaded value)  loaded,required TResult Function( _ImagesUpdated value)  imagesUpdated,required TResult Function( _ImageRemoved value)  imageRemoved,required TResult Function( _Cleared value)  cleared,}){
final _that = this;
switch (_that) {
case _Initial():
return inintial(_that);case _Success():
return success(_that);case _Loading():
return loading(_that);case _Error():
return error(_that);case _Loaded():
return loaded(_that);case _ImagesUpdated():
return imagesUpdated(_that);case _ImageRemoved():
return imageRemoved(_that);case _Cleared():
return cleared(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  inintial,TResult? Function( _Success value)?  success,TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _Loaded value)?  loaded,TResult? Function( _ImagesUpdated value)?  imagesUpdated,TResult? Function( _ImageRemoved value)?  imageRemoved,TResult? Function( _Cleared value)?  cleared,}){
final _that = this;
switch (_that) {
case _Initial() when inintial != null:
return inintial(_that);case _Success() when success != null:
return success(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Loaded() when loaded != null:
return loaded(_that);case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _Cleared() when cleared != null:
return cleared(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  inintial,TResult Function()?  success,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( List<ProductModel> products)?  loaded,TResult Function( List<Uint8List> images)?  imagesUpdated,TResult Function( List<Uint8List> images)?  imageRemoved,TResult Function()?  cleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when inintial != null:
return inintial();case _Success() when success != null:
return success();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Loaded() when loaded != null:
return loaded(_that.products);case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that.images);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.images);case _Cleared() when cleared != null:
return cleared();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  inintial,required TResult Function()  success,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( List<ProductModel> products)  loaded,required TResult Function( List<Uint8List> images)  imagesUpdated,required TResult Function( List<Uint8List> images)  imageRemoved,required TResult Function()  cleared,}) {final _that = this;
switch (_that) {
case _Initial():
return inintial();case _Success():
return success();case _Loading():
return loading();case _Error():
return error(_that.message);case _Loaded():
return loaded(_that.products);case _ImagesUpdated():
return imagesUpdated(_that.images);case _ImageRemoved():
return imageRemoved(_that.images);case _Cleared():
return cleared();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  inintial,TResult? Function()?  success,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( List<ProductModel> products)?  loaded,TResult? Function( List<Uint8List> images)?  imagesUpdated,TResult? Function( List<Uint8List> images)?  imageRemoved,TResult? Function()?  cleared,}) {final _that = this;
switch (_that) {
case _Initial() when inintial != null:
return inintial();case _Success() when success != null:
return success();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Loaded() when loaded != null:
return loaded(_that.products);case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that.images);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.images);case _Cleared() when cleared != null:
return cleared();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProductState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.inintial()';
}


}




/// @nodoc


class _Success implements ProductState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.success()';
}


}




/// @nodoc


class _Loading implements ProductState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.loading()';
}


}




/// @nodoc


class _Error implements ProductState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Loaded implements ProductState {
  const _Loaded({required final  List<ProductModel> products}): _products = products;
  

 final  List<ProductModel> _products;
 List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'ProductState.loaded(products: $products)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> products
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(_Loaded(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

/// @nodoc


class _ImagesUpdated implements ProductState {
  const _ImagesUpdated(final  List<Uint8List> images): _images = images;
  

 final  List<Uint8List> _images;
 List<Uint8List> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of ProductState
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
  return 'ProductState.imagesUpdated(images: $images)';
}


}

/// @nodoc
abstract mixin class _$ImagesUpdatedCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
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

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(_ImagesUpdated(
null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

/// @nodoc


class _ImageRemoved implements ProductState {
  const _ImageRemoved(final  List<Uint8List> images): _images = images;
  

 final  List<Uint8List> _images;
 List<Uint8List> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageRemovedCopyWith<_ImageRemoved> get copyWith => __$ImageRemovedCopyWithImpl<_ImageRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageRemoved&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'ProductState.imageRemoved(images: $images)';
}


}

/// @nodoc
abstract mixin class _$ImageRemovedCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ImageRemovedCopyWith(_ImageRemoved value, $Res Function(_ImageRemoved) _then) = __$ImageRemovedCopyWithImpl;
@useResult
$Res call({
 List<Uint8List> images
});




}
/// @nodoc
class __$ImageRemovedCopyWithImpl<$Res>
    implements _$ImageRemovedCopyWith<$Res> {
  __$ImageRemovedCopyWithImpl(this._self, this._then);

  final _ImageRemoved _self;
  final $Res Function(_ImageRemoved) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(_ImageRemoved(
null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

/// @nodoc


class _Cleared implements ProductState {
  const _Cleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.cleared()';
}


}




// dart format on
