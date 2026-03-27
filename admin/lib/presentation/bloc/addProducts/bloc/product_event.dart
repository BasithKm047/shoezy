part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.addProduct(ProductModel products) = _AddProduct;
  const factory ProductEvent.removeProduct() = _RemoveProduct;
  const factory ProductEvent.updateProduct() = _UpdateProduct;
  const factory ProductEvent.uploadImage(List<Uint8List> images) = _UploadImage;
  const factory ProductEvent.removeImage(int index) = _RemoveImage;
  
  

}

