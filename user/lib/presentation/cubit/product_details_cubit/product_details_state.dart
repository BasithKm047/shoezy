import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy/data/models/product/product_model.dart';

part 'product_details_state.freezed.dart';

@freezed
abstract class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    required ProductModel product,
    required String selectedColor,
    required String selectedImage,
    required String selectedSize,
    String ? userId,
    String ? productId,
  }) = _ProductDetailsState;
  }
