// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BrandEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandEvent()';
}


}

/// @nodoc
class $BrandEventCopyWith<$Res>  {
$BrandEventCopyWith(BrandEvent _, $Res Function(BrandEvent) __);
}


/// Adds pattern-matching-related methods to [BrandEvent].
extension BrandEventPatterns on BrandEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddBrand value)?  addBrand,TResult Function( UpdateBrand value)?  updateBrand,TResult Function( DeleteBrand value)?  deleteBrand,TResult Function( FetchBrands value)?  fetchBrands,TResult Function( ImageUploaded value)?  imageUploaded,TResult Function( ClearImage value)?  clearImage,TResult Function( RemovedImage value)?  removedImage,TResult Function( SelectedBrand value)?  selectedBrand,TResult Function( ClearSelection value)?  clearSelection,TResult Function( SearchBrands value)?  searchBrands,TResult Function( LogoUpload value)?  logoUpload,TResult Function( ClearLogoImage value)?  clearLogoImage,TResult Function( StartEditing value)?  startEditing,TResult Function( UpdateLogoImage value)?  updateLogoImage,TResult Function( UpdateBrandImage value)?  updateBrandImage,TResult Function( ClearEditedLogoImage value)?  clearEditedLogoImage,TResult Function( ClearEditedBrandImage value)?  clearEditedBrandImage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddBrand() when addBrand != null:
return addBrand(_that);case UpdateBrand() when updateBrand != null:
return updateBrand(_that);case DeleteBrand() when deleteBrand != null:
return deleteBrand(_that);case FetchBrands() when fetchBrands != null:
return fetchBrands(_that);case ImageUploaded() when imageUploaded != null:
return imageUploaded(_that);case ClearImage() when clearImage != null:
return clearImage(_that);case RemovedImage() when removedImage != null:
return removedImage(_that);case SelectedBrand() when selectedBrand != null:
return selectedBrand(_that);case ClearSelection() when clearSelection != null:
return clearSelection(_that);case SearchBrands() when searchBrands != null:
return searchBrands(_that);case LogoUpload() when logoUpload != null:
return logoUpload(_that);case ClearLogoImage() when clearLogoImage != null:
return clearLogoImage(_that);case StartEditing() when startEditing != null:
return startEditing(_that);case UpdateLogoImage() when updateLogoImage != null:
return updateLogoImage(_that);case UpdateBrandImage() when updateBrandImage != null:
return updateBrandImage(_that);case ClearEditedLogoImage() when clearEditedLogoImage != null:
return clearEditedLogoImage(_that);case ClearEditedBrandImage() when clearEditedBrandImage != null:
return clearEditedBrandImage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddBrand value)  addBrand,required TResult Function( UpdateBrand value)  updateBrand,required TResult Function( DeleteBrand value)  deleteBrand,required TResult Function( FetchBrands value)  fetchBrands,required TResult Function( ImageUploaded value)  imageUploaded,required TResult Function( ClearImage value)  clearImage,required TResult Function( RemovedImage value)  removedImage,required TResult Function( SelectedBrand value)  selectedBrand,required TResult Function( ClearSelection value)  clearSelection,required TResult Function( SearchBrands value)  searchBrands,required TResult Function( LogoUpload value)  logoUpload,required TResult Function( ClearLogoImage value)  clearLogoImage,required TResult Function( StartEditing value)  startEditing,required TResult Function( UpdateLogoImage value)  updateLogoImage,required TResult Function( UpdateBrandImage value)  updateBrandImage,required TResult Function( ClearEditedLogoImage value)  clearEditedLogoImage,required TResult Function( ClearEditedBrandImage value)  clearEditedBrandImage,}){
final _that = this;
switch (_that) {
case AddBrand():
return addBrand(_that);case UpdateBrand():
return updateBrand(_that);case DeleteBrand():
return deleteBrand(_that);case FetchBrands():
return fetchBrands(_that);case ImageUploaded():
return imageUploaded(_that);case ClearImage():
return clearImage(_that);case RemovedImage():
return removedImage(_that);case SelectedBrand():
return selectedBrand(_that);case ClearSelection():
return clearSelection(_that);case SearchBrands():
return searchBrands(_that);case LogoUpload():
return logoUpload(_that);case ClearLogoImage():
return clearLogoImage(_that);case StartEditing():
return startEditing(_that);case UpdateLogoImage():
return updateLogoImage(_that);case UpdateBrandImage():
return updateBrandImage(_that);case ClearEditedLogoImage():
return clearEditedLogoImage(_that);case ClearEditedBrandImage():
return clearEditedBrandImage(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddBrand value)?  addBrand,TResult? Function( UpdateBrand value)?  updateBrand,TResult? Function( DeleteBrand value)?  deleteBrand,TResult? Function( FetchBrands value)?  fetchBrands,TResult? Function( ImageUploaded value)?  imageUploaded,TResult? Function( ClearImage value)?  clearImage,TResult? Function( RemovedImage value)?  removedImage,TResult? Function( SelectedBrand value)?  selectedBrand,TResult? Function( ClearSelection value)?  clearSelection,TResult? Function( SearchBrands value)?  searchBrands,TResult? Function( LogoUpload value)?  logoUpload,TResult? Function( ClearLogoImage value)?  clearLogoImage,TResult? Function( StartEditing value)?  startEditing,TResult? Function( UpdateLogoImage value)?  updateLogoImage,TResult? Function( UpdateBrandImage value)?  updateBrandImage,TResult? Function( ClearEditedLogoImage value)?  clearEditedLogoImage,TResult? Function( ClearEditedBrandImage value)?  clearEditedBrandImage,}){
final _that = this;
switch (_that) {
case AddBrand() when addBrand != null:
return addBrand(_that);case UpdateBrand() when updateBrand != null:
return updateBrand(_that);case DeleteBrand() when deleteBrand != null:
return deleteBrand(_that);case FetchBrands() when fetchBrands != null:
return fetchBrands(_that);case ImageUploaded() when imageUploaded != null:
return imageUploaded(_that);case ClearImage() when clearImage != null:
return clearImage(_that);case RemovedImage() when removedImage != null:
return removedImage(_that);case SelectedBrand() when selectedBrand != null:
return selectedBrand(_that);case ClearSelection() when clearSelection != null:
return clearSelection(_that);case SearchBrands() when searchBrands != null:
return searchBrands(_that);case LogoUpload() when logoUpload != null:
return logoUpload(_that);case ClearLogoImage() when clearLogoImage != null:
return clearLogoImage(_that);case StartEditing() when startEditing != null:
return startEditing(_that);case UpdateLogoImage() when updateLogoImage != null:
return updateLogoImage(_that);case UpdateBrandImage() when updateBrandImage != null:
return updateBrandImage(_that);case ClearEditedLogoImage() when clearEditedLogoImage != null:
return clearEditedLogoImage(_that);case ClearEditedBrandImage() when clearEditedBrandImage != null:
return clearEditedBrandImage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( BrandModel brands)?  addBrand,TResult Function( BrandModel brands)?  updateBrand,TResult Function( String id)?  deleteBrand,TResult Function( String? brandName)?  fetchBrands,TResult Function( Uint8List imageBytes)?  imageUploaded,TResult Function()?  clearImage,TResult Function()?  removedImage,TResult Function( String? brandName)?  selectedBrand,TResult Function()?  clearSelection,TResult Function( String query)?  searchBrands,TResult Function( Uint8List? image)?  logoUpload,TResult Function()?  clearLogoImage,TResult Function( BrandModel brand)?  startEditing,TResult Function( Uint8List imageBytes)?  updateLogoImage,TResult Function( Uint8List imageBytes)?  updateBrandImage,TResult Function()?  clearEditedLogoImage,TResult Function()?  clearEditedBrandImage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddBrand() when addBrand != null:
return addBrand(_that.brands);case UpdateBrand() when updateBrand != null:
return updateBrand(_that.brands);case DeleteBrand() when deleteBrand != null:
return deleteBrand(_that.id);case FetchBrands() when fetchBrands != null:
return fetchBrands(_that.brandName);case ImageUploaded() when imageUploaded != null:
return imageUploaded(_that.imageBytes);case ClearImage() when clearImage != null:
return clearImage();case RemovedImage() when removedImage != null:
return removedImage();case SelectedBrand() when selectedBrand != null:
return selectedBrand(_that.brandName);case ClearSelection() when clearSelection != null:
return clearSelection();case SearchBrands() when searchBrands != null:
return searchBrands(_that.query);case LogoUpload() when logoUpload != null:
return logoUpload(_that.image);case ClearLogoImage() when clearLogoImage != null:
return clearLogoImage();case StartEditing() when startEditing != null:
return startEditing(_that.brand);case UpdateLogoImage() when updateLogoImage != null:
return updateLogoImage(_that.imageBytes);case UpdateBrandImage() when updateBrandImage != null:
return updateBrandImage(_that.imageBytes);case ClearEditedLogoImage() when clearEditedLogoImage != null:
return clearEditedLogoImage();case ClearEditedBrandImage() when clearEditedBrandImage != null:
return clearEditedBrandImage();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( BrandModel brands)  addBrand,required TResult Function( BrandModel brands)  updateBrand,required TResult Function( String id)  deleteBrand,required TResult Function( String? brandName)  fetchBrands,required TResult Function( Uint8List imageBytes)  imageUploaded,required TResult Function()  clearImage,required TResult Function()  removedImage,required TResult Function( String? brandName)  selectedBrand,required TResult Function()  clearSelection,required TResult Function( String query)  searchBrands,required TResult Function( Uint8List? image)  logoUpload,required TResult Function()  clearLogoImage,required TResult Function( BrandModel brand)  startEditing,required TResult Function( Uint8List imageBytes)  updateLogoImage,required TResult Function( Uint8List imageBytes)  updateBrandImage,required TResult Function()  clearEditedLogoImage,required TResult Function()  clearEditedBrandImage,}) {final _that = this;
switch (_that) {
case AddBrand():
return addBrand(_that.brands);case UpdateBrand():
return updateBrand(_that.brands);case DeleteBrand():
return deleteBrand(_that.id);case FetchBrands():
return fetchBrands(_that.brandName);case ImageUploaded():
return imageUploaded(_that.imageBytes);case ClearImage():
return clearImage();case RemovedImage():
return removedImage();case SelectedBrand():
return selectedBrand(_that.brandName);case ClearSelection():
return clearSelection();case SearchBrands():
return searchBrands(_that.query);case LogoUpload():
return logoUpload(_that.image);case ClearLogoImage():
return clearLogoImage();case StartEditing():
return startEditing(_that.brand);case UpdateLogoImage():
return updateLogoImage(_that.imageBytes);case UpdateBrandImage():
return updateBrandImage(_that.imageBytes);case ClearEditedLogoImage():
return clearEditedLogoImage();case ClearEditedBrandImage():
return clearEditedBrandImage();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( BrandModel brands)?  addBrand,TResult? Function( BrandModel brands)?  updateBrand,TResult? Function( String id)?  deleteBrand,TResult? Function( String? brandName)?  fetchBrands,TResult? Function( Uint8List imageBytes)?  imageUploaded,TResult? Function()?  clearImage,TResult? Function()?  removedImage,TResult? Function( String? brandName)?  selectedBrand,TResult? Function()?  clearSelection,TResult? Function( String query)?  searchBrands,TResult? Function( Uint8List? image)?  logoUpload,TResult? Function()?  clearLogoImage,TResult? Function( BrandModel brand)?  startEditing,TResult? Function( Uint8List imageBytes)?  updateLogoImage,TResult? Function( Uint8List imageBytes)?  updateBrandImage,TResult? Function()?  clearEditedLogoImage,TResult? Function()?  clearEditedBrandImage,}) {final _that = this;
switch (_that) {
case AddBrand() when addBrand != null:
return addBrand(_that.brands);case UpdateBrand() when updateBrand != null:
return updateBrand(_that.brands);case DeleteBrand() when deleteBrand != null:
return deleteBrand(_that.id);case FetchBrands() when fetchBrands != null:
return fetchBrands(_that.brandName);case ImageUploaded() when imageUploaded != null:
return imageUploaded(_that.imageBytes);case ClearImage() when clearImage != null:
return clearImage();case RemovedImage() when removedImage != null:
return removedImage();case SelectedBrand() when selectedBrand != null:
return selectedBrand(_that.brandName);case ClearSelection() when clearSelection != null:
return clearSelection();case SearchBrands() when searchBrands != null:
return searchBrands(_that.query);case LogoUpload() when logoUpload != null:
return logoUpload(_that.image);case ClearLogoImage() when clearLogoImage != null:
return clearLogoImage();case StartEditing() when startEditing != null:
return startEditing(_that.brand);case UpdateLogoImage() when updateLogoImage != null:
return updateLogoImage(_that.imageBytes);case UpdateBrandImage() when updateBrandImage != null:
return updateBrandImage(_that.imageBytes);case ClearEditedLogoImage() when clearEditedLogoImage != null:
return clearEditedLogoImage();case ClearEditedBrandImage() when clearEditedBrandImage != null:
return clearEditedBrandImage();case _:
  return null;

}
}

}

