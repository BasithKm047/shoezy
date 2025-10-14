// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TagEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagEvent()';
}


}

/// @nodoc
class $TagEventCopyWith<$Res>  {
$TagEventCopyWith(TagEvent _, $Res Function(TagEvent) __);
}


/// Adds pattern-matching-related methods to [TagEvent].
extension TagEventPatterns on TagEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddTag value)?  addTag,TResult Function( _FetchTags value)?  fetchTags,TResult Function( _UpdateTag value)?  updateTag,TResult Function( _DeleteTag value)?  deleteTag,TResult Function( _SearchTag value)?  searchTag,TResult Function( _ClearSelection value)?  clearSelection,TResult Function( _ClearTags value)?  clearTags,TResult Function( _SelectedTag value)?  selectedTag,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddTag() when addTag != null:
return addTag(_that);case _FetchTags() when fetchTags != null:
return fetchTags(_that);case _UpdateTag() when updateTag != null:
return updateTag(_that);case _DeleteTag() when deleteTag != null:
return deleteTag(_that);case _SearchTag() when searchTag != null:
return searchTag(_that);case _ClearSelection() when clearSelection != null:
return clearSelection(_that);case _ClearTags() when clearTags != null:
return clearTags(_that);case _SelectedTag() when selectedTag != null:
return selectedTag(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddTag value)  addTag,required TResult Function( _FetchTags value)  fetchTags,required TResult Function( _UpdateTag value)  updateTag,required TResult Function( _DeleteTag value)  deleteTag,required TResult Function( _SearchTag value)  searchTag,required TResult Function( _ClearSelection value)  clearSelection,required TResult Function( _ClearTags value)  clearTags,required TResult Function( _SelectedTag value)  selectedTag,}){
final _that = this;
switch (_that) {
case _AddTag():
return addTag(_that);case _FetchTags():
return fetchTags(_that);case _UpdateTag():
return updateTag(_that);case _DeleteTag():
return deleteTag(_that);case _SearchTag():
return searchTag(_that);case _ClearSelection():
return clearSelection(_that);case _ClearTags():
return clearTags(_that);case _SelectedTag():
return selectedTag(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddTag value)?  addTag,TResult? Function( _FetchTags value)?  fetchTags,TResult? Function( _UpdateTag value)?  updateTag,TResult? Function( _DeleteTag value)?  deleteTag,TResult? Function( _SearchTag value)?  searchTag,TResult? Function( _ClearSelection value)?  clearSelection,TResult? Function( _ClearTags value)?  clearTags,TResult? Function( _SelectedTag value)?  selectedTag,}){
final _that = this;
switch (_that) {
case _AddTag() when addTag != null:
return addTag(_that);case _FetchTags() when fetchTags != null:
return fetchTags(_that);case _UpdateTag() when updateTag != null:
return updateTag(_that);case _DeleteTag() when deleteTag != null:
return deleteTag(_that);case _SearchTag() when searchTag != null:
return searchTag(_that);case _ClearSelection() when clearSelection != null:
return clearSelection(_that);case _ClearTags() when clearTags != null:
return clearTags(_that);case _SelectedTag() when selectedTag != null:
return selectedTag(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TagModel tag)?  addTag,TResult Function()?  fetchTags,TResult Function( TagModel tag)?  updateTag,TResult Function( String id)?  deleteTag,TResult Function( String query)?  searchTag,TResult Function()?  clearSelection,TResult Function()?  clearTags,TResult Function( TagModel tag)?  selectedTag,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddTag() when addTag != null:
return addTag(_that.tag);case _FetchTags() when fetchTags != null:
return fetchTags();case _UpdateTag() when updateTag != null:
return updateTag(_that.tag);case _DeleteTag() when deleteTag != null:
return deleteTag(_that.id);case _SearchTag() when searchTag != null:
return searchTag(_that.query);case _ClearSelection() when clearSelection != null:
return clearSelection();case _ClearTags() when clearTags != null:
return clearTags();case _SelectedTag() when selectedTag != null:
return selectedTag(_that.tag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TagModel tag)  addTag,required TResult Function()  fetchTags,required TResult Function( TagModel tag)  updateTag,required TResult Function( String id)  deleteTag,required TResult Function( String query)  searchTag,required TResult Function()  clearSelection,required TResult Function()  clearTags,required TResult Function( TagModel tag)  selectedTag,}) {final _that = this;
switch (_that) {
case _AddTag():
return addTag(_that.tag);case _FetchTags():
return fetchTags();case _UpdateTag():
return updateTag(_that.tag);case _DeleteTag():
return deleteTag(_that.id);case _SearchTag():
return searchTag(_that.query);case _ClearSelection():
return clearSelection();case _ClearTags():
return clearTags();case _SelectedTag():
return selectedTag(_that.tag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TagModel tag)?  addTag,TResult? Function()?  fetchTags,TResult? Function( TagModel tag)?  updateTag,TResult? Function( String id)?  deleteTag,TResult? Function( String query)?  searchTag,TResult? Function()?  clearSelection,TResult? Function()?  clearTags,TResult? Function( TagModel tag)?  selectedTag,}) {final _that = this;
switch (_that) {
case _AddTag() when addTag != null:
return addTag(_that.tag);case _FetchTags() when fetchTags != null:
return fetchTags();case _UpdateTag() when updateTag != null:
return updateTag(_that.tag);case _DeleteTag() when deleteTag != null:
return deleteTag(_that.id);case _SearchTag() when searchTag != null:
return searchTag(_that.query);case _ClearSelection() when clearSelection != null:
return clearSelection();case _ClearTags() when clearTags != null:
return clearTags();case _SelectedTag() when selectedTag != null:
return selectedTag(_that.tag);case _:
  return null;

}
}

}

