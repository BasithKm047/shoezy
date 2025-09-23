// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/size_stock_model.dart/size_stock_model.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/data/repositories/variants_services.dart';

part 'varients_event.dart';
part 'varients_state.dart';

part 'varients_bloc.freezed.dart';

class VariantsBloc extends Bloc<VariantsEvent, VariantsState> {
  List<Variantsmodel> variants = [];
  List<Uint8List> images = [];

  VariantsBloc() : super(VariantsState.inintial()) {
    on<_ImageUploadedEvent>((event, emit) {
      emit(_Loading());
      try {
        images = event.image;
        emit(
          VariantsState.data(
            images: images,
            variants: variants,
          ),
        );
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
    on<_ImageRemoved>((event, emit) {
      try {
        final List<Uint8List> currentImages = state.maybeWhen(
          data: (images, variants, showFields) => images,
          orElse: () => [],
          imageAddedState: (images) => images,
          imageRemovedState: (reimage) => reimage,
        );
        Logger().d('Current images before removal: ');

        if (event.index >= 0 && event.index < currentImages.length) {
          images = List<Uint8List>.from(currentImages)..removeAt(event.index);
          //  emit(VariantsState.imageRemovedState(images));
          emit(
            VariantsState.data(
              images: images,
              variants: variants,
            ),
          );
          Logger().d(
            'Image removed successfully at index: ${event.index}, new count: ',
          );
        } else {
          emit(
            VariantsState.data(
              images: currentImages,
              variants: variants,
            ),
          );
          Logger().d('Invalid index for image removal: ${event.index}');
        }
      } catch (e) {
        emit(_Failure(e.toString()));
        Logger().e('Error removing image: $e');
      }
    });

 

    on<_ResetImage>((event, emit) {
      Logger().i('Resetting images, preserving variants: $variants');
      images = [];
      emit(
        VariantsState.data(
          images: images,
          variants: variants,
        ),
      );
    });

    on<_ShowFields>((event, emit) {
      emit(_ShowFieldsState());
    });

    on<_HideFields>((event, emit) {
      emit(_HideFieldsState());
    });
    on<_ToggleFields>((event, emit) {
      final currentState = state;
      if (currentState is _ShowFieldsState) {
        emit(_HideFieldsState());
      } else {
        emit(_ShowFieldsState());
      }
    });
    on<_AddVaraints>((event, emit){
      emit(_Loading());
      try {
       variants = List.from(variants)..addAll(event.varaints);
        Logger().i('Variants Added: $variants');
        emit(
          VariantsState.data(
            images:List.from(images),
           variants: List.from(variants),
          ),
        );
      } catch (e) {
        Logger().e('Error adding variants: $e');
        emit(_Failure(e.toString()));
      }
    });
    on<_Getvariants>((event, emit) async {
      emit(_Loading());
      try {
        emit(VariantsState.variantsLoaded(variants));
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
    on<_ClearVariants>((event, emit) async {
      try {
        Logger().i('Clearing all variants and images');
        variants = [];
        images = [];
        emit(
          VariantsState.data(
            images: images,
            variants: variants,
          ),
        );
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
  on<_RemoveVariants>((event, emit) async {
      try {
        Logger().i('Before removing variant: $variants');
        variants = variants.where((v) => v.id != event.variants.id).toList();
        Logger().i('After removing variant: $variants');
        emit(
          VariantsState.data(
            images: List.from(images),
            variants: List.from(variants),
          ),
        );
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
  }
}
