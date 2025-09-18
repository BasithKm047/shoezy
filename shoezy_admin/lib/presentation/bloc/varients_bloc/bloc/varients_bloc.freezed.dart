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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ImageUploadedEvent value)?  imageUpload,TResult Function( _ImageRemoved value)?  imageRemoved,TResult Function( _AddVaraints value)?  addVariants,TResult Function( _Getvariants value)?  getVariants,TResult Function( _ResetImage value)?  resetImgae,TResult Function( _RemoveVariants value)?  removeVariants,TResult Function( _UpdateVariants value)?  updateVariants,TResult Function( _SearchVariants value)?  searchVariants,TResult Function( _DeleteVariants value)?  deleteVariants,TResult Function( _ShowFields value)?  showFields,TResult Function( _HideFields value)?  hideFields,TResult Function( _ToggleFields value)?  toggleFields,TResult Function( _AddSizeStock value)?  addSizeStock,TResult Function( _RemoveSizeStock value)?  removeSizeStock,TResult Function( _ClearVariants value)?  clearVariants,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _AddVaraints() when addVariants != null:
return addVariants(_that);case _Getvariants() when getVariants != null:
return getVariants(_that);case _ResetImage() when resetImgae != null:
return resetImgae(_that);case _RemoveVariants() when removeVariants != null:
return removeVariants(_that);case _UpdateVariants() when updateVariants != null:
return updateVariants(_that);case _SearchVariants() when searchVariants != null:
return searchVariants(_that);case _DeleteVariants() when deleteVariants != null:
return deleteVariants(_that);case _ShowFields() when showFields != null:
return showFields(_that);case _HideFields() when hideFields != null:
return hideFields(_that);case _ToggleFields() when toggleFields != null:
return toggleFields(_that);case _AddSizeStock() when addSizeStock != null:
return addSizeStock(_that);case _RemoveSizeStock() when removeSizeStock != null:
return removeSizeStock(_that);case _ClearVariants() when clearVariants != null:
return clearVariants(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ImageUploadedEvent value)  imageUpload,required TResult Function( _ImageRemoved value)  imageRemoved,required TResult Function( _AddVaraints value)  addVariants,required TResult Function( _Getvariants value)  getVariants,required TResult Function( _ResetImage value)  resetImgae,required TResult Function( _RemoveVariants value)  removeVariants,required TResult Function( _UpdateVariants value)  updateVariants,required TResult Function( _SearchVariants value)  searchVariants,required TResult Function( _DeleteVariants value)  deleteVariants,required TResult Function( _ShowFields value)  showFields,required TResult Function( _HideFields value)  hideFields,required TResult Function( _ToggleFields value)  toggleFields,required TResult Function( _AddSizeStock value)  addSizeStock,required TResult Function( _RemoveSizeStock value)  removeSizeStock,required TResult Function( _ClearVariants value)  clearVariants,}){
final _that = this;
switch (_that) {
case _ImageUploadedEvent():
return imageUpload(_that);case _ImageRemoved():
return imageRemoved(_that);case _AddVaraints():
return addVariants(_that);case _Getvariants():
return getVariants(_that);case _ResetImage():
return resetImgae(_that);case _RemoveVariants():
return removeVariants(_that);case _UpdateVariants():
return updateVariants(_that);case _SearchVariants():
return searchVariants(_that);case _DeleteVariants():
return deleteVariants(_that);case _ShowFields():
return showFields(_that);case _HideFields():
return hideFields(_that);case _ToggleFields():
return toggleFields(_that);case _AddSizeStock():
return addSizeStock(_that);case _RemoveSizeStock():
return removeSizeStock(_that);case _ClearVariants():
return clearVariants(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ImageUploadedEvent value)?  imageUpload,TResult? Function( _ImageRemoved value)?  imageRemoved,TResult? Function( _AddVaraints value)?  addVariants,TResult? Function( _Getvariants value)?  getVariants,TResult? Function( _ResetImage value)?  resetImgae,TResult? Function( _RemoveVariants value)?  removeVariants,TResult? Function( _UpdateVariants value)?  updateVariants,TResult? Function( _SearchVariants value)?  searchVariants,TResult? Function( _DeleteVariants value)?  deleteVariants,TResult? Function( _ShowFields value)?  showFields,TResult? Function( _HideFields value)?  hideFields,TResult? Function( _ToggleFields value)?  toggleFields,TResult? Function( _AddSizeStock value)?  addSizeStock,TResult? Function( _RemoveSizeStock value)?  removeSizeStock,TResult? Function( _ClearVariants value)?  clearVariants,}){
final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that);case _AddVaraints() when addVariants != null:
return addVariants(_that);case _Getvariants() when getVariants != null:
return getVariants(_that);case _ResetImage() when resetImgae != null:
return resetImgae(_that);case _RemoveVariants() when removeVariants != null:
return removeVariants(_that);case _UpdateVariants() when updateVariants != null:
return updateVariants(_that);case _SearchVariants() when searchVariants != null:
return searchVariants(_that);case _DeleteVariants() when deleteVariants != null:
return deleteVariants(_that);case _ShowFields() when showFields != null:
return showFields(_that);case _HideFields() when hideFields != null:
return hideFields(_that);case _ToggleFields() when toggleFields != null:
return toggleFields(_that);case _AddSizeStock() when addSizeStock != null:
return addSizeStock(_that);case _RemoveSizeStock() when removeSizeStock != null:
return removeSizeStock(_that);case _ClearVariants() when clearVariants != null:
return clearVariants(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Uint8List> image)?  imageUpload,TResult Function( int index)?  imageRemoved,TResult Function( List<Variantsmodel> varaints)?  addVariants,TResult Function()?  getVariants,TResult Function()?  resetImgae,TResult Function( Variantsmodel variants)?  removeVariants,TResult Function( Variantsmodel variants)?  updateVariants,TResult Function( String query)?  searchVariants,TResult Function( String id)?  deleteVariants,TResult Function()?  showFields,TResult Function()?  hideFields,TResult Function()?  toggleFields,TResult Function( SizeStockModel sizeStock)?  addSizeStock,TResult Function( int index)?  removeSizeStock,TResult Function()?  clearVariants,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that.image);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.index);case _AddVaraints() when addVariants != null:
return addVariants(_that.varaints);case _Getvariants() when getVariants != null:
return getVariants();case _ResetImage() when resetImgae != null:
return resetImgae();case _RemoveVariants() when removeVariants != null:
return removeVariants(_that.variants);case _UpdateVariants() when updateVariants != null:
return updateVariants(_that.variants);case _SearchVariants() when searchVariants != null:
return searchVariants(_that.query);case _DeleteVariants() when deleteVariants != null:
return deleteVariants(_that.id);case _ShowFields() when showFields != null:
return showFields();case _HideFields() when hideFields != null:
return hideFields();case _ToggleFields() when toggleFields != null:
return toggleFields();case _AddSizeStock() when addSizeStock != null:
return addSizeStock(_that.sizeStock);case _RemoveSizeStock() when removeSizeStock != null:
return removeSizeStock(_that.index);case _ClearVariants() when clearVariants != null:
return clearVariants();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Uint8List> image)  imageUpload,required TResult Function( int index)  imageRemoved,required TResult Function( List<Variantsmodel> varaints)  addVariants,required TResult Function()  getVariants,required TResult Function()  resetImgae,required TResult Function( Variantsmodel variants)  removeVariants,required TResult Function( Variantsmodel variants)  updateVariants,required TResult Function( String query)  searchVariants,required TResult Function( String id)  deleteVariants,required TResult Function()  showFields,required TResult Function()  hideFields,required TResult Function()  toggleFields,required TResult Function( SizeStockModel sizeStock)  addSizeStock,required TResult Function( int index)  removeSizeStock,required TResult Function()  clearVariants,}) {final _that = this;
switch (_that) {
case _ImageUploadedEvent():
return imageUpload(_that.image);case _ImageRemoved():
return imageRemoved(_that.index);case _AddVaraints():
return addVariants(_that.varaints);case _Getvariants():
return getVariants();case _ResetImage():
return resetImgae();case _RemoveVariants():
return removeVariants(_that.variants);case _UpdateVariants():
return updateVariants(_that.variants);case _SearchVariants():
return searchVariants(_that.query);case _DeleteVariants():
return deleteVariants(_that.id);case _ShowFields():
return showFields();case _HideFields():
return hideFields();case _ToggleFields():
return toggleFields();case _AddSizeStock():
return addSizeStock(_that.sizeStock);case _RemoveSizeStock():
return removeSizeStock(_that.index);case _ClearVariants():
return clearVariants();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Uint8List> image)?  imageUpload,TResult? Function( int index)?  imageRemoved,TResult? Function( List<Variantsmodel> varaints)?  addVariants,TResult? Function()?  getVariants,TResult? Function()?  resetImgae,TResult? Function( Variantsmodel variants)?  removeVariants,TResult? Function( Variantsmodel variants)?  updateVariants,TResult? Function( String query)?  searchVariants,TResult? Function( String id)?  deleteVariants,TResult? Function()?  showFields,TResult? Function()?  hideFields,TResult? Function()?  toggleFields,TResult? Function( SizeStockModel sizeStock)?  addSizeStock,TResult? Function( int index)?  removeSizeStock,TResult? Function()?  clearVariants,}) {final _that = this;
switch (_that) {
case _ImageUploadedEvent() when imageUpload != null:
return imageUpload(_that.image);case _ImageRemoved() when imageRemoved != null:
return imageRemoved(_that.index);case _AddVaraints() when addVariants != null:
return addVariants(_that.varaints);case _Getvariants() when getVariants != null:
return getVariants();case _ResetImage() when resetImgae != null:
return resetImgae();case _RemoveVariants() when removeVariants != null:
return removeVariants(_that.variants);case _UpdateVariants() when updateVariants != null:
return updateVariants(_that.variants);case _SearchVariants() when searchVariants != null:
return searchVariants(_that.query);case _DeleteVariants() when deleteVariants != null:
return deleteVariants(_that.id);case _ShowFields() when showFields != null:
return showFields();case _HideFields() when hideFields != null:
return hideFields();case _ToggleFields() when toggleFields != null:
return toggleFields();case _AddSizeStock() when addSizeStock != null:
return addSizeStock(_that.sizeStock);case _RemoveSizeStock() when removeSizeStock != null:
return removeSizeStock(_that.index);case _ClearVariants() when clearVariants != null:
return clearVariants();case _:
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
  const _ImageRemoved(this.index);
  

 final  int index;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageRemovedCopyWith<_ImageRemoved> get copyWith => __$ImageRemovedCopyWithImpl<_ImageRemoved>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.imageRemoved'))
    ..add(DiagnosticsProperty('index', index));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageRemoved&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.imageRemoved(index: $index)';
}


}

