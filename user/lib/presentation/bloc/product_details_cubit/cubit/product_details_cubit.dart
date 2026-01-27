import 'package:bloc/bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/product_details_cubit/cubit/product_details_state.dart';
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductModel product;

  ProductDetailsCubit(this.product)
      : super(
          ProductDetailsState(
            selectedColor:
                 product.variants.map((v) => v.color).isNotEmpty
                ? product.variants.map((v) => v.color).first
                : '',
            selectedImage:
                product.variants.map((v) => v.images).expand((i) => i).isNotEmpty
                    ? product.variants
                        .map((v) => v.images)
                        .expand((i) => i)
                        .first
                    : '',
            selectedSize:
                 product.sizeStock.isNotEmpty
                ? product.sizeStock.first.toString()  : '',
          ),
        );

  void selectColor(String color) {
    if (product.variants.isEmpty || product.variants.first.images.isEmpty) return;

    final index = product.variants.map((v) => v.color).toList().indexOf(color);

    emit(
      state.copyWith(
        selectedColor: color,
        selectedImage: index >= 0 && index < product.variants.first.images.length
            ? product.variants.first.images[index]
            : product.variants.first.images.first,
      ),
    );
  }

  void selectSize(String size) {
    emit(state.copyWith(selectedSize: size));
  }
}

