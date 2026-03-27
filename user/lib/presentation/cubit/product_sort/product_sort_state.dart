// lib/presentation/bloc/productSort/product_sort_state.dart
import 'package:equatable/equatable.dart';

// NEW: all supported sort options
enum SortOption {
  relevance,
  popularity,
  priceLowToHigh,
  priceHighToLow,
  newestFirst,
  discount,
}

class ProductSortState extends Equatable {
  final SortOption selected;

  const ProductSortState({
    required this.selected,
  });

  ProductSortState copyWith({
    SortOption? selected,
  }) {
    return ProductSortState(
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [selected];
}