/// @nodoc
abstract mixin class _$ImageRemovedCopyWith<$Res> implements $VariantsEventCopyWith<$Res> {
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

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_ImageRemoved(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddVaraints with DiagnosticableTreeMixin implements VariantsEvent {
  const _AddVaraints(final  List<Variantsmodel> varaints): _varaints = varaints;
  

 final  List<Variantsmodel> _varaints;
 List<Variantsmodel> get varaints {
  if (_varaints is EqualUnmodifiableListView) return _varaints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_varaints);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddVaraints&&const DeepCollectionEquality().equals(other._varaints, _varaints));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_varaints));

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
 List<Variantsmodel> varaints
});




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
null == varaints ? _self._varaints : varaints // ignore: cast_nullable_to_non_nullable
as List<Variantsmodel>,
  ));
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


class _RemoveVariants with DiagnosticableTreeMixin implements VariantsEvent {
  const _RemoveVariants(this.variants);
  

 final  Variantsmodel variants;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveVariantsCopyWith<_RemoveVariants> get copyWith => __$RemoveVariantsCopyWithImpl<_RemoveVariants>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.removeVariants'))
    ..add(DiagnosticsProperty('variants', variants));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveVariants&&(identical(other.variants, variants) || other.variants == variants));
}


@override
int get hashCode => Object.hash(runtimeType,variants);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.removeVariants(variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$RemoveVariantsCopyWith<$Res> implements $VariantsEventCopyWith<$Res> {
  factory _$RemoveVariantsCopyWith(_RemoveVariants value, $Res Function(_RemoveVariants) _then) = __$RemoveVariantsCopyWithImpl;
@useResult
$Res call({
 Variantsmodel variants
});


$VariantsmodelCopyWith<$Res> get variants;

}
/// @nodoc
class __$RemoveVariantsCopyWithImpl<$Res>
    implements _$RemoveVariantsCopyWith<$Res> {
  __$RemoveVariantsCopyWithImpl(this._self, this._then);

  final _RemoveVariants _self;
  final $Res Function(_RemoveVariants) _then;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? variants = null,}) {
  return _then(_RemoveVariants(
null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as Variantsmodel,
  ));
}

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VariantsmodelCopyWith<$Res> get variants {
  
  return $VariantsmodelCopyWith<$Res>(_self.variants, (value) {
    return _then(_self.copyWith(variants: value));
  });
}
}

