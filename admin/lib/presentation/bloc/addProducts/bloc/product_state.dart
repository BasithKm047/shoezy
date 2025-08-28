part of 'product_bloc.dart';

@freezed
 class ProductState with _$ProductState{
  const factory ProductState.inintial()=_Initial;
  const factory ProductState.success() = _Success;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.error(String message) = _Error;
  const factory ProductState.loaded({required List<ProductModel> products}) = _Loaded;
  const factory ProductState.imagesUpdated(List<Uint8List> images) = _ImagesUpdated;
  const factory ProductState.imageRemoved(List<Uint8List> images) = _ImageRemoved;
  const factory ProductState.cleared() = _Cleared;

}