/// @nodoc


class AddBrand implements BrandEvent {
  const AddBrand(this.brands);
  

 final  BrandModel brands;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddBrandCopyWith<AddBrand> get copyWith => _$AddBrandCopyWithImpl<AddBrand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddBrand&&(identical(other.brands, brands) || other.brands == brands));
}


@override
int get hashCode => Object.hash(runtimeType,brands);

@override
String toString() {
  return 'BrandEvent.addBrand(brands: $brands)';
}


}

/// @nodoc
abstract mixin class $AddBrandCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $AddBrandCopyWith(AddBrand value, $Res Function(AddBrand) _then) = _$AddBrandCopyWithImpl;
@useResult
$Res call({
 BrandModel brands
});


$BrandModelCopyWith<$Res> get brands;

}
/// @nodoc
class _$AddBrandCopyWithImpl<$Res>
    implements $AddBrandCopyWith<$Res> {
  _$AddBrandCopyWithImpl(this._self, this._then);

  final AddBrand _self;
  final $Res Function(AddBrand) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? brands = null,}) {
  return _then(AddBrand(
null == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as BrandModel,
  ));
}

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res> get brands {
  
  return $BrandModelCopyWith<$Res>(_self.brands, (value) {
    return _then(_self.copyWith(brands: value));
  });
}
}