/// @nodoc


class _UpdateVariants with DiagnosticableTreeMixin implements VariantsEvent {
  const _UpdateVariants(this.variants);
  

 final  Variantsmodel variants;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateVariantsCopyWith<_UpdateVariants> get copyWith => __$UpdateVariantsCopyWithImpl<_UpdateVariants>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.updateVariants'))
    ..add(DiagnosticsProperty('variants', variants));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateVariants&&(identical(other.variants, variants) || other.variants == variants));
}


@override
int get hashCode => Object.hash(runtimeType,variants);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.updateVariants(variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$UpdateVariantsCopyWith<$Res> implements $VariantsEventCopyWith<$Res> {
  factory _$UpdateVariantsCopyWith(_UpdateVariants value, $Res Function(_UpdateVariants) _then) = __$UpdateVariantsCopyWithImpl;
@useResult
$Res call({
 Variantsmodel variants
});


$VariantsmodelCopyWith<$Res> get variants;

}
/// @nodoc
class __$UpdateVariantsCopyWithImpl<$Res>
    implements _$UpdateVariantsCopyWith<$Res> {
  __$UpdateVariantsCopyWithImpl(this._self, this._then);

  final _UpdateVariants _self;
  final $Res Function(_UpdateVariants) _then;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? variants = null,}) {
  return _then(_UpdateVariants(
null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as Variantsmodel,
  ));
}

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VariantsmodelCopyWith<$Res> get variants {
  
  return $VariantsmodelCopyWith<$Res>(_self.variants, (value) {
    return _then(_self.copyWith(variants: value));
  });
}
}

