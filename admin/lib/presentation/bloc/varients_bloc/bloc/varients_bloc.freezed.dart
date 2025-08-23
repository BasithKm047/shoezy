// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'varients_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VariantsEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariantsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent()';
}


}

/// @nodoc
class $VariantsEventCopyWith<$Res>  {
$VariantsEventCopyWith(VariantsEvent _, $Res Function(VariantsEvent) __);
}


/// Adds pattern-matching-related methods to [VariantsEvent].
extension VariantsEventPatterns on VariantsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ImageUploadedEvent value)?  imageUpload,TResult Function( _ImageRemoved value)?  imageRemoved,TResult Function( _AddVaraints value)?  addVariants,TResult Function( _Getvariants value)?  getVariants,TResult Function( _ResetImage value)?  resetImgae,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _AddVaraints() when addVariants != null:
return addVariants(_that);case _Getvariants() when getVariants != null:
return getVariants(_that);case _ResetImage() when resetImgae != null:
return resetImgae(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ImageUploadedEvent value)  imageUpload,required TResult Function( _ImageRemoved value)  imageRemoved,required TResult Function( _AddVaraints value)  addVariants,required TResult Function( _Getvariants value)  getVariants,required TResult Function( _ResetImage value)  resetImgae,}){
final _that = this;
switch (_that) {
case _ImageUploadedEvent():
return imageUpload(_that);case _ImageRemoved():
return imageRemoved(_that);case _AddVaraints():
return addVariants(_that);case _Getvariants():
return getVariants(_that);case _ResetImage():
return resetImgae(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ImageUploadedEvent value)?  imageUpload,TResult? Function( _ImageRemoved value)?  imageRemoved,TResult? Function( _AddVaraints value)?  addVariants,TResult? Function( _Getvariants value)?  getVariants,TResult? Function( _ResetImage value)?  resetImgae,}){
final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _AddVaraints() when addVariants != null:
return addVariants(_that);case _Getvariants() when getVariants != null:
return getVariants(_that);case _ResetImage() when resetImgae != null:
return resetImgae(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Uint8List> image)?  imageUpload,TResult Function( Uint8List removedImage)?  imageRemoved,TResult Function( Variantsmodel varaints)?  addVariants,TResult Function()?  getVariants,TResult Function()?  resetImgae,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that.image);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.removedImage);case _AddVaraints() when addVariants != null:
return addVariants(_that.varaints);case _Getvariants() when getVariants != null:
return getVariants();case _ResetImage() when resetImgae != null:
return resetImgae();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Uint8List> image)  imageUpload,required TResult Function( Uint8List removedImage)  imageRemoved,required TResult Function( Variantsmodel varaints)  addVariants,required TResult Function()  getVariants,required TResult Function()  resetImgae,}) {final _that = this;
switch (_that) {
case _ImageUploadedEvent():
return imageUpload(_that.image);case _ImageRemoved():
return imageRemoved(_that.removedImage);case _AddVaraints():
return addVariants(_that.varaints);case _Getvariants():
return getVariants();case _ResetImage():
return resetImgae();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Uint8List> image)?  imageUpload,TResult? Function( Uint8List removedImage)?  imageRemoved,TResult? Function( Variantsmodel varaints)?  addVariants,TResult? Function()?  getVariants,TResult? Function()?  resetImgae,}) {final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that.image);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.removedImage);case _AddVaraints() when addVariants != null:
return addVariants(_that.varaints);case _Getvariants() when getVariants != null:
return getVariants();case _ResetImage() when resetImgae != null:
return resetImgae();case _:
  return null;

}
}

}

/// @nodoc


class _ImageUploadedEvent with DiagnosticableTreeMixin implements VariantsEvent {
  const _ImageUploadedEvent(final  List<Uint8List> image): _image = image;
  

 final  List<Uint8List> _image;
 List<Uint8List> get image {
  if (_image is EqualUnmodifiableListView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_image);
}


/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageUploadedEventCopyWith<_ImageUploadedEvent> get copyWith => __$ImageUploadedEventCopyWithImpl<_ImageUploadedEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.imageUpload'))
    ..add(DiagnosticsProperty('image', image));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageUploadedEvent&&const DeepCollectionEquality().equals(other._image, _image));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_image));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.imageUpload(image: $image)';
}


}

