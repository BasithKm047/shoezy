part of 'user_bloc.dart';
@freezed
sealed class UserState with _$UserState {
  const factory UserState.initial() = UserInitial;
  const factory UserState.loading() = UserLoading;    
  const factory UserState.loaded(List<Usermodel> users) = UserLoaded;
  const factory UserState.error(String message) = UserError;
}