/// @nodoc


class _SearchVariants with DiagnosticableTreeMixin implements VariantsEvent {
  const _SearchVariants(this.query);
  

 final  String query;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchVariantsCopyWith<_SearchVariants> get copyWith => __$SearchVariantsCopyWithImpl<_SearchVariants>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.searchVariants'))
    ..add(DiagnosticsProperty('query', query));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchVariants&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.searchVariants(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchVariantsCopyWith<$Res> implements $VariantsEventCopyWith<$Res> {
  factory _$SearchVariantsCopyWith(_SearchVariants value, $Res Function(_SearchVariants) _then) = __$SearchVariantsCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchVariantsCopyWithImpl<$Res>
    implements _$SearchVariantsCopyWith<$Res> {
  __$SearchVariantsCopyWithImpl(this._self, this._then);

  final _SearchVariants _self;
  final $Res Function(_SearchVariants) _then;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_SearchVariants(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteVariants with DiagnosticableTreeMixin implements VariantsEvent {
  const _DeleteVariants(this.id);
  

 final  String id;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteVariantsCopyWith<_DeleteVariants> get copyWith => __$DeleteVariantsCopyWithImpl<_DeleteVariants>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.deleteVariants'))
    ..add(DiagnosticsProperty('id', id));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteVariants&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.deleteVariants(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteVariantsCopyWith<$Res> implements $VariantsEventCopyWith<$Res> {
  factory _$DeleteVariantsCopyWith(_DeleteVariants value, $Res Function(_DeleteVariants) _then) = __$DeleteVariantsCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteVariantsCopyWithImpl<$Res>
    implements _$DeleteVariantsCopyWith<$Res> {
  __$DeleteVariantsCopyWithImpl(this._self, this._then);

  final _DeleteVariants _self;
  final $Res Function(_DeleteVariants) _then;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteVariants(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ShowFields with DiagnosticableTreeMixin implements VariantsEvent {
  const _ShowFields();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.showFields'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowFields);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.showFields()';
}


}




/// @nodoc


class _HideFields with DiagnosticableTreeMixin implements VariantsEvent {
  const _HideFields();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.hideFields'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HideFields);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.hideFields()';
}


}




/// @nodoc


class _ToggleFields with DiagnosticableTreeMixin implements VariantsEvent {
  const _ToggleFields();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.toggleFields'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleFields);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.toggleFields()';
}


}




/// @nodoc


class _AddSizeStock with DiagnosticableTreeMixin implements VariantsEvent {
  const _AddSizeStock(this.sizeStock);
  

 final  SizeStockModel sizeStock;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddSizeStockCopyWith<_AddSizeStock> get copyWith => __$AddSizeStockCopyWithImpl<_AddSizeStock>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.addSizeStock'))
    ..add(DiagnosticsProperty('sizeStock', sizeStock));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddSizeStock&&(identical(other.sizeStock, sizeStock) || other.sizeStock == sizeStock));
}


@override
int get hashCode => Object.hash(runtimeType,sizeStock);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.addSizeStock(sizeStock: $sizeStock)';
}


}

/// @nodoc
abstract mixin class _$AddSizeStockCopyWith<$Res> implements $VariantsEventCopyWith<$Res> {
  factory _$AddSizeStockCopyWith(_AddSizeStock value, $Res Function(_AddSizeStock) _then) = __$AddSizeStockCopyWithImpl;
@useResult
$Res call({
 SizeStockModel sizeStock
});


$SizeStockModelCopyWith<$Res> get sizeStock;

}
/// @nodoc
class __$AddSizeStockCopyWithImpl<$Res>
    implements _$AddSizeStockCopyWith<$Res> {
  __$AddSizeStockCopyWithImpl(this._self, this._then);

  final _AddSizeStock _self;
  final $Res Function(_AddSizeStock) _then;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sizeStock = null,}) {
  return _then(_AddSizeStock(
null == sizeStock ? _self.sizeStock : sizeStock // ignore: cast_nullable_to_non_nullable
as SizeStockModel,
  ));
}

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SizeStockModelCopyWith<$Res> get sizeStock {
  
  return $SizeStockModelCopyWith<$Res>(_self.sizeStock, (value) {
    return _then(_self.copyWith(sizeStock: value));
  });
}
}

/// @nodoc


class _RemoveSizeStock with DiagnosticableTreeMixin implements VariantsEvent {
  const _RemoveSizeStock(this.index);
  

 final  int index;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveSizeStockCopyWith<_RemoveSizeStock> get copyWith => __$RemoveSizeStockCopyWithImpl<_RemoveSizeStock>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.removeSizeStock'))
    ..add(DiagnosticsProperty('index', index));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveSizeStock&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.removeSizeStock(index: $index)';
}


}

/// @nodoc
abstract mixin class _$RemoveSizeStockCopyWith<$Res> implements $VariantsEventCopyWith<$Res> {
  factory _$RemoveSizeStockCopyWith(_RemoveSizeStock value, $Res Function(_RemoveSizeStock) _then) = __$RemoveSizeStockCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$RemoveSizeStockCopyWithImpl<$Res>
    implements _$RemoveSizeStockCopyWith<$Res> {
  __$RemoveSizeStockCopyWithImpl(this._self, this._then);

  final _RemoveSizeStock _self;
  final $Res Function(_RemoveSizeStock) _then;

/// Create a copy of VariantsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_RemoveSizeStock(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ClearVariants with DiagnosticableTreeMixin implements VariantsEvent {
  const _ClearVariants();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsEvent.clearVariants'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearVariants);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsEvent.clearVariants()';
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initail value)?  inintial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _ImageAddedState value)?  imageAddedState,TResult Function( _Failure value)?  failure,TResult Function( _ImageRemovedState value)?  imageRemovedState,TResult Function( _VariantsLoaded value)?  variantsLoaded,TResult Function( _VariantAdded value)?  variantAdded,TResult Function( _VariantRemoved value)?  variantRemoved,TResult Function( _VariantUpdated value)?  variantUpdated,TResult Function( _VariantSearched value)?  variantSearched,TResult Function( _ShowFieldsState value)?  showFieldsState,TResult Function( _HideFieldsState value)?  hideFieldsState,TResult Function( _AddedSizeStockState value)?  addedSizeStockState,TResult Function( _RemovedSizeStockState value)?  removedSizeStockState,TResult Function( _Data value)?  data,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that);case _Failure() when failure != null:
return failure(_that);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that);case _VariantsLoaded() when variantsLoaded != null:
return variantsLoaded(_that);case _VariantAdded() when variantAdded != null:
return variantAdded(_that);case _VariantRemoved() when variantRemoved != null:
return variantRemoved(_that);case _VariantUpdated() when variantUpdated != null:
return variantUpdated(_that);case _VariantSearched() when variantSearched != null:
return variantSearched(_that);case _ShowFieldsState() when showFieldsState != null:
return showFieldsState(_that);case _HideFieldsState() when hideFieldsState != null:
return hideFieldsState(_that);case _AddedSizeStockState() when addedSizeStockState != null:
return addedSizeStockState(_that);case _RemovedSizeStockState() when removedSizeStockState != null:
return removedSizeStockState(_that);case _Data() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initail value)  inintial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _ImageAddedState value)  imageAddedState,required TResult Function( _Failure value)  failure,required TResult Function( _ImageRemovedState value)  imageRemovedState,required TResult Function( _VariantsLoaded value)  variantsLoaded,required TResult Function( _VariantAdded value)  variantAdded,required TResult Function( _VariantRemoved value)  variantRemoved,required TResult Function( _VariantUpdated value)  variantUpdated,required TResult Function( _VariantSearched value)  variantSearched,required TResult Function( _ShowFieldsState value)  showFieldsState,required TResult Function( _HideFieldsState value)  hideFieldsState,required TResult Function( _AddedSizeStockState value)  addedSizeStockState,required TResult Function( _RemovedSizeStockState value)  removedSizeStockState,required TResult Function( _Data value)  data,}){
final _that = this;
switch (_that) {
case _Initail():
return inintial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _ImageAddedState():
return imageAddedState(_that);case _Failure():
return failure(_that);case _ImageRemovedState():
return imageRemovedState(_that);case _VariantsLoaded():
return variantsLoaded(_that);case _VariantAdded():
return variantAdded(_that);case _VariantRemoved():
return variantRemoved(_that);case _VariantUpdated():
return variantUpdated(_that);case _VariantSearched():
return variantSearched(_that);case _ShowFieldsState():
return showFieldsState(_that);case _HideFieldsState():
return hideFieldsState(_that);case _AddedSizeStockState():
return addedSizeStockState(_that);case _RemovedSizeStockState():
return removedSizeStockState(_that);case _Data():
return data(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initail value)?  inintial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _ImageAddedState value)?  imageAddedState,TResult? Function( _Failure value)?  failure,TResult? Function( _ImageRemovedState value)?  imageRemovedState,TResult? Function( _VariantsLoaded value)?  variantsLoaded,TResult? Function( _VariantAdded value)?  variantAdded,TResult? Function( _VariantRemoved value)?  variantRemoved,TResult? Function( _VariantUpdated value)?  variantUpdated,TResult? Function( _VariantSearched value)?  variantSearched,TResult? Function( _ShowFieldsState value)?  showFieldsState,TResult? Function( _HideFieldsState value)?  hideFieldsState,TResult? Function( _AddedSizeStockState value)?  addedSizeStockState,TResult? Function( _RemovedSizeStockState value)?  removedSizeStockState,TResult? Function( _Data value)?  data,}){
final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that);case _Failure() when failure != null:
return failure(_that);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that);case _VariantsLoaded() when variantsLoaded != null:
return variantsLoaded(_that);case _VariantAdded() when variantAdded != null:
return variantAdded(_that);case _VariantRemoved() when variantRemoved != null:
return variantRemoved(_that);case _VariantUpdated() when variantUpdated != null:
return variantUpdated(_that);case _VariantSearched() when variantSearched != null:
return variantSearched(_that);case _ShowFieldsState() when showFieldsState != null:
return showFieldsState(_that);case _HideFieldsState() when hideFieldsState != null:
return hideFieldsState(_that);case _AddedSizeStockState() when addedSizeStockState != null:
return addedSizeStockState(_that);case _RemovedSizeStockState() when removedSizeStockState != null:
return removedSizeStockState(_that);case _Data() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  inintial,TResult Function()?  loading,TResult Function()?  success,TResult Function( List<Uint8List> images)?  imageAddedState,TResult Function( String error)?  failure,TResult Function( List<Uint8List> image)?  imageRemovedState,TResult Function( List<Variantsmodel> variants)?  variantsLoaded,TResult Function()?  variantAdded,TResult Function()?  variantRemoved,TResult Function()?  variantUpdated,TResult Function( List<Variantsmodel> variants)?  variantSearched,TResult Function()?  showFieldsState,TResult Function()?  hideFieldsState,TResult Function( List<SizeStockModel> sizeStock)?  addedSizeStockState,TResult Function( List<SizeStockModel> sizeStock)?  removedSizeStockState,TResult Function( List<Uint8List> images,  List<SizeStockModel> sizeStock,  List<Variantsmodel> variants,  bool showFields)?  data,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that.images);case _Failure() when failure != null:
return failure(_that.error);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that.image);case _VariantsLoaded() when variantsLoaded != null:
return variantsLoaded(_that.variants);case _VariantAdded() when variantAdded != null:
return variantAdded();case _VariantRemoved() when variantRemoved != null:
return variantRemoved();case _VariantUpdated() when variantUpdated != null:
return variantUpdated();case _VariantSearched() when variantSearched != null:
return variantSearched(_that.variants);case _ShowFieldsState() when showFieldsState != null:
return showFieldsState();case _HideFieldsState() when hideFieldsState != null:
return hideFieldsState();case _AddedSizeStockState() when addedSizeStockState != null:
return addedSizeStockState(_that.sizeStock);case _RemovedSizeStockState() when removedSizeStockState != null:
return removedSizeStockState(_that.sizeStock);case _Data() when data != null:
return data(_that.images,_that.sizeStock,_that.variants,_that.showFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  inintial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( List<Uint8List> images)  imageAddedState,required TResult Function( String error)  failure,required TResult Function( List<Uint8List> image)  imageRemovedState,required TResult Function( List<Variantsmodel> variants)  variantsLoaded,required TResult Function()  variantAdded,required TResult Function()  variantRemoved,required TResult Function()  variantUpdated,required TResult Function( List<Variantsmodel> variants)  variantSearched,required TResult Function()  showFieldsState,required TResult Function()  hideFieldsState,required TResult Function( List<SizeStockModel> sizeStock)  addedSizeStockState,required TResult Function( List<SizeStockModel> sizeStock)  removedSizeStockState,required TResult Function( List<Uint8List> images,  List<SizeStockModel> sizeStock,  List<Variantsmodel> variants,  bool showFields)  data,}) {final _that = this;
switch (_that) {
case _Initail():
return inintial();case _Loading():
return loading();case _Success():
return success();case _ImageAddedState():
return imageAddedState(_that.images);case _Failure():
return failure(_that.error);case _ImageRemovedState():
return imageRemovedState(_that.image);case _VariantsLoaded():
return variantsLoaded(_that.variants);case _VariantAdded():
return variantAdded();case _VariantRemoved():
return variantRemoved();case _VariantUpdated():
return variantUpdated();case _VariantSearched():
return variantSearched(_that.variants);case _ShowFieldsState():
return showFieldsState();case _HideFieldsState():
return hideFieldsState();case _AddedSizeStockState():
return addedSizeStockState(_that.sizeStock);case _RemovedSizeStockState():
return removedSizeStockState(_that.sizeStock);case _Data():
return data(_that.images,_that.sizeStock,_that.variants,_that.showFields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  inintial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( List<Uint8List> images)?  imageAddedState,TResult? Function( String error)?  failure,TResult? Function( List<Uint8List> image)?  imageRemovedState,TResult? Function( List<Variantsmodel> variants)?  variantsLoaded,TResult? Function()?  variantAdded,TResult? Function()?  variantRemoved,TResult? Function()?  variantUpdated,TResult? Function( List<Variantsmodel> variants)?  variantSearched,TResult? Function()?  showFieldsState,TResult? Function()?  hideFieldsState,TResult? Function( List<SizeStockModel> sizeStock)?  addedSizeStockState,TResult? Function( List<SizeStockModel> sizeStock)?  removedSizeStockState,TResult? Function( List<Uint8List> images,  List<SizeStockModel> sizeStock,  List<Variantsmodel> variants,  bool showFields)?  data,}) {final _that = this;
switch (_that) {
case _Initail() when inintial != null:
return inintial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _ImageAddedState() when imageAddedState != null:
return imageAddedState(_that.images);case _Failure() when failure != null:
return failure(_that.error);case _ImageRemovedState() when imageRemovedState != null:
return imageRemovedState(_that.image);case _VariantsLoaded() when variantsLoaded != null:
return variantsLoaded(_that.variants);case _VariantAdded() when variantAdded != null:
return variantAdded();case _VariantRemoved() when variantRemoved != null:
return variantRemoved();case _VariantUpdated() when variantUpdated != null:
return variantUpdated();case _VariantSearched() when variantSearched != null:
return variantSearched(_that.variants);case _ShowFieldsState() when showFieldsState != null:
return showFieldsState();case _HideFieldsState() when hideFieldsState != null:
return hideFieldsState();case _AddedSizeStockState() when addedSizeStockState != null:
return addedSizeStockState(_that.sizeStock);case _RemovedSizeStockState() when removedSizeStockState != null:
return removedSizeStockState(_that.sizeStock);case _Data() when data != null:
return data(_that.images,_that.sizeStock,_that.variants,_that.showFields);case _:
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

/// @nodoc


class _VariantAdded with DiagnosticableTreeMixin implements VariantsState {
  const _VariantAdded();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.variantAdded'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantAdded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.variantAdded()';
}


}




/// @nodoc


class _VariantRemoved with DiagnosticableTreeMixin implements VariantsState {
  const _VariantRemoved();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.variantRemoved'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantRemoved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.variantRemoved()';
}


}




/// @nodoc


class _VariantUpdated with DiagnosticableTreeMixin implements VariantsState {
  const _VariantUpdated();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.variantUpdated'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantUpdated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.variantUpdated()';
}


}




