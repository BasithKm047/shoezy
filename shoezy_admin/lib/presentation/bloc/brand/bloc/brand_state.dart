part of 'brand_bloc.dart';

@freezed
sealed class BrandState with _$BrandState {
  const factory BrandState.initial() = BrandInitial;
  const factory BrandState.loading() = BrandLoading;
  const factory BrandState.success() = BrandSuccess;
  const factory BrandState.loaded({required List<BrandModel> brands, String? selectedBrand}) = BrandLoaded;
  const factory BrandState.error(String message) = BrandError;
  const factory BrandState.imagesUpdated(List<Uint8List> imageBytes) = ImagesUpdatedState;
  const factory BrandState.imageClearedState() = ImageClearedState;
  const factory BrandState.removedImageState(List<Uint8List> removedImages) = RemovedImageState;
}
