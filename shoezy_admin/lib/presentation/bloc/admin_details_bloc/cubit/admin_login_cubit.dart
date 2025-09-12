import 'package:bloc/bloc.dart';
import 'package:loginpage/fetures/core/admindetails.dart';
import 'package:meta/meta.dart';

part 'admin_login_state.dart';

class AdminLoginCubit extends Cubit<AdminLoginState> {
  Admindetails admindetails=Admindetails();
  AdminLoginCubit() : super(AdminLoginInitial());
  Future<void>login({required String username,required String password})async{
   emit(AdminLoginLoading());
    try{
       await Future.delayed(Duration(seconds: 1));
       if(username==admindetails.userName && password==admindetails.password){
        emit(AdminLoginSuccess());
       }else{
        emit(AdminLoginFailure('Invalid username or password'));
       }
    }catch(e){
      print(e);
    }
  }
}