/// @nodoc


class _AddTag with DiagnosticableTreeMixin implements TagEvent {
  const _AddTag(this.tag);
  

 final  TagModel tag;

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTagCopyWith<_AddTag> get copyWith => __$AddTagCopyWithImpl<_AddTag>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagEvent.addTag'))
    ..add(DiagnosticsProperty('tag', tag));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTag&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,tag);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagEvent.addTag(tag: $tag)';
}


}

/// @nodoc
abstract mixin class _$AddTagCopyWith<$Res> implements $TagEventCopyWith<$Res> {
  factory _$AddTagCopyWith(_AddTag value, $Res Function(_AddTag) _then) = __$AddTagCopyWithImpl;
@useResult
$Res call({
 TagModel tag
});


$TagModelCopyWith<$Res> get tag;

}
/// @nodoc
class __$AddTagCopyWithImpl<$Res>
    implements _$AddTagCopyWith<$Res> {
  __$AddTagCopyWithImpl(this._self, this._then);

  final _AddTag _self;
  final $Res Function(_AddTag) _then;

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tag = null,}) {
  return _then(_AddTag(
null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as TagModel,
  ));
}

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagModelCopyWith<$Res> get tag {
  
  return $TagModelCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}

/// @nodoc


class _FetchTags with DiagnosticableTreeMixin implements TagEvent {
  const _FetchTags();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagEvent.fetchTags'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTags);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagEvent.fetchTags()';
}


}




/// @nodoc


class _UpdateTag with DiagnosticableTreeMixin implements TagEvent {
  const _UpdateTag(this.tag);
  

 final  TagModel tag;

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTagCopyWith<_UpdateTag> get copyWith => __$UpdateTagCopyWithImpl<_UpdateTag>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagEvent.updateTag'))
    ..add(DiagnosticsProperty('tag', tag));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTag&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,tag);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagEvent.updateTag(tag: $tag)';
}


}

/// @nodoc
abstract mixin class _$UpdateTagCopyWith<$Res> implements $TagEventCopyWith<$Res> {
  factory _$UpdateTagCopyWith(_UpdateTag value, $Res Function(_UpdateTag) _then) = __$UpdateTagCopyWithImpl;
@useResult
$Res call({
 TagModel tag
});


$TagModelCopyWith<$Res> get tag;

}
/// @nodoc
class __$UpdateTagCopyWithImpl<$Res>
    implements _$UpdateTagCopyWith<$Res> {
  __$UpdateTagCopyWithImpl(this._self, this._then);

  final _UpdateTag _self;
  final $Res Function(_UpdateTag) _then;

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tag = null,}) {
  return _then(_UpdateTag(
null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as TagModel,
  ));
}

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagModelCopyWith<$Res> get tag {
  
  return $TagModelCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}

/// @nodoc


class _DeleteTag with DiagnosticableTreeMixin implements TagEvent {
  const _DeleteTag(this.id);
  

