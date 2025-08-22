import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {

  factory CategoryModel({
    required List<String> name,
    required String type,
    required String id,
  }) = _CategoryModel;
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
  enum Types{gender,color,size}