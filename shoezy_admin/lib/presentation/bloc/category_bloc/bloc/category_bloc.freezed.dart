// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent()';
}


}

/// @nodoc
class $CategoryEventCopyWith<$Res>  {
$CategoryEventCopyWith(CategoryEvent _, $Res Function(CategoryEvent) __);
}


/// Adds pattern-matching-related methods to [CategoryEvent].
extension CategoryEventPatterns on CategoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddCategory value)?  addCategory,TResult Function( DeleteCategory value)?  deleteCategory,TResult Function( UpdateCategory value)?  updateCategory,TResult Function( Reset value)?  reset,TResult Function( ResetImage value)?  resetImage,TResult Function( GetCategories value)?  getCategories,TResult Function( SearchCategories value)?  searchCategories,TResult Function( ImagesUpdated value)?  imagesUpdated,TResult Function( ImageRemoved value)?  imageRemoved,TResult Function( SelectedCategory value)?  selectedCategory,TResult Function( ClearSelection value)?  clearSelection,TResult Function( ClearImage value)?  clearImage,TResult Function( _RemoveCategoryImage value)?  removeCategoryImage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddCategory() when addCategory != null:
return addCategory(_that);case DeleteCategory() when deleteCategory != null:
return deleteCategory(_that);case UpdateCategory() when updateCategory != null:
return updateCategory(_that);case Reset() when reset != null:
return reset(_that);case ResetImage() when resetImage != null:
return resetImage(_that);case GetCategories() when getCategories != null:
return getCategories(_that);case SearchCategories() when searchCategories != null:
return searchCategories(_that);case ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that);case ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case SelectedCategory() when selectedCategory != null:
return selectedCategory(_that);case ClearSelection() when clearSelection != null:
return clearSelection(_that);case ClearImage() when clearImage != null:
return clearImage(_that);case _RemoveCategoryImage() when removeCategoryImage != null:
return removeCategoryImage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddCategory value)  addCategory,required TResult Function( DeleteCategory value)  deleteCategory,required TResult Function( UpdateCategory value)  updateCategory,required TResult Function( Reset value)  reset,required TResult Function( ResetImage value)  resetImage,required TResult Function( GetCategories value)  getCategories,required TResult Function( SearchCategories value)  searchCategories,required TResult Function( ImagesUpdated value)  imagesUpdated,required TResult Function( ImageRemoved value)  imageRemoved,required TResult Function( SelectedCategory value)  selectedCategory,required TResult Function( ClearSelection value)  clearSelection,required TResult Function( ClearImage value)  clearImage,required TResult Function( _RemoveCategoryImage value)  removeCategoryImage,}){
final _that = this;
switch (_that) {
case AddCategory():
return addCategory(_that);case DeleteCategory():
return deleteCategory(_that);case UpdateCategory():
return updateCategory(_that);case Reset():
return reset(_that);case ResetImage():
return resetImage(_that);case GetCategories():
return getCategories(_that);case SearchCategories():
return searchCategories(_that);case ImagesUpdated():
return imagesUpdated(_that);case ImageRemoved():
return imageRemoved(_that);case SelectedCategory():
return selectedCategory(_that);case ClearSelection():
return clearSelection(_that);case ClearImage():
return clearImage(_that);case _RemoveCategoryImage():
return removeCategoryImage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddCategory value)?  addCategory,TResult? Function( DeleteCategory value)?  deleteCategory,TResult? Function( UpdateCategory value)?  updateCategory,TResult? Function( Reset value)?  reset,TResult? Function( ResetImage value)?  resetImage,TResult? Function( GetCategories value)?  getCategories,TResult? Function( SearchCategories value)?  searchCategories,TResult? Function( ImagesUpdated value)?  imagesUpdated,TResult? Function( ImageRemoved value)?  imageRemoved,TResult? Function( SelectedCategory value)?  selectedCategory,TResult? Function( ClearSelection value)?  clearSelection,TResult? Function( ClearImage value)?  clearImage,TResult? Function( _RemoveCategoryImage value)?  removeCategoryImage,}){
final _that = this;
switch (_that) {
case AddCategory() when addCategory != null:
return addCategory(_that);case DeleteCategory() when deleteCategory != null:
return deleteCategory(_that);case UpdateCategory() when updateCategory != null:
return updateCategory(_that);case Reset() when reset != null:
return reset(_that);case ResetImage() when resetImage != null:
return resetImage(_that);case GetCategories() when getCategories != null:
return getCategories(_that);case SearchCategories() when searchCategories != null:
return searchCategories(_that);case ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that);case ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case SelectedCategory() when selectedCategory != null:
return selectedCategory(_that);case ClearSelection() when clearSelection != null:
return clearSelection(_that);case ClearImage() when clearImage != null:
return clearImage(_that);case _RemoveCategoryImage() when removeCategoryImage != null:
return removeCategoryImage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CategoryModel category)?  addCategory,TResult Function( String id)?  deleteCategory,TResult Function( CategoryModel category)?  updateCategory,TResult Function()?  reset,TResult Function()?  resetImage,TResult Function()?  getCategories,TResult Function( String query)?  searchCategories,TResult Function( Uint8List images)?  imagesUpdated,TResult Function( int index)?  imageRemoved,TResult Function( String? categoryName)?  selectedCategory,TResult Function()?  clearSelection,TResult Function()?  clearImage,TResult Function( CategoryModel category)?  removeCategoryImage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddCategory() when addCategory != null:
return addCategory(_that.category);case DeleteCategory() when deleteCategory != null:
return deleteCategory(_that.id);case UpdateCategory() when updateCategory != null:
return updateCategory(_that.category);case Reset() when reset != null:
return reset();case ResetImage() when resetImage != null:
return resetImage();case GetCategories() when getCategories != null:
return getCategories();case SearchCategories() when searchCategories != null:
return searchCategories(_that.query);case ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that.images);case ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.index);case SelectedCategory() when selectedCategory != null:
return selectedCategory(_that.categoryName);case ClearSelection() when clearSelection != null:
return clearSelection();case ClearImage() when clearImage != null:
return clearImage();case _RemoveCategoryImage() when removeCategoryImage != null:
return removeCategoryImage(_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CategoryModel category)  addCategory,required TResult Function( String id)  deleteCategory,required TResult Function( CategoryModel category)  updateCategory,required TResult Function()  reset,required TResult Function()  resetImage,required TResult Function()  getCategories,required TResult Function( String query)  searchCategories,required TResult Function( Uint8List images)  imagesUpdated,required TResult Function( int index)  imageRemoved,required TResult Function( String? categoryName)  selectedCategory,required TResult Function()  clearSelection,required TResult Function()  clearImage,required TResult Function( CategoryModel category)  removeCategoryImage,}) {final _that = this;
switch (_that) {
case AddCategory():
return addCategory(_that.category);case DeleteCategory():
return deleteCategory(_that.id);case UpdateCategory():
return updateCategory(_that.category);case Reset():
return reset();case ResetImage():
return resetImage();case GetCategories():
return getCategories();case SearchCategories():
return searchCategories(_that.query);case ImagesUpdated():
return imagesUpdated(_that.images);case ImageRemoved():
return imageRemoved(_that.index);case SelectedCategory():
return selectedCategory(_that.categoryName);case ClearSelection():
return clearSelection();case ClearImage():
return clearImage();case _RemoveCategoryImage():
return removeCategoryImage(_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CategoryModel category)?  addCategory,TResult? Function( String id)?  deleteCategory,TResult? Function( CategoryModel category)?  updateCategory,TResult? Function()?  reset,TResult? Function()?  resetImage,TResult? Function()?  getCategories,TResult? Function( String query)?  searchCategories,TResult? Function( Uint8List images)?  imagesUpdated,TResult? Function( int index)?  imageRemoved,TResult? Function( String? categoryName)?  selectedCategory,TResult? Function()?  clearSelection,TResult? Function()?  clearImage,TResult? Function( CategoryModel category)?  removeCategoryImage,}) {final _that = this;
switch (_that) {
case AddCategory() when addCategory != null:
return addCategory(_that.category);case DeleteCategory() when deleteCategory != null:
return deleteCategory(_that.id);case UpdateCategory() when updateCategory != null:
return updateCategory(_that.category);case Reset() when reset != null:
return reset();case ResetImage() when resetImage != null:
return resetImage();case GetCategories() when getCategories != null:
return getCategories();case SearchCategories() when searchCategories != null:
return searchCategories(_that.query);case ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that.images);case ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.index);case SelectedCategory() when selectedCategory != null:
return selectedCategory(_that.categoryName);case ClearSelection() when clearSelection != null:
return clearSelection();case ClearImage() when clearImage != null:
return clearImage();case _RemoveCategoryImage() when removeCategoryImage != null:
return removeCategoryImage(_that.category);case _:
  return null;

}
}

}