/// @nodoc


class UpdateBrand implements BrandEvent {
  const UpdateBrand(this.brands);
  

 final  BrandModel brands;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBrandCopyWith<UpdateBrand> get copyWith => _$UpdateBrandCopyWithImpl<UpdateBrand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBrand&&(identical(other.brands, brands) || other.brands == brands));
}


@override
int get hashCode => Object.hash(runtimeType,brands);

@override
String toString() {
  return 'BrandEvent.updateBrand(brands: $brands)';
}


}

/// @nodoc
abstract mixin class $UpdateBrandCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $UpdateBrandCopyWith(UpdateBrand value, $Res Function(UpdateBrand) _then) = _$UpdateBrandCopyWithImpl;
@useResult
$Res call({
 BrandModel brands
});


$BrandModelCopyWith<$Res> get brands;

}
/// @nodoc
class _$UpdateBrandCopyWithImpl<$Res>
    implements $UpdateBrandCopyWith<$Res> {
  _$UpdateBrandCopyWithImpl(this._self, this._then);

  final UpdateBrand _self;
  final $Res Function(UpdateBrand) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? brands = null,}) {
  return _then(UpdateBrand(
null == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as BrandModel,
  ));
}

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res> get brands {
  
  return $BrandModelCopyWith<$Res>(_self.brands, (value) {
    return _then(_self.copyWith(brands: value));
  });
}
}