/// @nodoc
abstract mixin class _$ImageUploadedEventCopyWith<$Res> implements $VariantsEventCopyWith<$Res> {
  factory _$ImageUploadedEventCopyWith(_ImageUploadedEvent value, $Res Function(_ImageUploadedEvent) _then) = __$ImageUploadedEventCopyWithImpl;
@useResult
$Res call({
 List<Uint8List> image
});




}
/// @nodoc
class __$ImageUploadedEventCopyWithImpl<$Res>
    implements _$ImageUploadedEventCopyWith<$Res> {
  __$ImageUploadedEventCopyWithImpl(this._self, this._then);

  final _ImageUploadedEvent _self;
  final $Res Function(_ImageUploadedEvent) _then;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_ImageUploadedEvent(
null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

/// @nodoc


class _ImageRemoved with DiagnosticableTreeMixin implements VariantsEvent {
  const _ImageRemoved(this.removedImage);
  

 final  Uint8List removedImage;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageRemovedCopyWith<_ImageRemoved> get copyWith => __$ImageRemovedCopyWithImpl<_ImageRemoved>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.imageRemoved'))
    ..add(DiagnosticsProperty('removedImage', removedImage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageRemoved&&const DeepCollectionEquality().equals(other.removedImage, removedImage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(removedImage));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.imageRemoved(removedImage: $removedImage)';
}


}

/// @nodoc
abstract mixin class _$ImageRemovedCopyWith<$Res> implements $VariantsEventCopyWith<$Res> {
  factory _$ImageRemovedCopyWith(_ImageRemoved value, $Res Function(_ImageRemoved) _then) = __$ImageRemovedCopyWithImpl;
@useResult
$Res call({
 Uint8List removedImage
});




}
/// @nodoc
class __$ImageRemovedCopyWithImpl<$Res>
    implements _$ImageRemovedCopyWith<$Res> {
  __$ImageRemovedCopyWithImpl(this._self, this._then);

  final _ImageRemoved _self;
  final $Res Function(_ImageRemoved) _then;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? removedImage = null,}) {
  return _then(_ImageRemoved(
null == removedImage ? _self.removedImage : removedImage // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

/// @nodoc


class _AddVaraints with DiagnosticableTreeMixin implements VariantsEvent {
  const _AddVaraints(this.varaints);
  

 final  Variantsmodel varaints;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddVaraintsCopyWith<_AddVaraints> get copyWith => __$AddVaraintsCopyWithImpl<_AddVaraints>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.addVariants'))
    ..add(DiagnosticsProperty('varaints', varaints));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddVaraints&&(identical(other.varaints, varaints) || other.varaints == varaints));
}


@override
int get hashCode => Object.hash(runtimeType,varaints);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.addVariants(varaints: $varaints)';
}


}

/// @nodoc
abstract mixin class _$AddVaraintsCopyWith<$Res> implements $VariantsEventCopyWith<$Res> {
  factory _$AddVaraintsCopyWith(_AddVaraints value, $Res Function(_AddVaraints) _then) = __$AddVaraintsCopyWithImpl;
@useResult
$Res call({
 Variantsmodel varaints
});


$VariantsmodelCopyWith<$Res> get varaints;

}
/// @nodoc
class __$AddVaraintsCopyWithImpl<$Res>
    implements _$AddVaraintsCopyWith<$Res> {
  __$AddVaraintsCopyWithImpl(this._self, this._then);

  final _AddVaraints _self;
  final $Res Function(_AddVaraints) _then;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? varaints = null,}) {
  return _then(_AddVaraints(
null == varaints ? _self.varaints : varaints // ignore: cast_nullable_to_non_nullable
as Variantsmodel,
  ));
}

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VariantsmodelCopyWith<$Res> get varaints {
  
  return $VariantsmodelCopyWith<$Res>(_self.varaints, (value) {
    return _then(_self.copyWith(varaints: value));
  });
}
}

