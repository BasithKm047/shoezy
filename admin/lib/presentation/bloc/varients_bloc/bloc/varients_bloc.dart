// import 'dart:typed_data';


import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:meta/meta.dart';

part 'varients_event.dart';
part 'varients_state.dart';

part 'varients_bloc.freezed.dart';

class VarientsBloc extends Bloc<VarientsEvent, VarientsState> {
  VarientsBloc() : super(VarientsState.inintial()) {
    on<_ImageUploadedEvent>((event, emit) {
      emit(_Loading());
      try{
        final updateImage= event.image;
         emit(_ImageAddedState(updateImage));
      }catch(e){
        emit(_Failure(e.toString()));
      }
      
       
    });
    on<_ImageRemoved>((event,emit){
      final currentImages= state.maybeWhen(
        imageAddedState: (images) =>images ,
        imageRemovedState: (image) => image,
        orElse: () => [],);

        final updatedImages=List<Uint8List>.from(currentImages)..remove(event.removedImage);
        
       emit(VarientsState.imageRemovedState(updatedImages));
    });
  }
}
