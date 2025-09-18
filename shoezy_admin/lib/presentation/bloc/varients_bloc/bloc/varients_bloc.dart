// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/vareintModel/size_stock_model.dart/size_stock_model.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/data/repositories/variants_services.dart';

part 'varients_event.dart';
part 'varients_state.dart';

part 'varients_bloc.freezed.dart';

class VariantsBloc extends Bloc<VariantsEvent, VariantsState> {
  List<Variantsmodel> variants = [];
  List<SizeStockModel> sizeStock = [];
  List<Uint8List> images = [];

  final VariantsServices variantsServices;
  VariantsBloc(this.variantsServices) : super(VariantsState.inintial()) {
    on<_ImageUploadedEvent>((event, emit) {
      emit(_Loading());
      try {
        images = event.image;
        emit(
          VariantsState.data(
            images: images,
            sizeStock: sizeStock,
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
          data: (images, sizeStock, variants, showFields) => images,
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
              sizeStock: sizeStock,
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
              sizeStock: sizeStock,
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

    on<_AddSizeStock>((event, emit) async {
      try {
        sizeStock = List.from(sizeStock)..add(event.sizeStock);
        Logger().i('SizeStock Added: ${event.sizeStock}');
        emit(
          VariantsState.data(
            sizeStock: sizeStock,
            images: images,
            variants: variants,
          ),
        );
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });

    on<_RemoveSizeStock>((event, emit) async {
      try {
        if (event.index >= 0 && event.index < sizeStock.length) {
          sizeStock = List.from(sizeStock)..removeAt(event.index);
          emit(VariantsState.removedSizeStockState(sizeStock));
        }
        emit(
          VariantsState.data(
            sizeStock: sizeStock,
            images: images,
            variants: variants,
          ),
        );
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });

    on<_ResetImage>((event, emit) {
      images = [];
      emit(
        VariantsState.data(
          sizeStock: sizeStock,
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
    on<_AddVaraints>((event, emit)async {
      emit(_Loading());
      try {
        await Future.delayed(Duration(microseconds: 300));
        variants.addAll(event.varaints);
        Logger().i('Variants Added: ${event.varaints}');
        sizeStock = [];
        emit(
          VariantsState.data(
            sizeStock: sizeStock,
            images: images,
            variants: variants,
          ),
        );
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
    on<_Getvariants>((event, emit) async {
      try {
        emit(VariantsState.variantsLoaded(variants));
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
    on<_ClearVariants>((event, emit) async {
      try {
        variants = [];
        sizeStock = [];
        images = [];
        emit(
          VariantsState.data(
            sizeStock: sizeStock,
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
        variants.remove(event.variants);
        emit(VariantsState.variantRemoved());
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
  }
}