/// @nodoc


class DeleteBrand implements BrandEvent {
  const DeleteBrand(this.id);
  

 final  String id;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteBrandCopyWith<DeleteBrand> get copyWith => _$DeleteBrandCopyWithImpl<DeleteBrand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteBrand&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'BrandEvent.deleteBrand(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteBrandCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $DeleteBrandCopyWith(DeleteBrand value, $Res Function(DeleteBrand) _then) = _$DeleteBrandCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DeleteBrandCopyWithImpl<$Res>
    implements $DeleteBrandCopyWith<$Res> {
  _$DeleteBrandCopyWithImpl(this._self, this._then);

  final DeleteBrand _self;
  final $Res Function(DeleteBrand) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteBrand(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FetchBrands implements BrandEvent {
  const FetchBrands({this.brandName});
  

 final  String? brandName;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchBrandsCopyWith<FetchBrands> get copyWith => _$FetchBrandsCopyWithImpl<FetchBrands>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchBrands&&(identical(other.brandName, brandName) || other.brandName == brandName));
}


@override
int get hashCode => Object.hash(runtimeType,brandName);

@override
String toString() {
  return 'BrandEvent.fetchBrands(brandName: $brandName)';
}


}

/// @nodoc
abstract mixin class $FetchBrandsCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $FetchBrandsCopyWith(FetchBrands value, $Res Function(FetchBrands) _then) = _$FetchBrandsCopyWithImpl;
@useResult
$Res call({
 String? brandName
});




}
/// @nodoc
class _$FetchBrandsCopyWithImpl<$Res>
    implements $FetchBrandsCopyWith<$Res> {
  _$FetchBrandsCopyWithImpl(this._self, this._then);

  final FetchBrands _self;
  final $Res Function(FetchBrands) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? brandName = freezed,}) {
  return _then(FetchBrands(
brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ImageUploaded implements BrandEvent {
  const ImageUploaded(this.imageBytes);
  

 final  Uint8List imageBytes;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageUploadedCopyWith<ImageUploaded> get copyWith => _$ImageUploadedCopyWithImpl<ImageUploaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageUploaded&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imageBytes));

@override
String toString() {
  return 'BrandEvent.imageUploaded(imageBytes: $imageBytes)';
}


}

/// @nodoc
abstract mixin class $ImageUploadedCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $ImageUploadedCopyWith(ImageUploaded value, $Res Function(ImageUploaded) _then) = _$ImageUploadedCopyWithImpl;
@useResult
$Res call({
 Uint8List imageBytes
});




}
/// @nodoc
class _$ImageUploadedCopyWithImpl<$Res>
    implements $ImageUploadedCopyWith<$Res> {
  _$ImageUploadedCopyWithImpl(this._self, this._then);

  final ImageUploaded _self;
  final $Res Function(ImageUploaded) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageBytes = null,}) {
  return _then(ImageUploaded(
null == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

/// @nodoc


class ClearImage implements BrandEvent {
  const ClearImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandEvent.clearImage()';
}


}




/// @nodoc


class RemovedImage implements BrandEvent {
  const RemovedImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemovedImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandEvent.removedImage()';
}


}




/// @nodoc


class SelectedBrand implements BrandEvent {
  const SelectedBrand(this.brandName);
  

 final  String? brandName;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedBrandCopyWith<SelectedBrand> get copyWith => _$SelectedBrandCopyWithImpl<SelectedBrand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedBrand&&(identical(other.brandName, brandName) || other.brandName == brandName));
}


@override
int get hashCode => Object.hash(runtimeType,brandName);

@override
String toString() {
  return 'BrandEvent.selectedBrand(brandName: $brandName)';
}


}

