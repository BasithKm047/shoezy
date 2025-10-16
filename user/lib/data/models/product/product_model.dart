
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel{
 const factory ProductModel({
  String ?id,
  required String productName,
  required String brandName,
  required String categoryName,
  required String price,
  required String description,
  required List<String> color,
  required List<String>size,
  required List<String>image,
  required List<String>stock,
  required String tag,
  required String gender,
  required DateTime createdAt,
 })=_ProductModel;
 factory ProductModel.fromJson(Map<String,dynamic>json)=>_$ProductModelFromJson(json);
}
 
