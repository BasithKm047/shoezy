import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
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
    required List<Map<String, dynamic>> variants,
    // required List<String> images,
  //  @Default('') String colorCode, // Optional field
  //   @Default('') String colorName, // Optional field
  //   @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    required DateTime createdAt,

  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
DateTime _dateTimeFromJson(Timestamp timestamp) => timestamp.toDate();
Timestamp _dateTimeToJson(DateTime dateTime) => Timestamp.fromDate(dateTime);