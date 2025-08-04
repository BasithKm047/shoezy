import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoezy_admin/data/model/orderSelection.dart';

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
