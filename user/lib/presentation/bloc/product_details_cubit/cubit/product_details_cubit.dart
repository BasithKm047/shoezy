import 'package:bloc/bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/product_details_cubit/cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(ProductModel product)
      : super(
          ProductDetailsState(
            product: product,
            selectedColor: product.variants.isNotEmpty
                ? product.variants.first.color
                : '',
            selectedImage: product.variants.isNotEmpty &&
                    product.variants.first.images.isNotEmpty
                ? product.variants.first.images.first
                : '',
            selectedSize: product.sizeStock.isNotEmpty
                ? product.sizeStock.first.size
                : '',
          ),
        );

  void selectColor(String color) {
    final variant = state.product.variants.firstWhere(
      (v) => v.color.toLowerCase().trim() ==
          color.toLowerCase().trim(),
      orElse: () => state.product.variants.first,
    );

    final firstImage =
        variant.images.isNotEmpty ? variant.images.first : '';

    emit(
      state.copyWith(
        selectedColor: variant.color,
        selectedImage: firstImage,
      ),
    );
  }

  void selectImage(String image) {
    emit(state.copyWith(selectedImage: image));
  }

  void selectSize(String size) {
    emit(state.copyWith(selectedSize: size));
  }

 

  
}
