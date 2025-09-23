// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'size_stock_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SizeStockEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizeStockEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SizeStockEvent()';
}


}

/// @nodoc
class $SizeStockEventCopyWith<$Res>  {
$SizeStockEventCopyWith(SizeStockEvent _, $Res Function(SizeStockEvent) __);
}


/// Adds pattern-matching-related methods to [SizeStockEvent].
extension SizeStockEventPatterns on SizeStockEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddedSizeStock value)?  addedSizeStock,TResult Function( _RemovedSizeStock value)?  removedSizeStock,TResult Function( _GetSizeStock value)?  getSizeStock,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddedSizeStock() when addedSizeStock != null:
return addedSizeStock(_that);case _RemovedSizeStock() when removedSizeStock != null:
return removedSizeStock(_that);case _GetSizeStock() when getSizeStock != null:
return getSizeStock(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddedSizeStock value)  addedSizeStock,required TResult Function( _RemovedSizeStock value)  removedSizeStock,required TResult Function( _GetSizeStock value)  getSizeStock,}){
final _that = this;
switch (_that) {
case _AddedSizeStock():
return addedSizeStock(_that);case _RemovedSizeStock():
return removedSizeStock(_that);case _GetSizeStock():
return getSizeStock(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddedSizeStock value)?  addedSizeStock,TResult? Function( _RemovedSizeStock value)?  removedSizeStock,TResult? Function( _GetSizeStock value)?  getSizeStock,}){
final _that = this;
switch (_that) {
case _AddedSizeStock() when addedSizeStock != null:
return addedSizeStock(_that);case _RemovedSizeStock() when removedSizeStock != null:
return removedSizeStock(_that);case _GetSizeStock() when getSizeStock != null:
return getSizeStock(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<SizeStockModel> sizeStock)?  addedSizeStock,TResult Function( SizeStockModel sizestock)?  removedSizeStock,TResult Function()?  getSizeStock,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddedSizeStock() when addedSizeStock != null:
return addedSizeStock(_that.sizeStock);case _RemovedSizeStock() when removedSizeStock != null:
return removedSizeStock(_that.sizestock);case _GetSizeStock() when getSizeStock != null:
return getSizeStock();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<SizeStockModel> sizeStock)  addedSizeStock,required TResult Function( SizeStockModel sizestock)  removedSizeStock,required TResult Function()  getSizeStock,}) {final _that = this;
switch (_that) {
case _AddedSizeStock():
return addedSizeStock(_that.sizeStock);case _RemovedSizeStock():
return removedSizeStock(_that.sizestock);case _GetSizeStock():
return getSizeStock();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<SizeStockModel> sizeStock)?  addedSizeStock,TResult? Function( SizeStockModel sizestock)?  removedSizeStock,TResult? Function()?  getSizeStock,}) {final _that = this;
switch (_that) {
case _AddedSizeStock() when addedSizeStock != null:
return addedSizeStock(_that.sizeStock);case _RemovedSizeStock() when removedSizeStock != null:
return removedSizeStock(_that.sizestock);case _GetSizeStock() when getSizeStock != null:
return getSizeStock();case _:
  return null;

}
}

}

/// @nodoc


class _AddedSizeStock implements SizeStockEvent {
  const _AddedSizeStock(final  List<SizeStockModel> sizeStock): _sizeStock = sizeStock;
  

 final  List<SizeStockModel> _sizeStock;
 List<SizeStockModel> get sizeStock {
  if (_sizeStock is EqualUnmodifiableListView) return _sizeStock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizeStock);
}


/// Create a copy of SizeStockEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddedSizeStockCopyWith<_AddedSizeStock> get copyWith => __$AddedSizeStockCopyWithImpl<_AddedSizeStock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddedSizeStock&&const DeepCollectionEquality().equals(other._sizeStock, _sizeStock));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sizeStock));

@override
String toString() {
  return 'SizeStockEvent.addedSizeStock(sizeStock: $sizeStock)';
}


}

/// @nodoc
abstract mixin class _$AddedSizeStockCopyWith<$Res> implements $SizeStockEventCopyWith<$Res> {
  factory _$AddedSizeStockCopyWith(_AddedSizeStock value, $Res Function(_AddedSizeStock) _then) = __$AddedSizeStockCopyWithImpl;
@useResult
$Res call({
 List<SizeStockModel> sizeStock
});




}
/// @nodoc
class __$AddedSizeStockCopyWithImpl<$Res>
    implements _$AddedSizeStockCopyWith<$Res> {
  __$AddedSizeStockCopyWithImpl(this._self, this._then);

  final _AddedSizeStock _self;
  final $Res Function(_AddedSizeStock) _then;

/// Create a copy of SizeStockEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sizeStock = null,}) {
  return _then(_AddedSizeStock(
null == sizeStock ? _self._sizeStock : sizeStock // ignore: cast_nullable_to_non_nullable
as List<SizeStockModel>,
  ));
}


}

