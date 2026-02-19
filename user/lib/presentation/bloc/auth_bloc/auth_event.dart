part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpEvent extends AuthEvent{
  final UserModel user;
  final String password;

  SignUpEvent({
     required this.user, required this.password
  });
}

class SignInEvent extends AuthEvent{
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class CheckUserStatus extends AuthEvent{}


class UpdateUsernameRequested extends AuthEvent {
  final UserModel user;
  UpdateUsernameRequested({required this.user});
}

class DeleteAccountRequested extends AuthEvent {
  final UserModel user;
  final String password;
  DeleteAccountRequested({required this.user, required this.password});
}

class GoogleSignInRequested extends AuthEvent {
 final bool isNewUser;
  GoogleSignInRequested(this.isNewUser);
}

class LogoutEvent extends AuthEvent{}
class ForgetPasswordEvent extends AuthEvent{
  final String email;
  ForgetPasswordEvent(this.email);
}
class GetUserDataEvent extends AuthEvent{
  final String userId;
  GetUserDataEvent(this.userId);
}
