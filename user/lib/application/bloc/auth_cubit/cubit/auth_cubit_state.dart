part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthLoading extends AuthCubitState {}

final class AuthSuccess extends AuthCubitState {}

final class AuthFailure extends AuthCubitState {
  final String message;
  AuthFailure(this.message);

}

final class NotLoggedIn extends AuthCubitState{}