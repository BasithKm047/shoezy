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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadProducts value)?  loadProducts,TResult Function( _SearchProducts value)?  searchProducts,TResult Function( _FilterProducts value)?  filterProducts,TResult Function( _SortProducts value)?  sortProducts,TResult Function( _LoadMoreProducts value)?  loadMoreProducts,TResult Function( _RefreshProducts value)?  refreshProducts,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadProducts() when loadProducts != null:
return loadProducts(_that);case _SearchProducts() when searchProducts != null:
return searchProducts(_that);case _FilterProducts() when filterProducts != null:
return filterProducts(_that);case _SortProducts() when sortProducts != null:
return sortProducts(_that);case _LoadMoreProducts() when loadMoreProducts != null:
return loadMoreProducts(_that);case _RefreshProducts() when refreshProducts != null:
return refreshProducts(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadProducts value)  loadProducts,required TResult Function( _SearchProducts value)  searchProducts,required TResult Function( _FilterProducts value)  filterProducts,required TResult Function( _SortProducts value)  sortProducts,required TResult Function( _LoadMoreProducts value)  loadMoreProducts,required TResult Function( _RefreshProducts value)  refreshProducts,}){
final _that = this;
switch (_that) {
case _LoadProducts():
return loadProducts(_that);case _SearchProducts():
return searchProducts(_that);case _FilterProducts():
return filterProducts(_that);case _SortProducts():
return sortProducts(_that);case _LoadMoreProducts():
return loadMoreProducts(_that);case _RefreshProducts():
return refreshProducts(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadProducts value)?  loadProducts,TResult? Function( _SearchProducts value)?  searchProducts,TResult? Function( _FilterProducts value)?  filterProducts,TResult? Function( _SortProducts value)?  sortProducts,TResult? Function( _LoadMoreProducts value)?  loadMoreProducts,TResult? Function( _RefreshProducts value)?  refreshProducts,}){
final _that = this;
switch (_that) {
case _LoadProducts() when loadProducts != null:
return loadProducts(_that);case _SearchProducts() when searchProducts != null:
return searchProducts(_that);case _FilterProducts() when filterProducts != null:
return filterProducts(_that);case _SortProducts() when sortProducts != null:
return sortProducts(_that);case _LoadMoreProducts() when loadMoreProducts != null:
return loadMoreProducts(_that);case _RefreshProducts() when refreshProducts != null:
return refreshProducts(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadProducts,TResult Function( String query)?  searchProducts,TResult Function( String category)?  filterProducts,TResult Function( String sortBy)?  sortProducts,TResult Function()?  loadMoreProducts,TResult Function()?  refreshProducts,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadProducts() when loadProducts != null:
return loadProducts();case _SearchProducts() when searchProducts != null:
return searchProducts(_that.query);case _FilterProducts() when filterProducts != null:
return filterProducts(_that.category);case _SortProducts() when sortProducts != null:
return sortProducts(_that.sortBy);case _LoadMoreProducts() when loadMoreProducts != null:
return loadMoreProducts();case _RefreshProducts() when refreshProducts != null:
return refreshProducts();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadProducts,required TResult Function( String query)  searchProducts,required TResult Function( String category)  filterProducts,required TResult Function( String sortBy)  sortProducts,required TResult Function()  loadMoreProducts,required TResult Function()  refreshProducts,}) {final _that = this;
switch (_that) {
case _LoadProducts():
return loadProducts();case _SearchProducts():
return searchProducts(_that.query);case _FilterProducts():
return filterProducts(_that.category);case _SortProducts():
return sortProducts(_that.sortBy);case _LoadMoreProducts():
return loadMoreProducts();case _RefreshProducts():
return refreshProducts();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadProducts,TResult? Function( String query)?  searchProducts,TResult? Function( String category)?  filterProducts,TResult? Function( String sortBy)?  sortProducts,TResult? Function()?  loadMoreProducts,TResult? Function()?  refreshProducts,}) {final _that = this;
switch (_that) {
case _LoadProducts() when loadProducts != null:
return loadProducts();case _SearchProducts() when searchProducts != null:
return searchProducts(_that.query);case _FilterProducts() when filterProducts != null:
return filterProducts(_that.category);case _SortProducts() when sortProducts != null:
return sortProducts(_that.sortBy);case _LoadMoreProducts() when loadMoreProducts != null:
return loadMoreProducts();case _RefreshProducts() when refreshProducts != null:
return refreshProducts();case _:
  return null;

}
}

}

/// @nodoc


class _LoadProducts implements ProductEvent {
  const _LoadProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.loadProducts()';
}


}




/// @nodoc


class _SearchProducts implements ProductEvent {
  const _SearchProducts(this.query);
  

 final  String query;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchProductsCopyWith<_SearchProducts> get copyWith => __$SearchProductsCopyWithImpl<_SearchProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchProducts&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ProductEvent.searchProducts(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchProductsCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$SearchProductsCopyWith(_SearchProducts value, $Res Function(_SearchProducts) _then) = __$SearchProductsCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchProductsCopyWithImpl<$Res>
    implements _$SearchProductsCopyWith<$Res> {
  __$SearchProductsCopyWithImpl(this._self, this._then);

  final _SearchProducts _self;
  final $Res Function(_SearchProducts) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_SearchProducts(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FilterProducts implements ProductEvent {
  const _FilterProducts(this.category);
  

 final  String category;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterProductsCopyWith<_FilterProducts> get copyWith => __$FilterProductsCopyWithImpl<_FilterProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterProducts&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'ProductEvent.filterProducts(category: $category)';
}


}

/// @nodoc
abstract mixin class _$FilterProductsCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$FilterProductsCopyWith(_FilterProducts value, $Res Function(_FilterProducts) _then) = __$FilterProductsCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class __$FilterProductsCopyWithImpl<$Res>
    implements _$FilterProductsCopyWith<$Res> {
  __$FilterProductsCopyWithImpl(this._self, this._then);

  final _FilterProducts _self;
  final $Res Function(_FilterProducts) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_FilterProducts(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SortProducts implements ProductEvent {
  const _SortProducts(this.sortBy);
  

 final  String sortBy;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SortProductsCopyWith<_SortProducts> get copyWith => __$SortProductsCopyWithImpl<_SortProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SortProducts&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy));
}


@override
int get hashCode => Object.hash(runtimeType,sortBy);

@override
String toString() {
  return 'ProductEvent.sortProducts(sortBy: $sortBy)';
}


}

/// @nodoc
abstract mixin class _$SortProductsCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$SortProductsCopyWith(_SortProducts value, $Res Function(_SortProducts) _then) = __$SortProductsCopyWithImpl;
@useResult
$Res call({
 String sortBy
});




}
/// @nodoc
class __$SortProductsCopyWithImpl<$Res>
    implements _$SortProductsCopyWith<$Res> {
  __$SortProductsCopyWithImpl(this._self, this._then);

  final _SortProducts _self;
  final $Res Function(_SortProducts) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sortBy = null,}) {
  return _then(_SortProducts(
null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadMoreProducts implements ProductEvent {
  const _LoadMoreProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMoreProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.loadMoreProducts()';
}


}




/// @nodoc


class _RefreshProducts implements ProductEvent {
  const _RefreshProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.refreshProducts()';
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductModel> products)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.products);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductModel> products)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.products);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductModel> products)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.products);case _Error() when error != null:
return error(_that.message);case _:
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
  return 'ProductState.initial()';
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


class _Loaded implements ProductState {
  const _Loaded(final  List<ProductModel> products): _products = products;
  

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
null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
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

// dart format on