/// @nodoc


class _Getvariants with DiagnosticableTreeMixin implements VariantsEvent {
  const _Getvariants();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.getVariants'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Getvariants);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.getVariants()';
}


}




/// @nodoc


class _ResetImage with DiagnosticableTreeMixin implements VariantsEvent {
  const _ResetImage();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.resetImgae'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.resetImgae()';
}


}




/// @nodoc
mixin _$VariantsState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariantsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState()';
}


}

/// @nodoc
class $VariantsStateCopyWith<$Res>  {
$VariantsStateCopyWith(VariantsState _, $Res Function(VariantsState) __);
}


/// Adds pattern-matching-related methods to [VariantsState].
extension VariantsStatePatterns on VariantsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initail value)?  inintial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _ImageAddedState value)?  imageAddedState,TResult Function( _Failure value)?  failure,TResult Function( _ImageRemovedState value)?  imageRemovedState,TResult Function( _VariantsLoaded value)?  variantsLoaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that);case _Failure() when failure != null:
return failure(_that);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that);case _VariantsLoaded() when variantsLoaded != null:
return variantsLoaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initail value)  inintial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _ImageAddedState value)  imageAddedState,required TResult Function( _Failure value)  failure,required TResult Function( _ImageRemovedState value)  imageRemovedState,required TResult Function( _VariantsLoaded value)  variantsLoaded,}){
final _that = this;
switch (_that) {
case _Initail():
return inintial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _ImageAddedState():
return imageAddedState(_that);case _Failure():
return failure(_that);case _ImageRemovedState():
return imageRemovedState(_that);case _VariantsLoaded():
return variantsLoaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initail value)?  inintial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _ImageAddedState value)?  imageAddedState,TResult? Function( _Failure value)?  failure,TResult? Function( _ImageRemovedState value)?  imageRemovedState,TResult? Function( _VariantsLoaded value)?  variantsLoaded,}){
final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that);case _Failure() when failure != null:
return failure(_that);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that);case _VariantsLoaded() when variantsLoaded != null:
return variantsLoaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  inintial,TResult Function()?  loading,TResult Function()?  success,TResult Function( List<Uint8List> images)?  imageAddedState,TResult Function( String error)?  failure,TResult Function( List<Uint8List> image)?  imageRemovedState,TResult Function( List<Variantsmodel> variants)?  variantsLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that.images);case _Failure() when failure != null:
return failure(_that.error);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that.image);case _VariantsLoaded() when variantsLoaded != null:
return variantsLoaded(_that.variants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  inintial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( List<Uint8List> images)  imageAddedState,required TResult Function( String error)  failure,required TResult Function( List<Uint8List> image)  imageRemovedState,required TResult Function( List<Variantsmodel> variants)  variantsLoaded,}) {final _that = this;
switch (_that) {
case _Initail():
return inintial();case _Loading():
return loading();case _Success():
return success();case _ImageAddedState():
return imageAddedState(_that.images);case _Failure():
return failure(_that.error);case _ImageRemovedState():
return imageRemovedState(_that.image);case _VariantsLoaded():
return variantsLoaded(_that.variants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  inintial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( List<Uint8List> images)?  imageAddedState,TResult? Function( String error)?  failure,TResult? Function( List<Uint8List> image)?  imageRemovedState,TResult? Function( List<Variantsmodel> variants)?  variantsLoaded,}) {final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that.images);case _Failure() when failure != null:
return failure(_that.error);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that.image);case _VariantsLoaded() when variantsLoaded != null:
return variantsLoaded(_that.variants);case _:
  return null;

}
}

}

/// @nodoc


class _Initail with DiagnosticableTreeMixin implements VariantsState {
  const _Initail();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.inintial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.inintial()';
}


}




/// @nodoc


class _Loading with DiagnosticableTreeMixin implements VariantsState {
  const _Loading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.loading()';
}


}




/// @nodoc


class _Success with DiagnosticableTreeMixin implements VariantsState {
  const _Success();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.success'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.success()';
}


}




/// @nodoc


class _ImageAddedState with DiagnosticableTreeMixin implements VariantsState {
  const _ImageAddedState(final  List<Uint8List> images): _images = images;
  