/// @nodoc


class _VariantSearched with DiagnosticableTreeMixin implements VariantsState {
  const _VariantSearched(final  List<Variantsmodel> variants): _variants = variants;
  

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
_$VariantSearchedCopyWith<_VariantSearched> get copyWith => __$VariantSearchedCopyWithImpl<_VariantSearched>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.variantSearched'))
    ..add(DiagnosticsProperty('variants', variants));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantSearched&&const DeepCollectionEquality().equals(other._variants, _variants));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_variants));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.variantSearched(variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$VariantSearchedCopyWith<$Res> implements $VariantsStateCopyWith<$Res> {
  factory _$VariantSearchedCopyWith(_VariantSearched value, $Res Function(_VariantSearched) _then) = __$VariantSearchedCopyWithImpl;
@useResult
$Res call({
 List<Variantsmodel> variants
});




}
/// @nodoc
class __$VariantSearchedCopyWithImpl<$Res>
    implements _$VariantSearchedCopyWith<$Res> {
  __$VariantSearchedCopyWithImpl(this._self, this._then);

  final _VariantSearched _self;
  final $Res Function(_VariantSearched) _then;

/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? variants = null,}) {
  return _then(_VariantSearched(
null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variantsmodel>,
  ));
}


}

/// @nodoc