/// @nodoc
abstract mixin class $SelectedBrandCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $SelectedBrandCopyWith(SelectedBrand value, $Res Function(SelectedBrand) _then) = _$SelectedBrandCopyWithImpl;
@useResult
$Res call({
 String? brandName
});




}
/// @nodoc
class _$SelectedBrandCopyWithImpl<$Res>
    implements $SelectedBrandCopyWith<$Res> {
  _$SelectedBrandCopyWithImpl(this._self, this._then);

  final SelectedBrand _self;
  final $Res Function(SelectedBrand) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? brandName = freezed,}) {
  return _then(SelectedBrand(
freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ClearSelection implements BrandEvent {
  const ClearSelection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandEvent.clearSelection()';
}


}




/// @nodoc


class SearchBrands implements BrandEvent {
  const SearchBrands(this.query);
  

 final  String query;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchBrandsCopyWith<SearchBrands> get copyWith => _$SearchBrandsCopyWithImpl<SearchBrands>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchBrands&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'BrandEvent.searchBrands(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchBrandsCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $SearchBrandsCopyWith(SearchBrands value, $Res Function(SearchBrands) _then) = _$SearchBrandsCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchBrandsCopyWithImpl<$Res>
    implements $SearchBrandsCopyWith<$Res> {
  _$SearchBrandsCopyWithImpl(this._self, this._then);

  final SearchBrands _self;
  final $Res Function(SearchBrands) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchBrands(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LogoUpload implements BrandEvent {
  const LogoUpload(this.image);
  

 final  Uint8List? image;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoUploadCopyWith<LogoUpload> get copyWith => _$LogoUploadCopyWithImpl<LogoUpload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoUpload&&const DeepCollectionEquality().equals(other.image, image));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(image));

@override
String toString() {
  return 'BrandEvent.logoUpload(image: $image)';
}


}

/// @nodoc
abstract mixin class $LogoUploadCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $LogoUploadCopyWith(LogoUpload value, $Res Function(LogoUpload) _then) = _$LogoUploadCopyWithImpl;
@useResult
$Res call({
 Uint8List? image
});




}
/// @nodoc
class _$LogoUploadCopyWithImpl<$Res>
    implements $LogoUploadCopyWith<$Res> {
  _$LogoUploadCopyWithImpl(this._self, this._then);

  final LogoUpload _self;
  final $Res Function(LogoUpload) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = freezed,}) {
  return _then(LogoUpload(
freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc


class ClearLogoImage implements BrandEvent {
  const ClearLogoImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearLogoImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandEvent.clearLogoImage()';
}


}




/// @nodoc


class StartEditing implements BrandEvent {
  const StartEditing(this.brand);
  

 final  BrandModel brand;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartEditingCopyWith<StartEditing> get copyWith => _$StartEditingCopyWithImpl<StartEditing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartEditing&&(identical(other.brand, brand) || other.brand == brand));
}


@override
int get hashCode => Object.hash(runtimeType,brand);

@override
String toString() {
  return 'BrandEvent.startEditing(brand: $brand)';
}


}

/// @nodoc
abstract mixin class $StartEditingCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $StartEditingCopyWith(StartEditing value, $Res Function(StartEditing) _then) = _$StartEditingCopyWithImpl;
@useResult
$Res call({
 BrandModel brand
});


$BrandModelCopyWith<$Res> get brand;

}
/// @nodoc
class _$StartEditingCopyWithImpl<$Res>
    implements $StartEditingCopyWith<$Res> {
  _$StartEditingCopyWithImpl(this._self, this._then);

  final StartEditing _self;
  final $Res Function(StartEditing) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? brand = null,}) {
  return _then(StartEditing(
null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as BrandModel,
  ));
}

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res> get brand {
  
  return $BrandModelCopyWith<$Res>(_self.brand, (value) {
    return _then(_self.copyWith(brand: value));
  });
}
}

/// @nodoc


class UpdateLogoImage implements BrandEvent {
  const UpdateLogoImage(this.imageBytes);
  

 final  Uint8List imageBytes;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLogoImageCopyWith<UpdateLogoImage> get copyWith => _$UpdateLogoImageCopyWithImpl<UpdateLogoImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLogoImage&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imageBytes));

@override
String toString() {
  return 'BrandEvent.updateLogoImage(imageBytes: $imageBytes)';
}


}

