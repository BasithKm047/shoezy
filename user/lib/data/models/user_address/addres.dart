import 'package:freezed_annotation/freezed_annotation.dart';
part 'addres.freezed.dart';
part 'addres.g.dart';

@freezed
sealed class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String latitude,
    required String longitude,
    required String addressLine,
    required String pincode,
  }) = _AddressModel;
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
