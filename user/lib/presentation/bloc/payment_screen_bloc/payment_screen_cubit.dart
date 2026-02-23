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
    if (_currentUser == null) return;

    final cleaned=phoneNumber.trim();

     final isValid =
      RegExp(r'^[0-9]{10}$').hasMatch(cleaned);

  
  if (!isValid) {
    emit(
      PaymentScreenState.loaded(
        _currentUser!,
        isSavingPhone: false,
        validationMessage:
            "Phone number must contain exactly 10 digits",
      ),
    );
    return;
  }

        final updatedUser = _currentUser!.copyWith(phoneNumber: cleaned);
        _currentUser = updatedUser;

        emit(
          PaymentScreenState.loaded(
            updatedUser,
            isSavingPhone: true,
         
          ),
        );

        try {
          await _authServices.updatePhoneNumber(cleaned);

          emit(PaymentScreenState.loaded(updatedUser, isSavingPhone: false));
        } catch (e) {
          emit(PaymentScreenState.error(e.toString()));
        }
      }
    void startEditing() {
    state.maybeWhen(
      loaded: (user, _, validationMessage) {
        emit(
          PaymentScreenState.loaded(
            user,
            isSavingPhone: false,
            validationMessage: validationMessage,
          ),
        );
      },
      orElse: () {},
    );
  }
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

  





