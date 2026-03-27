part of 'dashboard_bloc_bloc.dart';

@freezed
class DashboardBlocState with _$DashboardBlocState {
  const factory DashboardBlocState.initial() = _Initial;
  const factory DashboardBlocState.loading() = _Loading;
  const factory DashboardBlocState.loadDashboardData({
    required List<FlSpot> salesSpots,
    required List<FlSpot> profitSpots,
    required String selectedMonth,
  }) = _LoadDashboardData;
const factory DashboardBlocState.error(String message) = _Error;

  
  
}
