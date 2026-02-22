import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy/data/auth/auth_services.dart';
import 'package:shoezy/data/models/user_model.dart';
import 'package:shoezy/presentation/bloc/payment_screen_bloc/payment_screen_state.dart';

class PaymentScreenCubit extends Cubit<PaymentScreenState> {
  final AuthServices _authServices;
  final Logger _logger = Logger();
  UserModel? _currentUser;

  PaymentScreenCubit(this._authServices)
    : super(const PaymentScreenState.initial());

  Future<void> updatePhoneNumber(String phoneNumber) async {
    emit(PaymentScreenState.loading());
    _logger.i("Attempting to update phone number: $phoneNumber");
    try {
      await _authServices.updatePhoneNumber(phoneNumber);
      _logger.i("Phone number updated successfully");
      // Fetch latest after update
      _currentUser = await _authServices.getUser();
      emit(PaymentScreenState.loaded(_currentUser!));
    } catch (e) {
      _logger.e("Error updating phone number: $e");
      emit(PaymentScreenState.error(e.toString()));
    }
  }

  // Future<void> updateEmail(String email,String password) async {
  //   _logger.i("Attempting to update email: $email");
  //   emit(PaymentScreenState.loading());
  //   try {
  //     await _authServices.updateEmail(newEmail: email, password: password);
  //     _logger.i("Email updated successfully");
  //     // Fetch latest after update
  //     _currentUser = await _authServices.getUser();
  //     emit(PaymentScreenState.loaded(_currentUser!));
  //   } catch (e) {
  //     _logger.e("Error updating email: $e");
  //     emit(PaymentScreenState.error(e.toString(),));
  //   }
  // }

  Future<void> getUser() async {
    _logger.i("Fetching user data");
    emit(PaymentScreenState.loading());
    try {
      _currentUser = await _authServices.getUser();
      emit(PaymentScreenState.loaded(_currentUser!));
      _logger.i("User data fetched successfully: ${_currentUser?.email}");
    } catch (e) {
      emit(PaymentScreenState.error(e.toString()));
      _logger.e("Error fetching user data: $e");
    }
   
  }
}
