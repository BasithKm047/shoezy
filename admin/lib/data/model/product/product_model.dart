import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy_admin/data/model/brand/brand_model.dart';
import 'package:shoezy_admin/data/model/categoryModel/category_model.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    String? id,
    required String productName,
     required String brandId,
     required String categoryId,
    required String price,
    required String description,
    required List<Variantsmodel> variants,
    required List<String> stock,
    required List<String> images,

  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}