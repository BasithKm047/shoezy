import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';

part 'admin_profile_event.dart';
part 'admin_profile_state.dart';

class AdminProfileBloc extends Bloc<AdminProfileEvent, AdminProfileState> {
  AdminProfileBloc() : super(AdminProfileInitial()) {
    on<AdminProfileImagePick>((event, emit) async{
       final image=await Commonfunction.pickImageWeb();

       if(image!=null){
        emit(AdminProfileImagePickedState(image));

       }

    },);
    on<AdminProfileUpdateevent>((event, emit) async{
        emit(AdminProfileSubmitting());

        try{
            await Future.delayed(Duration(seconds: 1));

            emit(AdminProfileUpdateSuccess());
        }catch(e){
          emit(AdminProfileUpdateFailed('Failed to update profile'));
        }
    },);
  }
}
