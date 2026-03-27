part of 'product_bloc.dart';

@freezed
abstract class ProductEvent with _$ProductEvent {
  const factory ProductEvent.loadProducts() = _LoadProducts;
  const factory ProductEvent.searchProducts(String query) = _SearchProducts;
  const factory ProductEvent.filterProducts(String category) = _FilterProducts;
  const factory ProductEvent.sortProducts(String sortBy) = _SortProducts;
  const factory ProductEvent.loadMoreProducts() = _LoadMoreProducts;
  const factory ProductEvent.refreshProducts() = _RefreshProducts;

}