/// @nodoc


class _RemovedSizeStock implements SizeStockEvent {
  const _RemovedSizeStock(this.sizestock);
  

 final  SizeStockModel sizestock;

/// Create a copy of SizeStockEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemovedSizeStockCopyWith<_RemovedSizeStock> get copyWith => __$RemovedSizeStockCopyWithImpl<_RemovedSizeStock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemovedSizeStock&&(identical(other.sizestock, sizestock) || other.sizestock == sizestock));
}


@override
int get hashCode => Object.hash(runtimeType,sizestock);

@override
String toString() {
  return 'SizeStockEvent.removedSizeStock(sizestock: $sizestock)';
}


}

/// @nodoc
abstract mixin class _$RemovedSizeStockCopyWith<$Res> implements $SizeStockEventCopyWith<$Res> {
  factory _$RemovedSizeStockCopyWith(_RemovedSizeStock value, $Res Function(_RemovedSizeStock) _then) = __$RemovedSizeStockCopyWithImpl;
@useResult
$Res call({
 SizeStockModel sizestock
});


$SizeStockModelCopyWith<$Res> get sizestock;

}
/// @nodoc
class __$RemovedSizeStockCopyWithImpl<$Res>
    implements _$RemovedSizeStockCopyWith<$Res> {
  __$RemovedSizeStockCopyWithImpl(this._self, this._then);

  final _RemovedSizeStock _self;
  final $Res Function(_RemovedSizeStock) _then;

/// Create a copy of SizeStockEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sizestock = null,}) {
  return _then(_RemovedSizeStock(
null == sizestock ? _self.sizestock : sizestock // ignore: cast_nullable_to_non_nullable
as SizeStockModel,
  ));
}

/// Create a copy of SizeStockEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SizeStockModelCopyWith<$Res> get sizestock {
  
  return $SizeStockModelCopyWith<$Res>(_self.sizestock, (value) {
    return _then(_self.copyWith(sizestock: value));
  });
}
}

/// @nodoc


class _GetSizeStock implements SizeStockEvent {
  const _GetSizeStock();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSizeStock);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SizeStockEvent.getSizeStock()';
}


}




/// @nodoc
mixin _$SizeStockState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizeStockState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SizeStockState()';
}


}

/// @nodoc
class $SizeStockStateCopyWith<$Res>  {
$SizeStockStateCopyWith(SizeStockState _, $Res Function(SizeStockState) __);
}


/// Adds pattern-matching-related methods to [SizeStockState].
extension SizeStockStatePatterns on SizeStockState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _$Initail value)?  initial,TResult Function( _Success value)?  success,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$Initail() when initial != null:
return initial(_that);case _Success() when success != null:
return success(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _$Initail value)  initial,required TResult Function( _Success value)  success,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _$Initail():
return initial(_that);case _Success():
return success(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _$Initail value)?  initial,TResult? Function( _Success value)?  success,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _$Initail() when initial != null:
return initial(_that);case _Success() when success != null:
return success(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  success,TResult Function()?  loading,TResult Function( List<SizeStockModel> sizeStock)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$Initail() when initial != null:
return initial();case _Success() when success != null:
return success();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.sizeStock);case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  success,required TResult Function()  loading,required TResult Function( List<SizeStockModel> sizeStock)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _$Initail():
return initial();case _Success():
return success();case _Loading():
return loading();case _Loaded():
return loaded(_that.sizeStock);case _Failure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  success,TResult? Function()?  loading,TResult? Function( List<SizeStockModel> sizeStock)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _$Initail() when initial != null:
return initial();case _Success() when success != null:
return success();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.sizeStock);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _$Initail implements SizeStockState {
  const _$Initail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$Initail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SizeStockState.initial()';
}


}




/// @nodoc


class _Success implements SizeStockState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SizeStockState.success()';
}


}




/// @nodoc


class _Loading implements SizeStockState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SizeStockState.loading()';
}


}




/// @nodoc


class _Loaded implements SizeStockState {
  const _Loaded(final  List<SizeStockModel> sizeStock): _sizeStock = sizeStock;
  

 final  List<SizeStockModel> _sizeStock;
 List<SizeStockModel> get sizeStock {
  if (_sizeStock is EqualUnmodifiableListView) return _sizeStock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizeStock);
}


/// Create a copy of SizeStockState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._sizeStock, _sizeStock));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sizeStock));

@override
String toString() {
  return 'SizeStockState.loaded(sizeStock: $sizeStock)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $SizeStockStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<SizeStockModel> sizeStock
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of SizeStockState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sizeStock = null,}) {
  return _then(_Loaded(
null == sizeStock ? _self._sizeStock : sizeStock // ignore: cast_nullable_to_non_nullable
as List<SizeStockModel>,
  ));
}


}

/// @nodoc


class _Failure implements SizeStockState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of SizeStockState
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
  return 'SizeStockState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $SizeStockStateCopyWith<$Res> {
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

/// Create a copy of SizeStockState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
