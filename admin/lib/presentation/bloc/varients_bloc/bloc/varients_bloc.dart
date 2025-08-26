import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/data/repositories/variants_services.dart';

part 'varients_event.dart';
part 'varients_state.dart';

part 'varients_bloc.freezed.dart';

class VariantsBloc extends Bloc<VariantsEvent, VariantsState> {
  final VariantsServices variantsServices;
  VariantsBloc(this.variantsServices) : super(VariantsState.inintial()) {
    on<_ImageUploadedEvent>((event, emit) {
      emit(_Loading());
      try {
        final updateImage = event.image;
        emit(_ImageAddedState(updateImage));
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
    on<_ImageRemoved>((event, emit) {
      emit(_Loading());
      final currentImages = state.maybeWhen(
        imageAddedState: (images) => images,
        imageRemovedState: (image) => image,
        orElse: () => [],
      );

      final updatedImages = List<Uint8List>.from(currentImages)
        ..remove(event.removedImage);

      emit(VariantsState.imageRemovedState(updatedImages));
    });
    on<_AddVaraints>((event, emit) async {
      emit(_Loading());
      try {
        await variantsServices.addVariant(
          color: event.varaints.color,
          images: event.varaints.images,
          size: event.varaints.size,
          stock: event.varaints.stock,
        );
        log('variant added success');
        print('variant added sucess');
        emit(VariantsState.success());
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
    on<_Getvariants>((event, emit) async {
      emit(_Loading());
      try {
        final variants = await variantsServices.getVaraints();
        print('variant recieved');
        log('variant recieved');
        emit(VariantsState.variantsLoaded(variants));
      } catch (e) {
        _Failure(e.toString());
      }
    });
    on<_ResetImage>((event, emit) {
      emit(_ImageAddedState([]));
    });
  }
}
