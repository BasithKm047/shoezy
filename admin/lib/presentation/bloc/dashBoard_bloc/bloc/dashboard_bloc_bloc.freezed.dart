// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardBlocEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardBlocEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardBlocEvent()';
}


}

/// @nodoc
class $DashboardBlocEventCopyWith<$Res>  {
$DashboardBlocEventCopyWith(DashboardBlocEvent _, $Res Function(DashboardBlocEvent) __);
}


/// Adds pattern-matching-related methods to [DashboardBlocEvent].
extension DashboardBlocEventPatterns on DashboardBlocEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadDashboardData value)?  loadDashboardData,TResult Function( MonthChanged value)?  monthChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadDashboardData() when loadDashboardData != null:
return loadDashboardData(_that);case MonthChanged() when monthChanged != null:
return monthChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadDashboardData value)  loadDashboardData,required TResult Function( MonthChanged value)  monthChanged,}){
final _that = this;
switch (_that) {
case LoadDashboardData():
return loadDashboardData(_that);case MonthChanged():
return monthChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadDashboardData value)?  loadDashboardData,TResult? Function( MonthChanged value)?  monthChanged,}){
final _that = this;
switch (_that) {
case LoadDashboardData() when loadDashboardData != null:
return loadDashboardData(_that);case MonthChanged() when monthChanged != null:
return monthChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadDashboardData,TResult Function( String selectedMonth)?  monthChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadDashboardData() when loadDashboardData != null:
return loadDashboardData();case MonthChanged() when monthChanged != null:
return monthChanged(_that.selectedMonth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadDashboardData,required TResult Function( String selectedMonth)  monthChanged,}) {final _that = this;
switch (_that) {
case LoadDashboardData():
return loadDashboardData();case MonthChanged():
return monthChanged(_that.selectedMonth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadDashboardData,TResult? Function( String selectedMonth)?  monthChanged,}) {final _that = this;
switch (_that) {
case LoadDashboardData() when loadDashboardData != null:
return loadDashboardData();case MonthChanged() when monthChanged != null:
return monthChanged(_that.selectedMonth);case _:
  return null;

}
}

}

/// @nodoc


class LoadDashboardData implements DashboardBlocEvent {
  const LoadDashboardData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDashboardData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardBlocEvent.loadDashboardData()';
}


}




/// @nodoc


class MonthChanged implements DashboardBlocEvent {
  const MonthChanged(this.selectedMonth);
  

 final  String selectedMonth;

/// Create a copy of DashboardBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthChangedCopyWith<MonthChanged> get copyWith => _$MonthChangedCopyWithImpl<MonthChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthChanged&&(identical(other.selectedMonth, selectedMonth) || other.selectedMonth == selectedMonth));
}


@override
int get hashCode => Object.hash(runtimeType,selectedMonth);

@override
String toString() {
  return 'DashboardBlocEvent.monthChanged(selectedMonth: $selectedMonth)';
}


}

/// @nodoc
abstract mixin class $MonthChangedCopyWith<$Res> implements $DashboardBlocEventCopyWith<$Res> {
  factory $MonthChangedCopyWith(MonthChanged value, $Res Function(MonthChanged) _then) = _$MonthChangedCopyWithImpl;
@useResult
$Res call({
 String selectedMonth
});




}
/// @nodoc
class _$MonthChangedCopyWithImpl<$Res>
    implements $MonthChangedCopyWith<$Res> {
  _$MonthChangedCopyWithImpl(this._self, this._then);

  final MonthChanged _self;
  final $Res Function(MonthChanged) _then;

/// Create a copy of DashboardBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedMonth = null,}) {
  return _then(MonthChanged(
null == selectedMonth ? _self.selectedMonth : selectedMonth // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DashboardBlocState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardBlocState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardBlocState()';
}


}

/// @nodoc
class $DashboardBlocStateCopyWith<$Res>  {
$DashboardBlocStateCopyWith(DashboardBlocState _, $Res Function(DashboardBlocState) __);
}


/// Adds pattern-matching-related methods to [DashboardBlocState].
extension DashboardBlocStatePatterns on DashboardBlocState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _LoadDashboardData value)?  loadDashboardData,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LoadDashboardData() when loadDashboardData != null:
return loadDashboardData(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _LoadDashboardData value)  loadDashboardData,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _LoadDashboardData():
return loadDashboardData(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _LoadDashboardData value)?  loadDashboardData,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LoadDashboardData() when loadDashboardData != null:
return loadDashboardData(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<FlSpot> salesSpots,  List<FlSpot> profitSpots,  String selectedMonth)?  loadDashboardData,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoadDashboardData() when loadDashboardData != null:
return loadDashboardData(_that.salesSpots,_that.profitSpots,_that.selectedMonth);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<FlSpot> salesSpots,  List<FlSpot> profitSpots,  String selectedMonth)  loadDashboardData,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _LoadDashboardData():
return loadDashboardData(_that.salesSpots,_that.profitSpots,_that.selectedMonth);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<FlSpot> salesSpots,  List<FlSpot> profitSpots,  String selectedMonth)?  loadDashboardData,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoadDashboardData() when loadDashboardData != null:
return loadDashboardData(_that.salesSpots,_that.profitSpots,_that.selectedMonth);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DashboardBlocState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardBlocState.initial()';
}


}




