import 'package:freezed_annotation/freezed_annotation.dart';

part 'userModel.freezed.dart';
part 'userModel.g.dart';

@freezed
abstract class Usermodel with _$Usermodel {
  factory Usermodel({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? profileImage,
    bool? isAdmin,
    DateTime? createdAt,
  }) = _Usermodel;

  factory Usermodel.fromJson(Map<String, dynamic> json) =>
      _$UsermodelFromJson(json);
}
