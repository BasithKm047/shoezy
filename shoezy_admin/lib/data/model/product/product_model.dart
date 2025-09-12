import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loginpage/data/model/vareintModel/varientsModel.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    String? id,
    required String productName,
     required String brandName,
     required String categoryName,
    required String price,
    required String description,
    required List<Variantsmodel> variants,
    required List<String> images,
    required String colorName,
    required String colorCode

  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}