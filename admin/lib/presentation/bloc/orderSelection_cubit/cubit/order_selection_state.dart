part of 'order_selection_cubit.dart';

@immutable
sealed class OrderSelectionState {}

final class OrderSelectionInitial extends OrderSelectionState {}

final class OrderSelectionUpdated extends OrderSelectionState{
  final Orderselection orderselection;
  final DateTime ? selectedDate;

   OrderSelectionUpdated({required this.orderselection, required this.selectedDate});
}
