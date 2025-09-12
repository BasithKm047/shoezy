import 'package:bloc/bloc.dart';
import 'package:loginpage/data/model/orderSelection.dart';
import 'package:meta/meta.dart';

part 'order_selection_state.dart';

class OrderSelectionCubit extends Cubit<OrderSelectionState> {
  OrderSelectionCubit()
    : super(
        OrderSelectionUpdated(
          orderselection: Orderselection(
            selectedOrderType: '',
            selectedorderStatus: '',
          ),
          selectedDate: null,
        ),
      );

  void selectedOrederStatus(String value) {
    final current = state as OrderSelectionUpdated;
    emit(
      OrderSelectionUpdated(
        orderselection: current.orderselection.copyWith(
          selectedorderStatus: value,
        ),
        selectedDate: current.selectedDate,
      ),
    );
  }

  void selectOrderType(String value) {
    final current = state as OrderSelectionUpdated;
    emit(
      OrderSelectionUpdated(
        orderselection: current.orderselection.copyWith(
          selectedOrderType: value,
        ),
        selectedDate: current.selectedDate,
      ),
    );
  }

  void selectedDate(DateTime date) {
    final current = state as OrderSelectionUpdated;
    emit(
      OrderSelectionUpdated(
        orderselection: current.orderselection,
        selectedDate: date,
      ),
    );
  }

  void resetSelection() {
    emit(
      OrderSelectionUpdated(
        orderselection: Orderselection(
          selectedOrderType: '',
          selectedorderStatus: '',
        ),
        selectedDate: null,
      ),
    );
  }
}
