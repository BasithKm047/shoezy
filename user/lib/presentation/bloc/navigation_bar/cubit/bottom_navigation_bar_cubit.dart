import 'package:bloc/bloc.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit()
    : super(BottomNavigationBarState(seleCtedIndex: 0));

  void changeIndex(int newIndex) {
    emit(BottomNavigationBarState(seleCtedIndex: newIndex));
  }

  int get currentIndex => state.index;
}
