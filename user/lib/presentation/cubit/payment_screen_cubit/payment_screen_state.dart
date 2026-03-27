import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy/data/models/user_model.dart';
part 'payment_screen_state.freezed.dart';

@freezed
class PaymentScreenState with _$PaymentScreenState {
  const factory PaymentScreenState.initial() = _Initial;
  const factory PaymentScreenState.loading() = _Loading;
  const factory PaymentScreenState.loaded(UserModel user,{
    @Default(false) bool isSavingPhone,
    String? validationMessage,
  }) = _Loaded;
  const factory PaymentScreenState.error(String message) = _Error;
}
