import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
// import 'package:shoezy/application/service/authontication.dart';
import 'package:shoezy/data/auth/auth_services.dart';
import 'package:shoezy/data/models/user_model.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  final AuthServices authServices;

  AuthCubitCubit({required this.authServices}) : super(AuthCubitInitial());

  Future<void> signup({
    required UserModel user,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await authServices.createAccount(user: user, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signIn(UserModel user, String password) async {
    emit(AuthLoading());
    try {
      await authServices.signIn(email: user.email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

   Future<void> checkUser() async {
    await Future.delayed(Duration(seconds: 3));
    final user = authServices.currentUser;
    try {
      if (user == null) {
       emit(NotLoggedIn());
      } else {
        emit(AuthSuccess());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> forgetPassword({required UserModel user}) async {
    emit(AuthLoading());
    try {
      await authServices.resetPassword(email: user.email);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await authServices.signOut();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> updateUsername({required UserModel user}) async {
    emit(AuthLoading());
    try {
      await authServices.updateUsername(userName: user.userName);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> deleteAccount({
    required UserModel user,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await authServices.deleteAccount(email: user.email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void>signInWithGoogle()async{
    emit(AuthLoading());
    try{
      await authServices.signInWithGoogle();
      emit(AuthSuccess());
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }
}