/// @nodoc
abstract mixin class $UpdateLogoImageCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $UpdateLogoImageCopyWith(UpdateLogoImage value, $Res Function(UpdateLogoImage) _then) = _$UpdateLogoImageCopyWithImpl;
@useResult
$Res call({
 Uint8List imageBytes
});




}
/// @nodoc
class _$UpdateLogoImageCopyWithImpl<$Res>
    implements $UpdateLogoImageCopyWith<$Res> {
  _$UpdateLogoImageCopyWithImpl(this._self, this._then);

  final UpdateLogoImage _self;
  final $Res Function(UpdateLogoImage) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageBytes = null,}) {
  return _then(UpdateLogoImage(
null == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

/// @nodoc


class UpdateBrandImage implements BrandEvent {
  const UpdateBrandImage(this.imageBytes);
  

 final  Uint8List imageBytes;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBrandImageCopyWith<UpdateBrandImage> get copyWith => _$UpdateBrandImageCopyWithImpl<UpdateBrandImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBrandImage&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imageBytes));

@override
String toString() {
  return 'BrandEvent.updateBrandImage(imageBytes: $imageBytes)';
}


}

/// @nodoc
abstract mixin class $UpdateBrandImageCopyWith<$Res> implements $BrandEventCopyWith<$Res> {
  factory $UpdateBrandImageCopyWith(UpdateBrandImage value, $Res Function(UpdateBrandImage) _then) = _$UpdateBrandImageCopyWithImpl;
@useResult
$Res call({
 Uint8List imageBytes
});




}
/// @nodoc
class _$UpdateBrandImageCopyWithImpl<$Res>
    implements $UpdateBrandImageCopyWith<$Res> {
  _$UpdateBrandImageCopyWithImpl(this._self, this._then);

  final UpdateBrandImage _self;
  final $Res Function(UpdateBrandImage) _then;

/// Create a copy of BrandEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageBytes = null,}) {
  return _then(UpdateBrandImage(
null == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

/// @nodoc


class ClearEditedLogoImage implements BrandEvent {
  const ClearEditedLogoImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearEditedLogoImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandEvent.clearEditedLogoImage()';
}


}




/// @nodoc


class ClearEditedBrandImage implements BrandEvent {
  const ClearEditedBrandImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearEditedBrandImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandEvent.clearEditedBrandImage()';
}


}




/// @nodoc
mixin _$BrandState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandState()';
}


}

/// @nodoc
class $BrandStateCopyWith<$Res>  {
$BrandStateCopyWith(BrandState _, $Res Function(BrandState) __);
}


/// Adds pattern-matching-related methods to [BrandState].
extension BrandStatePatterns on BrandState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BrandInitial value)?  initial,TResult Function( BrandLoading value)?  loading,TResult Function( BrandSuccess value)?  success,TResult Function( BrandLoaded value)?  loaded,TResult Function( BrandError value)?  error,TResult Function( ImagesUpdatedState value)?  imagesUpdated,TResult Function( ImageClearedState value)?  imageClearedState,TResult Function( RemovedImageState value)?  removedImageState,TResult Function( BrandEditingState value)?  editing,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BrandInitial() when initial != null:
return initial(_that);case BrandLoading() when loading != null:
return loading(_that);case BrandSuccess() when success != null:
return success(_that);case BrandLoaded() when loaded != null:
return loaded(_that);case BrandError() when error != null:
return error(_that);case ImagesUpdatedState() when imagesUpdated != null:
return imagesUpdated(_that);case ImageClearedState() when imageClearedState != null:
return imageClearedState(_that);case RemovedImageState() when removedImageState != null:
return removedImageState(_that);case BrandEditingState() when editing != null:
return editing(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BrandInitial value)  initial,required TResult Function( BrandLoading value)  loading,required TResult Function( BrandSuccess value)  success,required TResult Function( BrandLoaded value)  loaded,required TResult Function( BrandError value)  error,required TResult Function( ImagesUpdatedState value)  imagesUpdated,required TResult Function( ImageClearedState value)  imageClearedState,required TResult Function( RemovedImageState value)  removedImageState,required TResult Function( BrandEditingState value)  editing,}){
final _that = this;
switch (_that) {
case BrandInitial():
return initial(_that);case BrandLoading():
return loading(_that);case BrandSuccess():
return success(_that);case BrandLoaded():
return loaded(_that);case BrandError():
return error(_that);case ImagesUpdatedState():
return imagesUpdated(_that);case ImageClearedState():
return imageClearedState(_that);case RemovedImageState():
return removedImageState(_that);case BrandEditingState():
return editing(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BrandInitial value)?  initial,TResult? Function( BrandLoading value)?  loading,TResult? Function( BrandSuccess value)?  success,TResult? Function( BrandLoaded value)?  loaded,TResult? Function( BrandError value)?  error,TResult? Function( ImagesUpdatedState value)?  imagesUpdated,TResult? Function( ImageClearedState value)?  imageClearedState,TResult? Function( RemovedImageState value)?  removedImageState,TResult? Function( BrandEditingState value)?  editing,}){
final _that = this;
switch (_that) {
case BrandInitial() when initial != null:
return initial(_that);case BrandLoading() when loading != null:
return loading(_that);case BrandSuccess() when success != null:
return success(_that);case BrandLoaded() when loaded != null:
return loaded(_that);case BrandError() when error != null:
return error(_that);case ImagesUpdatedState() when imagesUpdated != null:
return imagesUpdated(_that);case ImageClearedState() when imageClearedState != null:
return imageClearedState(_that);case RemovedImageState() when removedImageState != null:
return removedImageState(_that);case BrandEditingState() when editing != null:
return editing(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( List<BrandModel> brands,  String? selectedBrand)?  loaded,TResult Function( String message)?  error,TResult Function( Uint8List? logoImage,  Uint8List? brandImage)?  imagesUpdated,TResult Function()?  imageClearedState,TResult Function()?  removedImageState,TResult Function( BrandModel brand,  Uint8List? newLogoImage,  Uint8List? newBrandImage)?  editing,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BrandInitial() when initial != null:
return initial();case BrandLoading() when loading != null:
return loading();case BrandSuccess() when success != null:
return success();case BrandLoaded() when loaded != null:
return loaded(_that.brands,_that.selectedBrand);case BrandError() when error != null:
return error(_that.message);case ImagesUpdatedState() when imagesUpdated != null:
return imagesUpdated(_that.logoImage,_that.brandImage);case ImageClearedState() when imageClearedState != null:
return imageClearedState();case RemovedImageState() when removedImageState != null:
return removedImageState();case BrandEditingState() when editing != null:
return editing(_that.brand,_that.newLogoImage,_that.newBrandImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( List<BrandModel> brands,  String? selectedBrand)  loaded,required TResult Function( String message)  error,required TResult Function( Uint8List? logoImage,  Uint8List? brandImage)  imagesUpdated,required TResult Function()  imageClearedState,required TResult Function()  removedImageState,required TResult Function( BrandModel brand,  Uint8List? newLogoImage,  Uint8List? newBrandImage)  editing,}) {final _that = this;
switch (_that) {
case BrandInitial():
return initial();case BrandLoading():
return loading();case BrandSuccess():
return success();case BrandLoaded():
return loaded(_that.brands,_that.selectedBrand);case BrandError():
return error(_that.message);case ImagesUpdatedState():
return imagesUpdated(_that.logoImage,_that.brandImage);case ImageClearedState():
return imageClearedState();case RemovedImageState():
return removedImageState();case BrandEditingState():
return editing(_that.brand,_that.newLogoImage,_that.newBrandImage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( List<BrandModel> brands,  String? selectedBrand)?  loaded,TResult? Function( String message)?  error,TResult? Function( Uint8List? logoImage,  Uint8List? brandImage)?  imagesUpdated,TResult? Function()?  imageClearedState,TResult? Function()?  removedImageState,TResult? Function( BrandModel brand,  Uint8List? newLogoImage,  Uint8List? newBrandImage)?  editing,}) {final _that = this;
switch (_that) {
case BrandInitial() when initial != null:
return initial();case BrandLoading() when loading != null:
return loading();case BrandSuccess() when success != null:
return success();case BrandLoaded() when loaded != null:
return loaded(_that.brands,_that.selectedBrand);case BrandError() when error != null:
return error(_that.message);case ImagesUpdatedState() when imagesUpdated != null:
return imagesUpdated(_that.logoImage,_that.brandImage);case ImageClearedState() when imageClearedState != null:
return imageClearedState();case RemovedImageState() when removedImageState != null:
return removedImageState();case BrandEditingState() when editing != null:
return editing(_that.brand,_that.newLogoImage,_that.newBrandImage);case _:
  return null;

}
}

}

/// @nodoc


class BrandInitial implements BrandState {
  const BrandInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandState.initial()';
}


}




/// @nodoc


class BrandLoading implements BrandState {
  const BrandLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandState.loading()';
}


}




