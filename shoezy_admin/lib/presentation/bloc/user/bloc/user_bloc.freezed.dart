// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent()';
}


}

/// @nodoc
class $UserEventCopyWith<$Res>  {
$UserEventCopyWith(UserEvent _, $Res Function(UserEvent) __);
}


/// Adds pattern-matching-related methods to [UserEvent].
extension UserEventPatterns on UserEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddUser value)?  addUser,TResult Function( UpdateUser value)?  updateUser,TResult Function( DeleteUser value)?  deleteUser,TResult Function( FetchUsers value)?  fetchUsers,TResult Function( SearchUsers value)?  searchUsers,TResult Function( BlockUnblockUser value)?  blockUnblockUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddUser() when addUser != null:
return addUser(_that);case UpdateUser() when updateUser != null:
return updateUser(_that);case DeleteUser() when deleteUser != null:
return deleteUser(_that);case FetchUsers() when fetchUsers != null:
return fetchUsers(_that);case SearchUsers() when searchUsers != null:
return searchUsers(_that);case BlockUnblockUser() when blockUnblockUser != null:
return blockUnblockUser(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddUser value)  addUser,required TResult Function( UpdateUser value)  updateUser,required TResult Function( DeleteUser value)  deleteUser,required TResult Function( FetchUsers value)  fetchUsers,required TResult Function( SearchUsers value)  searchUsers,required TResult Function( BlockUnblockUser value)  blockUnblockUser,}){
final _that = this;
switch (_that) {
case AddUser():
return addUser(_that);case UpdateUser():
return updateUser(_that);case DeleteUser():
return deleteUser(_that);case FetchUsers():
return fetchUsers(_that);case SearchUsers():
return searchUsers(_that);case BlockUnblockUser():
return blockUnblockUser(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddUser value)?  addUser,TResult? Function( UpdateUser value)?  updateUser,TResult? Function( DeleteUser value)?  deleteUser,TResult? Function( FetchUsers value)?  fetchUsers,TResult? Function( SearchUsers value)?  searchUsers,TResult? Function( BlockUnblockUser value)?  blockUnblockUser,}){
final _that = this;
switch (_that) {
case AddUser() when addUser != null:
return addUser(_that);case UpdateUser() when updateUser != null:
return updateUser(_that);case DeleteUser() when deleteUser != null:
return deleteUser(_that);case FetchUsers() when fetchUsers != null:
return fetchUsers(_that);case SearchUsers() when searchUsers != null:
return searchUsers(_that);case BlockUnblockUser() when blockUnblockUser != null:
return blockUnblockUser(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Usermodel user)?  addUser,TResult Function( Usermodel user)?  updateUser,TResult Function( String id)?  deleteUser,TResult Function()?  fetchUsers,TResult Function( String query)?  searchUsers,TResult Function( Usermodel user)?  blockUnblockUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddUser() when addUser != null:
return addUser(_that.user);case UpdateUser() when updateUser != null:
return updateUser(_that.user);case DeleteUser() when deleteUser != null:
return deleteUser(_that.id);case FetchUsers() when fetchUsers != null:
return fetchUsers();case SearchUsers() when searchUsers != null:
return searchUsers(_that.query);case BlockUnblockUser() when blockUnblockUser != null:
return blockUnblockUser(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Usermodel user)  addUser,required TResult Function( Usermodel user)  updateUser,required TResult Function( String id)  deleteUser,required TResult Function()  fetchUsers,required TResult Function( String query)  searchUsers,required TResult Function( Usermodel user)  blockUnblockUser,}) {final _that = this;
switch (_that) {
case AddUser():
return addUser(_that.user);case UpdateUser():
return updateUser(_that.user);case DeleteUser():
return deleteUser(_that.id);case FetchUsers():
return fetchUsers();case SearchUsers():
return searchUsers(_that.query);case BlockUnblockUser():
return blockUnblockUser(_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Usermodel user)?  addUser,TResult? Function( Usermodel user)?  updateUser,TResult? Function( String id)?  deleteUser,TResult? Function()?  fetchUsers,TResult? Function( String query)?  searchUsers,TResult? Function( Usermodel user)?  blockUnblockUser,}) {final _that = this;
switch (_that) {
case AddUser() when addUser != null:
return addUser(_that.user);case UpdateUser() when updateUser != null:
return updateUser(_that.user);case DeleteUser() when deleteUser != null:
return deleteUser(_that.id);case FetchUsers() when fetchUsers != null:
return fetchUsers();case SearchUsers() when searchUsers != null:
return searchUsers(_that.query);case BlockUnblockUser() when blockUnblockUser != null:
return blockUnblockUser(_that.user);case _:
  return null;

}
}

}

