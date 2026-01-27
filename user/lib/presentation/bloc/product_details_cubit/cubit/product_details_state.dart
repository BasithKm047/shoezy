import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_state.freezed.dart';

@freezed
abstract class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    required String selectedColor,
    required String selectedImage,
    String? selectedSize, // optional, future-proof
  }) = _ProductDetailsState;
}
