part of 'brand_bloc.dart';

@freezed
sealed class BrandState with _$BrandState {
  const factory BrandState.initial() = BrandInitial;
  const factory BrandState.loading() = BrandLoading;
  const factory BrandState.success() = BrandSuccess;
  const factory BrandState.loaded({
    required List<BrandModel> brands,
    String? selectedBrand,
  }) = BrandLoaded;
  const factory BrandState.error(String message) = BrandError;
  const factory BrandState.imagesUpdated({
    Uint8List? logoImage,
    Uint8List? brandImage,
  }) = ImagesUpdatedState;
  const factory BrandState.imageClearedState() = ImageClearedState;
  const factory BrandState.removedImageState() = RemovedImageState;
  const factory BrandState.editing({
  required BrandModel brand,
  Uint8List? newLogoImage,
  Uint8List? newBrandImage,
}) = BrandEditingState;

}
