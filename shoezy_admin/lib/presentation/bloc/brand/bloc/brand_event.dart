part of 'brand_bloc.dart';

@freezed
sealed class BrandEvent with _$BrandEvent {
  const factory BrandEvent.addBrand(BrandModel brands) = AddBrand;
  const factory BrandEvent.updateBrand(BrandModel brands) = UpdateBrand;
  const factory BrandEvent.deleteBrand(String id) = DeleteBrand;
  const factory BrandEvent.fetchBrands() = FetchBrands;
  const factory BrandEvent.imageUploaded(Uint8List imageBytes) = ImageUploaded;
  const factory BrandEvent.clearImage() = ClearImage;
  const factory BrandEvent.removedImage() = RemovedImage;
  const factory BrandEvent.selectedBrand(String ? brandName) = SelectedBrand;
  const factory BrandEvent.clearSelection() = ClearSelection;
  const factory BrandEvent.searchBrands(String query)= SearchBrands;

}
