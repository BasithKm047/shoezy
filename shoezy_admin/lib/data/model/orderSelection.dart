class Orderselection {
  final String selectedOrderType;
  final String selectedorderStatus;

  Orderselection({
    required this.selectedOrderType,
    required this.selectedorderStatus,
  });

  Orderselection copyWith({
    String? selectedOrderType,
    String? selectedorderStatus,
  }) {
    return Orderselection(
      selectedOrderType: selectedOrderType ?? this.selectedOrderType,
      selectedorderStatus: selectedorderStatus ??  this.selectedorderStatus,
    );
  }
}
