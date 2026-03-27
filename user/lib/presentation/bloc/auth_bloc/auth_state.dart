part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  
}

final class Authcreate extends AuthState {}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
enum AuthSuccessType {
  emailSignUp,
  emailSignIn,
  googleSignUp,
  googleSignIn,
}

final class GoogleSignInstate extends AuthState {
final  String message;
  GoogleSignInstate(this.message);
} 

final class AuthLogOUt extends AuthState {}

final class AuthLoggedIn extends AuthState {}

final class GooleLoading extends AuthState{}

final class RestPasswordState extends AuthState{}
 
 final class RestPasswordFailureState extends AuthState{
  final String message;
  RestPasswordFailureState(this.message);
 }
