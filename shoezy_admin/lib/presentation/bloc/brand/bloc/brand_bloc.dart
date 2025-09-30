import 'dart:typed_data';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/brand/brand_model.dart';
import 'package:shoezy_admin/data/repositories/brand_services.dart';

part 'brand_event.dart';
part 'brand_state.dart';
part 'brand_bloc.freezed.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandServices brandServices;

  BrandBloc(this.brandServices) : super(const BrandState.initial()) {
    on<BrandEvent>((event, emit) async {
      // ignore: await_only_futures
      await event.maybeWhen(
        imageUploaded: (imageBytes) {
          try {
            emit(BrandState.imagesUpdated(imageBytes));
          } catch (e) {
            emit(BrandState.error(e.toString()));
          }
        },
        removedImage: () {
          emit(BrandState.imagesUpdated(null));
        },

        addBrand: (brands) async {
          emit(BrandState.loading());
          try {
            await brandServices.addBrand(
              name: brands.name,
              image: brands.imageUrl!,
            );
            Logger().d('Brand Added Successfully');

            emit(BrandState.success());
          } catch (e) {
            emit(BrandState.error(e.toString()));
          }
        },
        clearImage: () {
          emit(BrandState.imagesUpdated(null));
        },
        selectedBrand: (brandName) {
          state.maybeWhen(
            orElse: () {},
            loaded: (brands, selectedBrand) {
              emit(BrandState.loaded(brands: brands, selectedBrand: brandName));
            },
          );
        },

        fetchBrands: () async {
          emit(BrandState.loading());
          try {
            final brands = await brandServices.getBrands();
            emit(BrandState.loaded(brands: brands));
          } catch (e) {
            emit(BrandState.error(e.toString()));
          }
        },
        clearSelection: () {
          state.maybeWhen(
            orElse: () {},
            loaded: (brands, selectedBrand) {
              emit(BrandState.loaded(brands: brands, selectedBrand: null));
            },
          );
        },
        updateBrand: (brands) async {
          emit(BrandState.loading());
          try {
            await brandServices.updateBrand(brand: brands);
            emit(BrandState.success());
          } catch (e) {
            Logger().d('Error: ${e.toString()}');
            emit(BrandState.error(e.toString()));
          }
        },
        deleteBrand: (id) async {
          emit(BrandState.loading());
          try {
            await brandServices.deleteBrand(id);
            emit(BrandState.success());
          } catch (e) {
            emit(BrandState.error(e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
}
