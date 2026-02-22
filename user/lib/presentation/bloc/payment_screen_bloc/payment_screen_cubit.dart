import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy/data/auth/auth_services.dart';
import 'package:shoezy/presentation/bloc/payment_screen_bloc/payment_screen_state.dart';

class PaymentScreenCubit extends Cubit<PaymentScreenState> {
  final AuthServices _authServices;
  PaymentScreenCubit(this._authServices)
    : super(const PaymentScreenState.initial());

  Future<void> updatePhoneNumber(String phoneNumber) async {
    emit(const PaymentScreenState.loading());
    try {
      await _authServices.updatePhoneNumber(phoneNumber: phoneNumber);
      emit(const PaymentScreenState.success());
    } catch (e) {
      Logger().e("Error updating phone number: $e");
      emit(PaymentScreenState.error(e.toString()));
    }
  }
}
