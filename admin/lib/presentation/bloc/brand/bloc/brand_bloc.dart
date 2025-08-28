import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy_admin/data/model/brand/brand_model.dart';
import 'package:shoezy_admin/data/repositories/brand_services.dart';

part 'brand_event.dart';
part 'brand_state.dart';
part 'brand_bloc.freezed.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandServices brandServices;

  BrandBloc(this.brandServices) : super(const BrandState.initial()) {
    on<ImageUploaded>((event, emit) {
      emit(BrandState.loading());
      try {
        emit(BrandState.imagesUpdated(event.imageBytes));
      } catch (e) {
        emit(BrandState.error(e.toString()));
      }
    });
    on<RemovedImage>((event, emit) {
      emit(BrandState.loading());
      try {
        final currentImages = state.maybeWhen(
          orElse: () => [],
          imagesUpdated: (images) => images,
          removedImageState: (image) => image,
        );
        final updatedImages = List<Uint8List>.from(currentImages)
          ..remove(event.removedImage);
        emit(BrandState.removedImageState(updatedImages));
      } catch (e) {
        emit(BrandState.error(e.toString()));
      }
    });
    on<AddBrand>((event, emit) async {
      emit(BrandState.loading());
      try {
        brandServices.addBrand(
          name: event.brands.name,
          image: event.brands.imageUrl,
        );

        emit(BrandState.success());
      } catch (e) {
        emit(BrandState.error(e.toString()));
      }
    });
    on<ClearImage>((event, emit) {
     emit(BrandState.imagesUpdated([]));
    });
    on<SelectedBrand>((event, emit) {
     state.maybeWhen(orElse: (){},
     loaded: (brands, selectedBrand){
      emit(BrandState.loaded(brands: brands, selectedBrand: event.brandName));
     });
    });

    on<FetchBrands>((event, emit) async{
      emit(BrandState.loading());
      try {
           await emit.forEach<List<BrandModel>>(
              brandServices.getBrands(),
              onData: (brands) => BrandState.loaded(brands: brands),
              onError: (error, stackTrace) => BrandState.error(error.toString()),
            );
      } catch (e) {
        emit(BrandState.error(e.toString()));
      }
    });
  }
}
