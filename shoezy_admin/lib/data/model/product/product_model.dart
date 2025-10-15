import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy_admin/data/model/size_stock_model.dart/size_stock_model.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
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
