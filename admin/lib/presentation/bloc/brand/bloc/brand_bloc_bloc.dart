import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';

part 'brand_bloc_event.dart';
part 'brand_bloc_state.dart';

class BrandBlocBloc extends Bloc<BrandBlocEvent, BrandBlocState> {
  BrandBlocBloc() : super(BrandBlocInitial()) {
    on<PicImageEvent>((event,emit)async{
      final image=await Commonfunction.pickImageWeb();
      if(image!=null){
        emit(ImagePickedState(image));
      }

    });
    on<SubmitFormEvent>((event,emit)async{
      emit(BrandFormSubmitting());
      try{
        await Future.delayed(Duration(seconds: 1));
        emit(BrandFormSuccess());
      
      }catch  (e){
        emit(BrandFormFailure('Failed to add brand'));
      }
    });
  }
}
