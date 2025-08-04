part of 'add_product_bloc_bloc.dart';

@freezed
class AddProductBlocEvent with _$AddProductBlocEvent {
  const factory AddProductBlocEvent.brandChanged(String brand) = _BrandChanged;

  const factory AddProductBlocEvent.categorySelected(String category) =
      _CategorySelected;

  const factory AddProductBlocEvent.sizeSelected(String size, bool selected) =
      _SizeSelected;

  const factory AddProductBlocEvent.stockUpdated(String size, String stock) =
      _StockUpdated;

  const factory AddProductBlocEvent.imageAdded(Uint8List image) =
      _ImageAdded;

  const factory AddProductBlocEvent.imageRemoved(int index) = _ImageRemoved;

  const factory AddProductBlocEvent.colorChanged(String color) = _ColorChanged;

  const factory AddProductBlocEvent.nameChanged(String name) = _NameChanged;

  const factory AddProductBlocEvent.descriptionChanged(String description) =
      _DescriptionChanged;

  const factory AddProductBlocEvent.priceChanged(String price) = _PriceChanged;

  const factory AddProductBlocEvent.submit() = _Submit;
  const factory AddProductBlocEvent.reset() = _Reset;
  const factory AddProductBlocEvent.imagesUpdated(List<Uint8List> images) = _ImagesUpdated;
}
