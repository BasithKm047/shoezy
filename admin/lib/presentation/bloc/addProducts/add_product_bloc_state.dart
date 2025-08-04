part of 'add_product_bloc_bloc.dart';

@freezed
abstract class AddProductBlocState with _$AddProductBlocState {
  const factory AddProductBlocState({
    required String productName,
    required List<Uint8List> productImage,
    required String price,
    required String productDescription,
    required Map<String, int?> sizeStockMap,
    required CategoryModel? selectedCategory,
    required Brandmodel? selectedBrand,
    required List<String> selectedSizes,
    required List<String> availableColors,
     required String selectedColor,
    required String productStock,
    required List<CategoryModel> availableCategories,
    required List<Brandmodel> availableBrands,
    required List<String>availableSize,
    required bool isSubmitting,
    required bool isSuccess,
    required String? errorMessage,
  }) = _AddProductBlocState;
}
