part of 'dashboard_bloc_bloc.dart';

@freezed
class DashboardBlocEvent with _$DashboardBlocEvent {
  const factory DashboardBlocEvent.loadDashboardData() = LoadDashboardData;
  const factory DashboardBlocEvent.monthChanged(String selectedMonth) = MonthChanged;




}