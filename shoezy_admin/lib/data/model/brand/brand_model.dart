import 'package:freezed_annotation/freezed_annotation.dart';
part 'brand_model.freezed.dart';
part 'brand_model.g.dart';

@freezed
abstract class BrandModel with _$BrandModel {
  const factory BrandModel({
    String? id,
    required String name,
    required String? imageUrl,
    String? logoImage,
  }) = _BrandModel;
  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}
