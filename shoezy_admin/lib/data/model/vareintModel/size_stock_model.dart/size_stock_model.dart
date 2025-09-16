
import 'package:freezed_annotation/freezed_annotation.dart';
part 'size_stock_model.freezed.dart';
part 'size_stock_model.g.dart';
@freezed
 abstract class SizeStockModel with _$SizeStockModel{
  factory SizeStockModel({
    required String size,
    required int stock,
  })= _SizeStockModel;
  factory SizeStockModel.fromJson(Map<String, dynamic>json)=>_$SizeStockModelFromJson(json);
 }