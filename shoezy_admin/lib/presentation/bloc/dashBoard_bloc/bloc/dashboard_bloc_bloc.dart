// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_bloc_event.dart';
part 'dashboard_bloc_state.dart';
part 'dashboard_bloc_bloc.freezed.dart';

class DashboardBlocBloc extends Bloc<DashboardBlocEvent, DashboardBlocState> {
  DashboardBlocBloc() : super(_Initial()) {
    on<LoadDashboardData>((event, emit) {
      final salesPot = [FlSpot(0, 10), FlSpot(1, 20), FlSpot(2, 30)];
      final profitSpots = [FlSpot(0, 5), FlSpot(1, 15), FlSpot(2, 25)];
      final selectedMonth = 'January';

      emit(
        DashboardBlocState.loadDashboardData(
          salesSpots: salesPot,
          profitSpots: profitSpots,
          selectedMonth: selectedMonth,
        ),
      );
    });
    on<MonthChanged>((event, emit) {
      if (state is _LoadDashboardData) {
        final currentState = state as _LoadDashboardData;
        emit(
          DashboardBlocState.loadDashboardData(
            salesSpots: currentState.salesSpots,
            profitSpots: currentState.profitSpots,
            selectedMonth: event.selectedMonth,
          ),
        );
      }
    });
  }
}