 final  List<Uint8List> _images;
 List<Uint8List> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageAddedStateCopyWith<_ImageAddedState> get copyWith => __$ImageAddedStateCopyWithImpl<_ImageAddedState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.imageAddedState'))
    ..add(DiagnosticsProperty('images', images));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageAddedState&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.imageAddedState(images: $images)';
}


}

/// @nodoc
abstract mixin class _$ImageAddedStateCopyWith<$Res> implements $VariantsStateCopyWith<$Res> {
  factory _$ImageAddedStateCopyWith(_ImageAddedState value, $Res Function(_ImageAddedState) _then) = __$ImageAddedStateCopyWithImpl;
@useResult
$Res call({
 List<Uint8List> images
});




}
/// @nodoc
class __$ImageAddedStateCopyWithImpl<$Res>
    implements _$ImageAddedStateCopyWith<$Res> {
  __$ImageAddedStateCopyWithImpl(this._self, this._then);

  final _ImageAddedState _self;
  final $Res Function(_ImageAddedState) _then;

/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(_ImageAddedState(
null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

/// @nodoc


class _Failure with DiagnosticableTreeMixin implements VariantsState {
  const _Failure(this.error);
  

 final  String error;

/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.failure'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $VariantsStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Failure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ImageRemovedState with DiagnosticableTreeMixin implements VariantsState {
  const _ImageRemovedState(final  List<Uint8List> image): _image = image;
  

 final  List<Uint8List> _image;
 List<Uint8List> get image {
  if (_image is EqualUnmodifiableListView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_image);
}


/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageRemovedStateCopyWith<_ImageRemovedState> get copyWith => __$ImageRemovedStateCopyWithImpl<_ImageRemovedState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.imageRemovedState'))
    ..add(DiagnosticsProperty('image', image));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageRemovedState&&const DeepCollectionEquality().equals(other._image, _image));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_image));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.imageRemovedState(image: $image)';
}


}

/// @nodoc
abstract mixin class _$ImageRemovedStateCopyWith<$Res> implements $VariantsStateCopyWith<$Res> {
  factory _$ImageRemovedStateCopyWith(_ImageRemovedState value, $Res Function(_ImageRemovedState) _then) = __$ImageRemovedStateCopyWithImpl;
@useResult
$Res call({
 List<Uint8List> image
});




}
/// @nodoc
class __$ImageRemovedStateCopyWithImpl<$Res>
    implements _$ImageRemovedStateCopyWith<$Res> {
  __$ImageRemovedStateCopyWithImpl(this._self, this._then);

  final _ImageRemovedState _self;
  final $Res Function(_ImageRemovedState) _then;

/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_ImageRemovedState(
null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

/// @nodoc


class _VariantsLoaded with DiagnosticableTreeMixin implements VariantsState {
  const _VariantsLoaded(final  List<Variantsmodel> variants): _variants = variants;
  

 final  List<Variantsmodel> _variants;
 List<Variantsmodel> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}


/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantsLoadedCopyWith<_VariantsLoaded> get copyWith => __$VariantsLoadedCopyWithImpl<_VariantsLoaded>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.variantsLoaded'))
    ..add(DiagnosticsProperty('variants', variants));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantsLoaded&&const DeepCollectionEquality().equals(other._variants, _variants));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_variants));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.variantsLoaded(variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$VariantsLoadedCopyWith<$Res> implements $VariantsStateCopyWith<$Res> {
  factory _$VariantsLoadedCopyWith(_VariantsLoaded value, $Res Function(_VariantsLoaded) _then) = __$VariantsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Variantsmodel> variants
});




}
/// @nodoc
class __$VariantsLoadedCopyWithImpl<$Res>
    implements _$VariantsLoadedCopyWith<$Res> {
  __$VariantsLoadedCopyWithImpl(this._self, this._then);

  final _VariantsLoaded _self;
  final $Res Function(_VariantsLoaded) _then;

/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? variants = null,}) {
  return _then(_VariantsLoaded(
null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variantsmodel>,
  ));
}


}

// dart format on