 final  String id;

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTagCopyWith<_DeleteTag> get copyWith => __$DeleteTagCopyWithImpl<_DeleteTag>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagEvent.deleteTag'))
    ..add(DiagnosticsProperty('id', id));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTag&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagEvent.deleteTag(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteTagCopyWith<$Res> implements $TagEventCopyWith<$Res> {
  factory _$DeleteTagCopyWith(_DeleteTag value, $Res Function(_DeleteTag) _then) = __$DeleteTagCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteTagCopyWithImpl<$Res>
    implements _$DeleteTagCopyWith<$Res> {
  __$DeleteTagCopyWithImpl(this._self, this._then);

  final _DeleteTag _self;
  final $Res Function(_DeleteTag) _then;

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteTag(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SearchTag with DiagnosticableTreeMixin implements TagEvent {
  const _SearchTag(this.query);
  

 final  String query;

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchTagCopyWith<_SearchTag> get copyWith => __$SearchTagCopyWithImpl<_SearchTag>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagEvent.searchTag'))
    ..add(DiagnosticsProperty('query', query));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchTag&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagEvent.searchTag(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchTagCopyWith<$Res> implements $TagEventCopyWith<$Res> {
  factory _$SearchTagCopyWith(_SearchTag value, $Res Function(_SearchTag) _then) = __$SearchTagCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchTagCopyWithImpl<$Res>
    implements _$SearchTagCopyWith<$Res> {
  __$SearchTagCopyWithImpl(this._self, this._then);

  final _SearchTag _self;
  final $Res Function(_SearchTag) _then;

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_SearchTag(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ClearSelection with DiagnosticableTreeMixin implements TagEvent {
  const _ClearSelection();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagEvent.clearSelection'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagEvent.clearSelection()';
}


}




/// @nodoc


class _ClearTags with DiagnosticableTreeMixin implements TagEvent {
  const _ClearTags();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagEvent.clearTags'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearTags);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagEvent.clearTags()';
}


}




/// @nodoc


class _SelectedTag with DiagnosticableTreeMixin implements TagEvent {
  const _SelectedTag(this.tag);
  

 final  TagModel tag;

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedTagCopyWith<_SelectedTag> get copyWith => __$SelectedTagCopyWithImpl<_SelectedTag>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagEvent.selectedTag'))
    ..add(DiagnosticsProperty('tag', tag));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedTag&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,tag);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagEvent.selectedTag(tag: $tag)';
}


}

/// @nodoc
abstract mixin class _$SelectedTagCopyWith<$Res> implements $TagEventCopyWith<$Res> {
  factory _$SelectedTagCopyWith(_SelectedTag value, $Res Function(_SelectedTag) _then) = __$SelectedTagCopyWithImpl;
@useResult
$Res call({
 TagModel tag
});


$TagModelCopyWith<$Res> get tag;

}
/// @nodoc
class __$SelectedTagCopyWithImpl<$Res>
    implements _$SelectedTagCopyWith<$Res> {
  __$SelectedTagCopyWithImpl(this._self, this._then);

  final _SelectedTag _self;
  final $Res Function(_SelectedTag) _then;

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tag = null,}) {
  return _then(_SelectedTag(
null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as TagModel,
  ));
}

/// Create a copy of TagEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagModelCopyWith<$Res> get tag {
  
  return $TagModelCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}

/// @nodoc
mixin _$TagState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagState()';
}


}

/// @nodoc
class $TagStateCopyWith<$Res>  {
$TagStateCopyWith(TagState _, $Res Function(TagState) __);
}


/// Adds pattern-matching-related methods to [TagState].
extension TagStatePatterns on TagState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Success value)?  success,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Success() when success != null:
return success(_that);case _Loading() when loading != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Success value)  success,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Success():
return success(_that);case _Loading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Success value)?  success,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Success() when success != null:
return success(_that);case _Loading() when loading != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  success,TResult Function()?  loading,TResult Function( List<TagModel> tags,  String? selectedTags)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Success() when success != null:
return success();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.tags,_that.selectedTags);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  success,required TResult Function()  loading,required TResult Function( List<TagModel> tags,  String? selectedTags)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Success():
return success();case _Loading():
return loading();case _Loaded():
return loaded(_that.tags,_that.selectedTags);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  success,TResult? Function()?  loading,TResult? Function( List<TagModel> tags,  String? selectedTags)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Success() when success != null:
return success();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.tags,_that.selectedTags);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial with DiagnosticableTreeMixin implements TagState {
  const _Initial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagState.initial()';
}


}




/// @nodoc


class _Success with DiagnosticableTreeMixin implements TagState {
  const _Success();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagState.success'))
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
  return 'TagState.success()';
}


}




/// @nodoc


class _Loading with DiagnosticableTreeMixin implements TagState {
  const _Loading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagState.loading'))
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
  return 'TagState.loading()';
}


}




/// @nodoc


class _Loaded with DiagnosticableTreeMixin implements TagState {
  const _Loaded({required final  List<TagModel> tags, this.selectedTags}): _tags = tags;
  

 final  List<TagModel> _tags;
 List<TagModel> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  String? selectedTags;

/// Create a copy of TagState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagState.loaded'))
    ..add(DiagnosticsProperty('tags', tags))..add(DiagnosticsProperty('selectedTags', selectedTags));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.selectedTags, selectedTags) || other.selectedTags == selectedTags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tags),selectedTags);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagState.loaded(tags: $tags, selectedTags: $selectedTags)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $TagStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<TagModel> tags, String? selectedTags
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of TagState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tags = null,Object? selectedTags = freezed,}) {
  return _then(_Loaded(
tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagModel>,selectedTags: freezed == selectedTags ? _self.selectedTags : selectedTags // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Error with DiagnosticableTreeMixin implements TagState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of TagState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagState.error'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $TagStateCopyWith<$Res> {
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

/// Create a copy of TagState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
