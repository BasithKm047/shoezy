part of 'admin_login_cubit.dart';

@immutable
sealed class AdminLoginState {}

final class AdminLoginInitial extends AdminLoginState {}

final class AdminLoginLoading extends AdminLoginState {}

final class AdminLoginSuccess extends AdminLoginState {}

final class AdminLoginFailure extends AdminLoginState {
  final String error;

  AdminLoginFailure(this.error);
}