/// @nodoc


class _Loading implements DashboardBlocState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardBlocState.loading()';
}


}




/// @nodoc


class _LoadDashboardData implements DashboardBlocState {
  const _LoadDashboardData({required final  List<FlSpot> salesSpots, required final  List<FlSpot> profitSpots, required this.selectedMonth}): _salesSpots = salesSpots,_profitSpots = profitSpots;
  

 final  List<FlSpot> _salesSpots;
 List<FlSpot> get salesSpots {
  if (_salesSpots is EqualUnmodifiableListView) return _salesSpots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_salesSpots);
}

 final  List<FlSpot> _profitSpots;
 List<FlSpot> get profitSpots {
  if (_profitSpots is EqualUnmodifiableListView) return _profitSpots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profitSpots);
}

 final  String selectedMonth;

/// Create a copy of DashboardBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDashboardDataCopyWith<_LoadDashboardData> get copyWith => __$LoadDashboardDataCopyWithImpl<_LoadDashboardData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDashboardData&&const DeepCollectionEquality().equals(other._salesSpots, _salesSpots)&&const DeepCollectionEquality().equals(other._profitSpots, _profitSpots)&&(identical(other.selectedMonth, selectedMonth) || other.selectedMonth == selectedMonth));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_salesSpots),const DeepCollectionEquality().hash(_profitSpots),selectedMonth);

@override
String toString() {
  return 'DashboardBlocState.loadDashboardData(salesSpots: $salesSpots, profitSpots: $profitSpots, selectedMonth: $selectedMonth)';
}


}

/// @nodoc
abstract mixin class _$LoadDashboardDataCopyWith<$Res> implements $DashboardBlocStateCopyWith<$Res> {
  factory _$LoadDashboardDataCopyWith(_LoadDashboardData value, $Res Function(_LoadDashboardData) _then) = __$LoadDashboardDataCopyWithImpl;
@useResult
$Res call({
 List<FlSpot> salesSpots, List<FlSpot> profitSpots, String selectedMonth
});




}
/// @nodoc
class __$LoadDashboardDataCopyWithImpl<$Res>
    implements _$LoadDashboardDataCopyWith<$Res> {
  __$LoadDashboardDataCopyWithImpl(this._self, this._then);

  final _LoadDashboardData _self;
  final $Res Function(_LoadDashboardData) _then;

/// Create a copy of DashboardBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? salesSpots = null,Object? profitSpots = null,Object? selectedMonth = null,}) {
  return _then(_LoadDashboardData(
salesSpots: null == salesSpots ? _self._salesSpots : salesSpots // ignore: cast_nullable_to_non_nullable
as List<FlSpot>,profitSpots: null == profitSpots ? _self._profitSpots : profitSpots // ignore: cast_nullable_to_non_nullable
as List<FlSpot>,selectedMonth: null == selectedMonth ? _self.selectedMonth : selectedMonth // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements DashboardBlocState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of DashboardBlocState
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
  return 'DashboardBlocState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DashboardBlocStateCopyWith<$Res> {
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

/// Create a copy of DashboardBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