/// @nodoc


class BrandSuccess implements BrandState {
  const BrandSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandState.success()';
}


}




/// @nodoc


class BrandLoaded implements BrandState {
  const BrandLoaded({required final  List<BrandModel> brands, this.selectedBrand}): _brands = brands;
  

 final  List<BrandModel> _brands;
 List<BrandModel> get brands {
  if (_brands is EqualUnmodifiableListView) return _brands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brands);
}

 final  String? selectedBrand;

/// Create a copy of BrandState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandLoadedCopyWith<BrandLoaded> get copyWith => _$BrandLoadedCopyWithImpl<BrandLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandLoaded&&const DeepCollectionEquality().equals(other._brands, _brands)&&(identical(other.selectedBrand, selectedBrand) || other.selectedBrand == selectedBrand));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_brands),selectedBrand);

@override
String toString() {
  return 'BrandState.loaded(brands: $brands, selectedBrand: $selectedBrand)';
}


}

/// @nodoc
abstract mixin class $BrandLoadedCopyWith<$Res> implements $BrandStateCopyWith<$Res> {
  factory $BrandLoadedCopyWith(BrandLoaded value, $Res Function(BrandLoaded) _then) = _$BrandLoadedCopyWithImpl;
@useResult
$Res call({
 List<BrandModel> brands, String? selectedBrand
});




}
/// @nodoc
class _$BrandLoadedCopyWithImpl<$Res>
    implements $BrandLoadedCopyWith<$Res> {
  _$BrandLoadedCopyWithImpl(this._self, this._then);

  final BrandLoaded _self;
  final $Res Function(BrandLoaded) _then;

/// Create a copy of BrandState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? brands = null,Object? selectedBrand = freezed,}) {
  return _then(BrandLoaded(
brands: null == brands ? _self._brands : brands // ignore: cast_nullable_to_non_nullable
as List<BrandModel>,selectedBrand: freezed == selectedBrand ? _self.selectedBrand : selectedBrand // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class BrandError implements BrandState {
  const BrandError(this.message);
  

 final  String message;

/// Create a copy of BrandState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandErrorCopyWith<BrandError> get copyWith => _$BrandErrorCopyWithImpl<BrandError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BrandState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $BrandErrorCopyWith<$Res> implements $BrandStateCopyWith<$Res> {
  factory $BrandErrorCopyWith(BrandError value, $Res Function(BrandError) _then) = _$BrandErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BrandErrorCopyWithImpl<$Res>
    implements $BrandErrorCopyWith<$Res> {
  _$BrandErrorCopyWithImpl(this._self, this._then);

  final BrandError _self;
  final $Res Function(BrandError) _then;

/// Create a copy of BrandState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BrandError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ImagesUpdatedState implements BrandState {
  const ImagesUpdatedState({this.logoImage, this.brandImage});
  

 final  Uint8List? logoImage;
 final  Uint8List? brandImage;

/// Create a copy of BrandState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImagesUpdatedStateCopyWith<ImagesUpdatedState> get copyWith => _$ImagesUpdatedStateCopyWithImpl<ImagesUpdatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImagesUpdatedState&&const DeepCollectionEquality().equals(other.logoImage, logoImage)&&const DeepCollectionEquality().equals(other.brandImage, brandImage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logoImage),const DeepCollectionEquality().hash(brandImage));

@override
String toString() {
  return 'BrandState.imagesUpdated(logoImage: $logoImage, brandImage: $brandImage)';
}


}

/// @nodoc
abstract mixin class $ImagesUpdatedStateCopyWith<$Res> implements $BrandStateCopyWith<$Res> {
  factory $ImagesUpdatedStateCopyWith(ImagesUpdatedState value, $Res Function(ImagesUpdatedState) _then) = _$ImagesUpdatedStateCopyWithImpl;
@useResult
$Res call({
 Uint8List? logoImage, Uint8List? brandImage
});




}
/// @nodoc
class _$ImagesUpdatedStateCopyWithImpl<$Res>
    implements $ImagesUpdatedStateCopyWith<$Res> {
  _$ImagesUpdatedStateCopyWithImpl(this._self, this._then);

  final ImagesUpdatedState _self;
  final $Res Function(ImagesUpdatedState) _then;

/// Create a copy of BrandState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? logoImage = freezed,Object? brandImage = freezed,}) {
  return _then(ImagesUpdatedState(
logoImage: freezed == logoImage ? _self.logoImage : logoImage // ignore: cast_nullable_to_non_nullable
as Uint8List?,brandImage: freezed == brandImage ? _self.brandImage : brandImage // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc


class ImageClearedState implements BrandState {
  const ImageClearedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageClearedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandState.imageClearedState()';
}


}




/// @nodoc


class RemovedImageState implements BrandState {
  const RemovedImageState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemovedImageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BrandState.removedImageState()';
}


}




/// @nodoc


class BrandEditingState implements BrandState {
  const BrandEditingState({required this.brand, this.newLogoImage, this.newBrandImage});
  

 final  BrandModel brand;
 final  Uint8List? newLogoImage;
 final  Uint8List? newBrandImage;

/// Create a copy of BrandState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandEditingStateCopyWith<BrandEditingState> get copyWith => _$BrandEditingStateCopyWithImpl<BrandEditingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandEditingState&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other.newLogoImage, newLogoImage)&&const DeepCollectionEquality().equals(other.newBrandImage, newBrandImage));
}


@override
int get hashCode => Object.hash(runtimeType,brand,const DeepCollectionEquality().hash(newLogoImage),const DeepCollectionEquality().hash(newBrandImage));

@override
String toString() {
  return 'BrandState.editing(brand: $brand, newLogoImage: $newLogoImage, newBrandImage: $newBrandImage)';
}


}

/// @nodoc
abstract mixin class $BrandEditingStateCopyWith<$Res> implements $BrandStateCopyWith<$Res> {
  factory $BrandEditingStateCopyWith(BrandEditingState value, $Res Function(BrandEditingState) _then) = _$BrandEditingStateCopyWithImpl;
@useResult
$Res call({
 BrandModel brand, Uint8List? newLogoImage, Uint8List? newBrandImage
});


$BrandModelCopyWith<$Res> get brand;

}
/// @nodoc
class _$BrandEditingStateCopyWithImpl<$Res>
    implements $BrandEditingStateCopyWith<$Res> {
  _$BrandEditingStateCopyWithImpl(this._self, this._then);

  final BrandEditingState _self;
  final $Res Function(BrandEditingState) _then;

/// Create a copy of BrandState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? brand = null,Object? newLogoImage = freezed,Object? newBrandImage = freezed,}) {
  return _then(BrandEditingState(
brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as BrandModel,newLogoImage: freezed == newLogoImage ? _self.newLogoImage : newLogoImage // ignore: cast_nullable_to_non_nullable
as Uint8List?,newBrandImage: freezed == newBrandImage ? _self.newBrandImage : newBrandImage // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

/// Create a copy of BrandState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res> get brand {
  
  return $BrandModelCopyWith<$Res>(_self.brand, (value) {
    return _then(_self.copyWith(brand: value));
  });
}
}

// dart format on
