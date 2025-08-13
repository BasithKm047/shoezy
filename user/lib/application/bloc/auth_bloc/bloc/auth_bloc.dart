import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shoezy/data/auth/auth_services.dart';
import 'package:shoezy/data/models/user_model.dart';
// import 'package:shoezy/presentation/screens/signup_screen.dart';

part 'auth_event.dart';
part 'auth_state.dart';

// ignore: unused_field
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServices authServices;
  AuthBloc({required this.authServices}) : super(AuthInitial()) {
    on<SignUpEvent>(_siginUp);
    on<SignInEvent>(_signin);
    on<CheckUserStatus>(_checkUser);
    on<DeleteAccountRequested>(_deleteAccount);
    on<GoogleSignInRequested>(_googleSignin);
    on<LogoutEvent>(_logout);
    on<ForgetPasswordEvent>(_forgetPassword);
  }

  Future<void> _siginUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    Logger().w("signup event");
    try {
      await authServices.createAccount(
        user: event.user,
        password: event.password,
      );
      emit(Authcreate());
      Logger().w("bloc completed ");
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _signin(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      Logger().w("signIn event");
      await authServices.signIn(email: event.email, password: event.password);
      emit(AuthSuccess());
      Logger().i("signin completed");
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _checkUser(
    CheckUserStatus event,
    Emitter<AuthState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 3));
    final user = authServices.currentUser;
    if (user != null) {
      emit(AuthLoggedIn());
    } else {
      emit(AuthLogOUt());
    }
  }

  Future<void> _deleteAccount(
    DeleteAccountRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authServices.deleteAccount(
        email: event.user.email,
        password: event.password,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _googleSignin(
    GoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    Logger().i('Google signin called');
    emit(GooleLoading());
    try {
      await authServices.signInWithGoogle(isNewUser: event.isNewUser);

      emit(GoogleSignInstate(event.isNewUser ?'Account Created Succesfull':'SignIn Sucessfull'));
      Logger().i('Google signin Complete');
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _logout(LogoutEvent event, Emitter<AuthState> emit) async {
    // emit(AuthLoading(
    //   AuthActionType.logout
    // ));
    try {
      Logger().i("logout event called");

      await authServices.signOut();
      emit(AuthLogOUt());

      Logger().i("logout event complteed");
    } catch (e) {
      AuthFailure(e.toString());
    }
  }

  Future<void> _forgetPassword(
    ForgetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await authServices.resetPassword(email: event.email);
      emit(RestPasswordState());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