/// @nodoc


class AddUser implements UserEvent {
  const AddUser(this.user);
  

 final  Usermodel user;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddUserCopyWith<AddUser> get copyWith => _$AddUserCopyWithImpl<AddUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserEvent.addUser(user: $user)';
}


}

/// @nodoc
abstract mixin class $AddUserCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $AddUserCopyWith(AddUser value, $Res Function(AddUser) _then) = _$AddUserCopyWithImpl;
@useResult
$Res call({
 Usermodel user
});


$UsermodelCopyWith<$Res> get user;

}
/// @nodoc
class _$AddUserCopyWithImpl<$Res>
    implements $AddUserCopyWith<$Res> {
  _$AddUserCopyWithImpl(this._self, this._then);

  final AddUser _self;
  final $Res Function(AddUser) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AddUser(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Usermodel,
  ));
}

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsermodelCopyWith<$Res> get user {
  
  return $UsermodelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class UpdateUser implements UserEvent {
  const UpdateUser(this.user);
  

 final  Usermodel user;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserCopyWith<UpdateUser> get copyWith => _$UpdateUserCopyWithImpl<UpdateUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserEvent.updateUser(user: $user)';
}


}

/// @nodoc
abstract mixin class $UpdateUserCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $UpdateUserCopyWith(UpdateUser value, $Res Function(UpdateUser) _then) = _$UpdateUserCopyWithImpl;
@useResult
$Res call({
 Usermodel user
});