class _ShowFieldsState with DiagnosticableTreeMixin implements VariantsState {
  const _ShowFieldsState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.showFieldsState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowFieldsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.showFieldsState()';
}


}




/// @nodoc


class _HideFieldsState with DiagnosticableTreeMixin implements VariantsState {
  const _HideFieldsState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.hideFieldsState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HideFieldsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.hideFieldsState()';
}


}




/// @nodoc


class _AddedSizeStockState with DiagnosticableTreeMixin implements VariantsState {
  const _AddedSizeStockState(final  List<SizeStockModel> sizeStock): _sizeStock = sizeStock;
  

 final  List<SizeStockModel> _sizeStock;
 List<SizeStockModel> get sizeStock {
  if (_sizeStock is EqualUnmodifiableListView) return _sizeStock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizeStock);
}


/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddedSizeStockStateCopyWith<_AddedSizeStockState> get copyWith => __$AddedSizeStockStateCopyWithImpl<_AddedSizeStockState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.addedSizeStockState'))
    ..add(DiagnosticsProperty('sizeStock', sizeStock));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddedSizeStockState&&const DeepCollectionEquality().equals(other._sizeStock, _sizeStock));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sizeStock));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.addedSizeStockState(sizeStock: $sizeStock)';
}


}

/// @nodoc
abstract mixin class _$AddedSizeStockStateCopyWith<$Res> implements $VariantsStateCopyWith<$Res> {
  factory _$AddedSizeStockStateCopyWith(_AddedSizeStockState value, $Res Function(_AddedSizeStockState) _then) = __$AddedSizeStockStateCopyWithImpl;
@useResult
$Res call({
 List<SizeStockModel> sizeStock
});




}
/// @nodoc
class __$AddedSizeStockStateCopyWithImpl<$Res>
    implements _$AddedSizeStockStateCopyWith<$Res> {
  __$AddedSizeStockStateCopyWithImpl(this._self, this._then);

  final _AddedSizeStockState _self;
  final $Res Function(_AddedSizeStockState) _then;

/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sizeStock = null,}) {
  return _then(_AddedSizeStockState(
null == sizeStock ? _self._sizeStock : sizeStock // ignore: cast_nullable_to_non_nullable
as List<SizeStockModel>,
  ));
}


}

