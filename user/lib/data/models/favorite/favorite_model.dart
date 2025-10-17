import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy/data/models/product/product_model.dart';
part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

@freezed
abstract class FavoriteModel with _$FavoriteModel {
  factory FavoriteModel({
      String? userId, 
      required ProductModel product,
       bool? isFavorite,
      DateTime? createdAt,
      
      }) =_FavoriteModel;
  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
}