/// @nodoc


class AddCategory implements CategoryEvent {
  const AddCategory({required this.category});
  

 final  CategoryModel category;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddCategoryCopyWith<AddCategory> get copyWith => _$AddCategoryCopyWithImpl<AddCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddCategory&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'CategoryEvent.addCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class $AddCategoryCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $AddCategoryCopyWith(AddCategory value, $Res Function(AddCategory) _then) = _$AddCategoryCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$AddCategoryCopyWithImpl<$Res>
    implements $AddCategoryCopyWith<$Res> {
  _$AddCategoryCopyWithImpl(this._self, this._then);

  final AddCategory _self;
  final $Res Function(AddCategory) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(AddCategory(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class DeleteCategory implements CategoryEvent {
  const DeleteCategory({required this.id});
  

 final  String id;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteCategoryCopyWith<DeleteCategory> get copyWith => _$DeleteCategoryCopyWithImpl<DeleteCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteCategory&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'CategoryEvent.deleteCategory(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteCategoryCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $DeleteCategoryCopyWith(DeleteCategory value, $Res Function(DeleteCategory) _then) = _$DeleteCategoryCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DeleteCategoryCopyWithImpl<$Res>
    implements $DeleteCategoryCopyWith<$Res> {
  _$DeleteCategoryCopyWithImpl(this._self, this._then);

  final DeleteCategory _self;
  final $Res Function(DeleteCategory) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateCategory implements CategoryEvent {
  const UpdateCategory({required this.category});
  

 final  CategoryModel category;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCategoryCopyWith<UpdateCategory> get copyWith => _$UpdateCategoryCopyWithImpl<UpdateCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCategory&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'CategoryEvent.updateCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class $UpdateCategoryCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $UpdateCategoryCopyWith(UpdateCategory value, $Res Function(UpdateCategory) _then) = _$UpdateCategoryCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$UpdateCategoryCopyWithImpl<$Res>
    implements $UpdateCategoryCopyWith<$Res> {
  _$UpdateCategoryCopyWithImpl(this._self, this._then);

  final UpdateCategory _self;
  final $Res Function(UpdateCategory) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(UpdateCategory(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class Reset implements CategoryEvent {
  const Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent.reset()';
}


}




/// @nodoc


class ResetImage implements CategoryEvent {
  const ResetImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent.resetImage()';
}


}




/// @nodoc


class GetCategories implements CategoryEvent {
  const GetCategories();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent.getCategories()';
}


}




/// @nodoc


class SearchCategories implements CategoryEvent {
  const SearchCategories({required this.query});
  

 final  String query;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCategoriesCopyWith<SearchCategories> get copyWith => _$SearchCategoriesCopyWithImpl<SearchCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchCategories&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'CategoryEvent.searchCategories(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchCategoriesCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $SearchCategoriesCopyWith(SearchCategories value, $Res Function(SearchCategories) _then) = _$SearchCategoriesCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchCategoriesCopyWithImpl<$Res>
    implements $SearchCategoriesCopyWith<$Res> {
  _$SearchCategoriesCopyWithImpl(this._self, this._then);

  final SearchCategories _self;
  final $Res Function(SearchCategories) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchCategories(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ImagesUpdated implements CategoryEvent {
  const ImagesUpdated({required this.images});
  

 final  Uint8List images;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImagesUpdatedCopyWith<ImagesUpdated> get copyWith => _$ImagesUpdatedCopyWithImpl<ImagesUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImagesUpdated&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'CategoryEvent.imagesUpdated(images: $images)';
}


}

/// @nodoc
abstract mixin class $ImagesUpdatedCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $ImagesUpdatedCopyWith(ImagesUpdated value, $Res Function(ImagesUpdated) _then) = _$ImagesUpdatedCopyWithImpl;
@useResult
$Res call({
 Uint8List images
});




}
/// @nodoc
class _$ImagesUpdatedCopyWithImpl<$Res>
    implements $ImagesUpdatedCopyWith<$Res> {
  _$ImagesUpdatedCopyWithImpl(this._self, this._then);

  final ImagesUpdated _self;
  final $Res Function(ImagesUpdated) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(ImagesUpdated(
images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

/// @nodoc


class ImageRemoved implements CategoryEvent {
  const ImageRemoved({required this.index});
  

 final  int index;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageRemovedCopyWith<ImageRemoved> get copyWith => _$ImageRemovedCopyWithImpl<ImageRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageRemoved&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'CategoryEvent.imageRemoved(index: $index)';
}


}

/// @nodoc
abstract mixin class $ImageRemovedCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $ImageRemovedCopyWith(ImageRemoved value, $Res Function(ImageRemoved) _then) = _$ImageRemovedCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$ImageRemovedCopyWithImpl<$Res>
    implements $ImageRemovedCopyWith<$Res> {
  _$ImageRemovedCopyWithImpl(this._self, this._then);

  final ImageRemoved _self;
  final $Res Function(ImageRemoved) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(ImageRemoved(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SelectedCategory implements CategoryEvent {
  const SelectedCategory(this.categoryName);
  

 final  String? categoryName;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedCategoryCopyWith<SelectedCategory> get copyWith => _$SelectedCategoryCopyWithImpl<SelectedCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedCategory&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}


@override
int get hashCode => Object.hash(runtimeType,categoryName);

@override
String toString() {
  return 'CategoryEvent.selectedCategory(categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class $SelectedCategoryCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $SelectedCategoryCopyWith(SelectedCategory value, $Res Function(SelectedCategory) _then) = _$SelectedCategoryCopyWithImpl;
@useResult
$Res call({
 String? categoryName
});




}
/// @nodoc
class _$SelectedCategoryCopyWithImpl<$Res>
    implements $SelectedCategoryCopyWith<$Res> {
  _$SelectedCategoryCopyWithImpl(this._self, this._then);

  final SelectedCategory _self;
  final $Res Function(SelectedCategory) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryName = freezed,}) {
  return _then(SelectedCategory(
freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ClearSelection implements CategoryEvent {
  const ClearSelection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent.clearSelection()';
}


}




/// @nodoc


class ClearImage implements CategoryEvent {
  const ClearImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent.clearImage()';
}


}




/// @nodoc


class _RemoveCategoryImage implements CategoryEvent {
  const _RemoveCategoryImage({required this.category});
  

 final  CategoryModel category;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCategoryImageCopyWith<_RemoveCategoryImage> get copyWith => __$RemoveCategoryImageCopyWithImpl<_RemoveCategoryImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveCategoryImage&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'CategoryEvent.removeCategoryImage(category: $category)';
}


}

/// @nodoc
abstract mixin class _$RemoveCategoryImageCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory _$RemoveCategoryImageCopyWith(_RemoveCategoryImage value, $Res Function(_RemoveCategoryImage) _then) = __$RemoveCategoryImageCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$RemoveCategoryImageCopyWithImpl<$Res>
    implements _$RemoveCategoryImageCopyWith<$Res> {
  __$RemoveCategoryImageCopyWithImpl(this._self, this._then);

  final _RemoveCategoryImage _self;
  final $Res Function(_RemoveCategoryImage) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_RemoveCategoryImage(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc
mixin _$CategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState()';
}


}

/// @nodoc
class $CategoryStateCopyWith<$Res>  {
$CategoryStateCopyWith(CategoryState _, $Res Function(CategoryState) __);
}


/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,TResult Function( _ImagesUpdated value)?  imagesUpdated,TResult Function( _ImageRemoved value)?  imageRemoved,TResult Function( _GetCategories value)?  getcategories,TResult Function( _Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _GetCategories() when getcategories != null:
return getcategories(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,required TResult Function( _ImagesUpdated value)  imagesUpdated,required TResult Function( _ImageRemoved value)  imageRemoved,required TResult Function( _GetCategories value)  getcategories,required TResult Function( _Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _ImagesUpdated():
return imagesUpdated(_that);case _ImageRemoved():
return imageRemoved(_that);case _GetCategories():
return getcategories(_that);case _Loaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,TResult? Function( _ImagesUpdated value)?  imagesUpdated,TResult? Function( _ImageRemoved value)?  imageRemoved,TResult? Function( _GetCategories value)?  getcategories,TResult? Function( _Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _GetCategories() when getcategories != null:
return getcategories(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  failure,TResult Function( Uint8List? images)?  imagesUpdated,TResult Function()?  imageRemoved,TResult Function( List<CategoryModel> categories)?  getcategories,TResult Function( List<CategoryModel> categories,  String? selectedCategory)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.message);case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that.images);case _ImageRemoved() when imageRemoved != null:
return imageRemoved();case _GetCategories() when getcategories != null:
return getcategories(_that.categories);case _Loaded() when loaded != null:
return loaded(_that.categories,_that.selectedCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  failure,required TResult Function( Uint8List? images)  imagesUpdated,required TResult Function()  imageRemoved,required TResult Function( List<CategoryModel> categories)  getcategories,required TResult Function( List<CategoryModel> categories,  String? selectedCategory)  loaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success();case _Failure():
return failure(_that.message);case _ImagesUpdated():
return imagesUpdated(_that.images);case _ImageRemoved():
return imageRemoved();case _GetCategories():
return getcategories(_that.categories);case _Loaded():
return loaded(_that.categories,_that.selectedCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  failure,TResult? Function( Uint8List? images)?  imagesUpdated,TResult? Function()?  imageRemoved,TResult? Function( List<CategoryModel> categories)?  getcategories,TResult? Function( List<CategoryModel> categories,  String? selectedCategory)?  loaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _Failure() when failure != null:
return failure(_that.message);case _ImagesUpdated() when imagesUpdated != null:
return imagesUpdated(_that.images);case _ImageRemoved() when imageRemoved != null:
return imageRemoved();case _GetCategories() when getcategories != null:
return getcategories(_that.categories);case _Loaded() when loaded != null:
return loaded(_that.categories,_that.selectedCategory);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CategoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.initial()';
}


}




/// @nodoc


class _Loading implements CategoryState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.loading()';
}


}




/// @nodoc


class _Success implements CategoryState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.success()';
}


}




/// @nodoc


class _Failure implements CategoryState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CategoryState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ImagesUpdated implements CategoryState {
  const _ImagesUpdated(this.images);
  

 final  Uint8List? images;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImagesUpdatedCopyWith<_ImagesUpdated> get copyWith => __$ImagesUpdatedCopyWithImpl<_ImagesUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImagesUpdated&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'CategoryState.imagesUpdated(images: $images)';
}


}

/// @nodoc
abstract mixin class _$ImagesUpdatedCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory _$ImagesUpdatedCopyWith(_ImagesUpdated value, $Res Function(_ImagesUpdated) _then) = __$ImagesUpdatedCopyWithImpl;
@useResult
$Res call({
 Uint8List? images
});




}
/// @nodoc
class __$ImagesUpdatedCopyWithImpl<$Res>
    implements _$ImagesUpdatedCopyWith<$Res> {
  __$ImagesUpdatedCopyWithImpl(this._self, this._then);

  final _ImagesUpdated _self;
  final $Res Function(_ImagesUpdated) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = freezed,}) {
  return _then(_ImagesUpdated(
freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc


class _ImageRemoved implements CategoryState {
  const _ImageRemoved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageRemoved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.imageRemoved()';
}


}




/// @nodoc


class _GetCategories implements CategoryState {
  const _GetCategories(final  List<CategoryModel> categories): _categories = categories;
  

 final  List<CategoryModel> _categories;
 List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCategoriesCopyWith<_GetCategories> get copyWith => __$GetCategoriesCopyWithImpl<_GetCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategories&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoryState.getcategories(categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$GetCategoriesCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory _$GetCategoriesCopyWith(_GetCategories value, $Res Function(_GetCategories) _then) = __$GetCategoriesCopyWithImpl;
@useResult
$Res call({
 List<CategoryModel> categories
});




}
/// @nodoc
class __$GetCategoriesCopyWithImpl<$Res>
    implements _$GetCategoriesCopyWith<$Res> {
  __$GetCategoriesCopyWithImpl(this._self, this._then);

  final _GetCategories _self;
  final $Res Function(_GetCategories) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(_GetCategories(
null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}


}

/// @nodoc


class _Loaded implements CategoryState {
  const _Loaded({required final  List<CategoryModel> categories, this.selectedCategory}): _categories = categories;
  

 final  List<CategoryModel> _categories;
 List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  String? selectedCategory;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),selectedCategory);

@override
String toString() {
  return 'CategoryState.loaded(categories: $categories, selectedCategory: $selectedCategory)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<CategoryModel> categories, String? selectedCategory
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? selectedCategory = freezed,}) {
  return _then(_Loaded(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