/// @nodoc


class _RemovedSizeStockState with DiagnosticableTreeMixin implements VariantsState {
  const _RemovedSizeStockState(final  List<SizeStockModel> sizeStock): _sizeStock = sizeStock;
  

 final  List<SizeStockModel> _sizeStock;
 List<SizeStockModel> get sizeStock {
  if (_sizeStock is EqualUnmodifiableListView) return _sizeStock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizeStock);
}


/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemovedSizeStockStateCopyWith<_RemovedSizeStockState> get copyWith => __$RemovedSizeStockStateCopyWithImpl<_RemovedSizeStockState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.removedSizeStockState'))
    ..add(DiagnosticsProperty('sizeStock', sizeStock));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemovedSizeStockState&&const DeepCollectionEquality().equals(other._sizeStock, _sizeStock));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sizeStock));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.removedSizeStockState(sizeStock: $sizeStock)';
}


}

/// @nodoc
abstract mixin class _$RemovedSizeStockStateCopyWith<$Res> implements $VariantsStateCopyWith<$Res> {
  factory _$RemovedSizeStockStateCopyWith(_RemovedSizeStockState value, $Res Function(_RemovedSizeStockState) _then) = __$RemovedSizeStockStateCopyWithImpl;
@useResult
$Res call({
 List<SizeStockModel> sizeStock
});




}
/// @nodoc
class __$RemovedSizeStockStateCopyWithImpl<$Res>
    implements _$RemovedSizeStockStateCopyWith<$Res> {
  __$RemovedSizeStockStateCopyWithImpl(this._self, this._then);

  final _RemovedSizeStockState _self;
  final $Res Function(_RemovedSizeStockState) _then;

/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sizeStock = null,}) {
  return _then(_RemovedSizeStockState(
null == sizeStock ? _self._sizeStock : sizeStock // ignore: cast_nullable_to_non_nullable
as List<SizeStockModel>,
  ));
}


}

