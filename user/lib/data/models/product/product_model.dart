import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy/data/models/size_stock/size_stock_model.dart';
import 'package:shoezy/data/models/varaint/variant_model.dart';
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
    required List<SizeStockModel> sizeStock,
    required String tag,
    required String gender,
    required DateTime createdAt,
     
  }) = _ProductModel;
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
