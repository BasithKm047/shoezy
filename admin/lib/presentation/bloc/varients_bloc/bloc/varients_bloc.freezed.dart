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
mixin _$VarientsEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VarientsEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VarientsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VarientsEvent()';
}


}

/// @nodoc
class $VarientsEventCopyWith<$Res>  {
$VarientsEventCopyWith(VarientsEvent _, $Res Function(VarientsEvent) __);
}


/// Adds pattern-matching-related methods to [VarientsEvent].
extension VarientsEventPatterns on VarientsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ImageUploadedEvent value)?  imageUpload,TResult Function( _ImageRemoved value)?  imageRemoved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ImageUploadedEvent value)  imageUpload,required TResult Function( _ImageRemoved value)  imageRemoved,}){
final _that = this;
switch (_that) {
case _ImageUploadedEvent():
return imageUpload(_that);case _ImageRemoved():
return imageRemoved(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ImageUploadedEvent value)?  imageUpload,TResult? Function( _ImageRemoved value)?  imageRemoved,}){
final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Uint8List> image)?  imageUpload,TResult Function( Uint8List removedImage)?  imageRemoved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that.image);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.removedImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Uint8List> image)  imageUpload,required TResult Function( Uint8List removedImage)  imageRemoved,}) {final _that = this;
switch (_that) {
case _ImageUploadedEvent():
return imageUpload(_that.image);case _ImageRemoved():
return imageRemoved(_that.removedImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Uint8List> image)?  imageUpload,TResult? Function( Uint8List removedImage)?  imageRemoved,}) {final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that.image);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.removedImage);case _:
  return null;

}
}

}

/// @nodoc


class _ImageUploadedEvent with DiagnosticableTreeMixin implements VarientsEvent {
  const _ImageUploadedEvent(final  List<Uint8List> image): _image = image;
  

 final  List<Uint8List> _image;
 List<Uint8List> get image {
  if (_image is EqualUnmodifiableListView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_image);
}


/// Create a copy of VarientsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageUploadedEventCopyWith<_ImageUploadedEvent> get copyWith => __$ImageUploadedEventCopyWithImpl<_ImageUploadedEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VarientsEvent.imageUpload'))
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
  return 'VarientsEvent.imageUpload(image: $image)';
}


}

/// @nodoc
abstract mixin class _$ImageUploadedEventCopyWith<$Res> implements $VarientsEventCopyWith<$Res> {
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

/// Create a copy of VarientsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_ImageUploadedEvent(
null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

/// @nodoc


class _ImageRemoved with DiagnosticableTreeMixin implements VarientsEvent {
  const _ImageRemoved(this.removedImage);
  

 final  Uint8List removedImage;

/// Create a copy of VarientsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageRemovedCopyWith<_ImageRemoved> get copyWith => __$ImageRemovedCopyWithImpl<_ImageRemoved>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VarientsEvent.imageRemoved'))
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
  return 'VarientsEvent.imageRemoved(removedImage: $removedImage)';
}


}

