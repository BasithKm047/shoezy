import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_screen_state.freezed.dart';
@freezed
class PaymentScreenState with _$PaymentScreenState {
  const factory PaymentScreenState.initial() = _Initial;
  const factory PaymentScreenState.loading() = _Loading;
  const factory PaymentScreenState.success() = _Success;
  const factory PaymentScreenState.error(String message) = _Error;
}