/// @nodoc


class _Data with DiagnosticableTreeMixin implements VariantsState {
  const _Data({required final  List<Uint8List> images, required final  List<SizeStockModel> sizeStock, required final  List<Variantsmodel> variants, this.showFields = false}): _images = images,_sizeStock = sizeStock,_variants = variants;
  

 final  List<Uint8List> _images;
 List<Uint8List> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<SizeStockModel> _sizeStock;
 List<SizeStockModel> get sizeStock {
  if (_sizeStock is EqualUnmodifiableListView) return _sizeStock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizeStock);
}

 final  List<Variantsmodel> _variants;
 List<Variantsmodel> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

@JsonKey() final  bool showFields;

/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VariantsState.data'))
    ..add(DiagnosticsProperty('images', images))..add(DiagnosticsProperty('sizeStock', sizeStock))..add(DiagnosticsProperty('variants', variants))..add(DiagnosticsProperty('showFields', showFields));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._sizeStock, _sizeStock)&&const DeepCollectionEquality().equals(other._variants, _variants)&&(identical(other.showFields, showFields) || other.showFields == showFields));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_sizeStock),const DeepCollectionEquality().hash(_variants),showFields);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VariantsState.data(images: $images, sizeStock: $sizeStock, variants: $variants, showFields: $showFields)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $VariantsStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@useResult
$Res call({
 List<Uint8List> images, List<SizeStockModel> sizeStock, List<Variantsmodel> variants, bool showFields
});




}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of VariantsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,Object? sizeStock = null,Object? variants = null,Object? showFields = null,}) {
  return _then(_Data(
images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,sizeStock: null == sizeStock ? _self._sizeStock : sizeStock // ignore: cast_nullable_to_non_nullable
as List<SizeStockModel>,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variantsmodel>,showFields: null == showFields ? _self.showFields : showFields // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
