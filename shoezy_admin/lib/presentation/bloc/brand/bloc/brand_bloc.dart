import 'dart:typed_data';

// ignore: depend_on_referenced_packages
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
    on<BrandEvent>((event, emit) async {
      // ignore: await_only_futures
      await event.maybeWhen(
        imageUploaded: (imageBytes) {
          try {
            final previousLogo = state.maybeWhen(
              orElse: () => null,
              imagesUpdated: (logo, brand) => logo,
            );
            emit(
              BrandState.imagesUpdated(
                logoImage: previousLogo,
                brandImage: imageBytes,
              ),
            );
          } catch (e) {
            emit(BrandState.error(e.toString()));
          }
        },
        removedImage: () {
          emit(BrandState.imagesUpdated(brandImage: null, logoImage: null));
        },

        addBrand: (brands) async {
          emit(BrandState.loading());
          try {
            await brandServices.addBrand(
              name: brands.name,
              image: brands.imageUrl!,
              logoImage: brands.logoImage!,
            );
            // Logger().d('Brand Added Successfully');

            emit(BrandState.success());
          } catch (e) {
            emit(BrandState.error(e.toString()));
          }
        },
        clearImage: () {
          final previousLogo = state.maybeWhen(
            orElse: () => null,
            imagesUpdated: (logo, _) => logo,
          );
          emit(
            BrandState.imagesUpdated(logoImage: previousLogo, brandImage: null),
          );
        },
        selectedBrand: (brandName) {
          state.maybeWhen(
            orElse: () {},
            loaded: (brands, selectedBrand) {
              emit(BrandState.loaded(brands: brands, selectedBrand: brandName));
            },
          );
        },

        fetchBrands: (brandName) async {
          emit(BrandState.loading());
          try {
            final brands = await brandServices.getBrands();
            emit(BrandState.loaded(brands: brands, selectedBrand: brandName));
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
            // Logger().d('Error: ${e.toString()}');
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
        searchBrands: (query) async {
          // emit(const BrandState.loading());
          try {
            final brands = await brandServices.searchBrands(query);
            emit(BrandState.loaded(brands: brands, selectedBrand: null));
          } catch (e) {
            emit(BrandState.error(e.toString()));
          }
        },

        logoUpload: (logoImage) {
          try {
            final previousBrand = state.maybeWhen(
              orElse: () => null,
              imagesUpdated: (logo, brand) => brand,
            );
            emit(
              BrandState.imagesUpdated(
                logoImage: logoImage,
                brandImage: previousBrand,
              ),
            );
          } catch (e) {
            emit(BrandState.error(e.toString()));
          }
        },

        clearLogoImage: () {
          final previousBrand = state.maybeWhen(
            orElse: () => null,
            imagesUpdated: (_, brand) => brand,
          );
          emit(
            BrandState.imagesUpdated(
              logoImage: null,
              brandImage: previousBrand,
            ),
          );
        },
        startEditing: (brand) {
          emit(BrandState.editing(brand: brand));
        },
        updateLogoImage: (imageBytes) {
          state.maybeWhen(
            orElse: () {},
            editing: (brand, newLogo, newBrand) {
              emit(
                BrandState.editing(
                  brand: brand,
                  newLogoImage: imageBytes,
                  newBrandImage: newBrand,
                ),
              );
            },
          );
        },

        updateBrandImage: (imageBytes) {
          state.maybeWhen(
            orElse: () {},
            editing: (brand, newLogo, newBrand) {
              emit(
                BrandState.editing(
                  brand: brand,
                  newLogoImage: newLogo,
                  newBrandImage: imageBytes,
                ),
              );
            },
          );
        },
        clearEditedLogoImage: () {
      state.maybeWhen(
        orElse: () {},
        editing: (brand, newLogo, newBrand) {
          emit(BrandState.editing(
            brand: brand,
            newLogoImage: null,
            newBrandImage: newBrand,
          ));
        },
      );
    },

    clearEditedBrandImage: () {
      state.maybeWhen(
        orElse: () {},
        editing: (brand, newLogo, newBrand) {
          emit(BrandState.editing(
            brand: brand,
            newLogoImage: newLogo,
            newBrandImage: null,
          ));
        },
      );
    },
      );
    });
  }
}
