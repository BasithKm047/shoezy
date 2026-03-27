// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitial());

  void selectGender(String gender) {
    emit(GenderSelected(gender));
    // Logger().i('Selected Gender: $gender');
  }

  void clearGender() {
    emit(GenderInitial());
    // Logger().i('Gender Cleared');
  }
}