$UsermodelCopyWith<$Res> get user;

}
/// @nodoc
class _$UpdateUserCopyWithImpl<$Res>
    implements $UpdateUserCopyWith<$Res> {
  _$UpdateUserCopyWithImpl(this._self, this._then);

  final UpdateUser _self;
  final $Res Function(UpdateUser) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UpdateUser(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Usermodel,
  ));
}

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsermodelCopyWith<$Res> get user {
  
  return $UsermodelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class DeleteUser implements UserEvent {
  const DeleteUser(this.id);
  

 final  String id;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteUserCopyWith<DeleteUser> get copyWith => _$DeleteUserCopyWithImpl<DeleteUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUser&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'UserEvent.deleteUser(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteUserCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $DeleteUserCopyWith(DeleteUser value, $Res Function(DeleteUser) _then) = _$DeleteUserCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DeleteUserCopyWithImpl<$Res>
    implements $DeleteUserCopyWith<$Res> {
  _$DeleteUserCopyWithImpl(this._self, this._then);

  final DeleteUser _self;
  final $Res Function(DeleteUser) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteUser(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FetchUsers implements UserEvent {
  const FetchUsers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchUsers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent.fetchUsers()';
}


}




/// @nodoc


class SearchUsers implements UserEvent {
  const SearchUsers(this.query);
  

 final  String query;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsersCopyWith<SearchUsers> get copyWith => _$SearchUsersCopyWithImpl<SearchUsers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsers&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'UserEvent.searchUsers(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchUsersCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $SearchUsersCopyWith(SearchUsers value, $Res Function(SearchUsers) _then) = _$SearchUsersCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchUsersCopyWithImpl<$Res>
    implements $SearchUsersCopyWith<$Res> {
  _$SearchUsersCopyWithImpl(this._self, this._then);

  final SearchUsers _self;
  final $Res Function(SearchUsers) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchUsers(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BlockUnblockUser implements UserEvent {
  const BlockUnblockUser(this.user);
  

 final  Usermodel user;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockUnblockUserCopyWith<BlockUnblockUser> get copyWith => _$BlockUnblockUserCopyWithImpl<BlockUnblockUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockUnblockUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserEvent.blockUnblockUser(user: $user)';
}


}

/// @nodoc
abstract mixin class $BlockUnblockUserCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $BlockUnblockUserCopyWith(BlockUnblockUser value, $Res Function(BlockUnblockUser) _then) = _$BlockUnblockUserCopyWithImpl;
@useResult
$Res call({
 Usermodel user
});


$UsermodelCopyWith<$Res> get user;

}
/// @nodoc
class _$BlockUnblockUserCopyWithImpl<$Res>
    implements $BlockUnblockUserCopyWith<$Res> {
  _$BlockUnblockUserCopyWithImpl(this._self, this._then);

  final BlockUnblockUser _self;
  final $Res Function(BlockUnblockUser) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(BlockUnblockUser(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Usermodel,
  ));
}

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsermodelCopyWith<$Res> get user {
  
  return $UsermodelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc
mixin _$UserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState()';
}


}

/// @nodoc
class $UserStateCopyWith<$Res>  {
$UserStateCopyWith(UserState _, $Res Function(UserState) __);
}


/// Adds pattern-matching-related methods to [UserState].
extension UserStatePatterns on UserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserInitial value)?  initial,TResult Function( UserLoading value)?  loading,TResult Function( UserLoaded value)?  loaded,TResult Function( UserError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserInitial() when initial != null:
return initial(_that);case UserLoading() when loading != null:
return loading(_that);case UserLoaded() when loaded != null:
return loaded(_that);case UserError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserInitial value)  initial,required TResult Function( UserLoading value)  loading,required TResult Function( UserLoaded value)  loaded,required TResult Function( UserError value)  error,}){
final _that = this;
switch (_that) {
case UserInitial():
return initial(_that);case UserLoading():
return loading(_that);case UserLoaded():
return loaded(_that);case UserError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserInitial value)?  initial,TResult? Function( UserLoading value)?  loading,TResult? Function( UserLoaded value)?  loaded,TResult? Function( UserError value)?  error,}){
final _that = this;
switch (_that) {
case UserInitial() when initial != null:
return initial(_that);case UserLoading() when loading != null:
return loading(_that);case UserLoaded() when loaded != null:
return loaded(_that);case UserError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Usermodel> users)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserInitial() when initial != null:
return initial();case UserLoading() when loading != null:
return loading();case UserLoaded() when loaded != null:
return loaded(_that.users);case UserError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Usermodel> users)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case UserInitial():
return initial();case UserLoading():
return loading();case UserLoaded():
return loaded(_that.users);case UserError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Usermodel> users)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case UserInitial() when initial != null:
return initial();case UserLoading() when loading != null:
return loading();case UserLoaded() when loaded != null:
return loaded(_that.users);case UserError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class UserInitial implements UserState {
  const UserInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.initial()';
}


}




/// @nodoc


class UserLoading implements UserState {
  const UserLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.loading()';
}


}




/// @nodoc


class UserLoaded implements UserState {
  const UserLoaded(final  List<Usermodel> users): _users = users;
  

 final  List<Usermodel> _users;
 List<Usermodel> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLoadedCopyWith<UserLoaded> get copyWith => _$UserLoadedCopyWithImpl<UserLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoaded&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'UserState.loaded(users: $users)';
}


}

/// @nodoc
abstract mixin class $UserLoadedCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $UserLoadedCopyWith(UserLoaded value, $Res Function(UserLoaded) _then) = _$UserLoadedCopyWithImpl;
@useResult
$Res call({
 List<Usermodel> users
});




}
/// @nodoc
class _$UserLoadedCopyWithImpl<$Res>
    implements $UserLoadedCopyWith<$Res> {
  _$UserLoadedCopyWithImpl(this._self, this._then);

  final UserLoaded _self;
  final $Res Function(UserLoaded) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(UserLoaded(
null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<Usermodel>,
  ));
}


}

/// @nodoc


class UserError implements UserState {
  const UserError(this.message);
  

 final  String message;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserErrorCopyWith<UserError> get copyWith => _$UserErrorCopyWithImpl<UserError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserErrorCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $UserErrorCopyWith(UserError value, $Res Function(UserError) _then) = _$UserErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserErrorCopyWithImpl<$Res>
    implements $UserErrorCopyWith<$Res> {
  _$UserErrorCopyWithImpl(this._self, this._then);

  final UserError _self;
  final $Res Function(UserError) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