/// @nodoc
abstract mixin class _$ImageRemovedCopyWith<$Res> implements $VarientsEventCopyWith<$Res> {
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

/// Create a copy of VarientsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? removedImage = null,}) {
  return _then(_ImageRemoved(
null == removedImage ? _self.removedImage : removedImage // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

/// @nodoc
mixin _$VarientsState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VarientsState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VarientsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VarientsState()';
}


}

/// @nodoc
class $VarientsStateCopyWith<$Res>  {
$VarientsStateCopyWith(VarientsState _, $Res Function(VarientsState) __);
}


/// Adds pattern-matching-related methods to [VarientsState].
extension VarientsStatePatterns on VarientsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initail value)?  inintial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _ImageAddedState value)?  imageAddedState,TResult Function( _Failure value)?  failure,TResult Function( _ImageRemovedState value)?  imageRemovedState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that);case _Failure() when failure != null:
return failure(_that);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initail value)  inintial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _ImageAddedState value)  imageAddedState,required TResult Function( _Failure value)  failure,required TResult Function( _ImageRemovedState value)  imageRemovedState,}){
final _that = this;
switch (_that) {
case _Initail():
return inintial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _ImageAddedState():
return imageAddedState(_that);case _Failure():
return failure(_that);case _ImageRemovedState():
return imageRemovedState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initail value)?  inintial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _ImageAddedState value)?  imageAddedState,TResult? Function( _Failure value)?  failure,TResult? Function( _ImageRemovedState value)?  imageRemovedState,}){
final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that);case _Failure() when failure != null:
return failure(_that);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  inintial,TResult Function()?  loading,TResult Function()?  success,TResult Function( List<Uint8List> images)?  imageAddedState,TResult Function( String error)?  failure,TResult Function( List<Uint8List> image)?  imageRemovedState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that.images);case _Failure() when failure != null:
return failure(_that.error);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  inintial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( List<Uint8List> images)  imageAddedState,required TResult Function( String error)  failure,required TResult Function( List<Uint8List> image)  imageRemovedState,}) {final _that = this;
switch (_that) {
case _Initail():
return inintial();case _Loading():
return loading();case _Success():
return success();case _ImageAddedState():
return imageAddedState(_that.images);case _Failure():
return failure(_that.error);case _ImageRemovedState():
return imageRemovedState(_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  inintial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( List<Uint8List> images)?  imageAddedState,TResult? Function( String error)?  failure,TResult? Function( List<Uint8List> image)?  imageRemovedState,}) {final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that.images);case _Failure() when failure != null:
return failure(_that.error);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that.image);case _:
  return null;

}
}

}

/// @nodoc


class _Initail with DiagnosticableTreeMixin implements VarientsState {
  const _Initail();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VarientsState.inintial'))
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
  return 'VarientsState.inintial()';
}


}




/// @nodoc


class _Loading with DiagnosticableTreeMixin implements VarientsState {
  const _Loading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VarientsState.loading'))
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
  return 'VarientsState.loading()';
}


}




/// @nodoc


class _Success with DiagnosticableTreeMixin implements VarientsState {
  const _Success();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VarientsState.success'))
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
  return 'VarientsState.success()';
}


}




/// @nodoc


class _ImageAddedState with DiagnosticableTreeMixin implements VarientsState {
  const _ImageAddedState(final  List<Uint8List> images): _images = images;
  

 final  List<Uint8List> _images;
 List<Uint8List> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of VarientsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageAddedStateCopyWith<_ImageAddedState> get copyWith => __$ImageAddedStateCopyWithImpl<_ImageAddedState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VarientsState.imageAddedState'))
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
  return 'VarientsState.imageAddedState(images: $images)';
}


}

/// @nodoc
abstract mixin class _$ImageAddedStateCopyWith<$Res> implements $VarientsStateCopyWith<$Res> {
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

/// Create a copy of VarientsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(_ImageAddedState(
null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

/// @nodoc


class _Failure with DiagnosticableTreeMixin implements VarientsState {
  const _Failure(this.error);
  

 final  String error;

/// Create a copy of VarientsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VarientsState.failure'))
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
  return 'VarientsState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $VarientsStateCopyWith<$Res> {
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

/// Create a copy of VarientsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Failure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ImageRemovedState with DiagnosticableTreeMixin implements VarientsState {
  const _ImageRemovedState(final  List<Uint8List> image): _image = image;
  

 final  List<Uint8List> _image;
 List<Uint8List> get image {
  if (_image is EqualUnmodifiableListView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_image);
}


/// Create a copy of VarientsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageRemovedStateCopyWith<_ImageRemovedState> get copyWith => __$ImageRemovedStateCopyWithImpl<_ImageRemovedState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VarientsState.imageRemovedState'))
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
  return 'VarientsState.imageRemovedState(image: $image)';
}


}

/// @nodoc
abstract mixin class _$ImageRemovedStateCopyWith<$Res> implements $VarientsStateCopyWith<$Res> {
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

/// Create a copy of VarientsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_ImageRemovedState(
null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,
  ));
}


}

// dart format on
