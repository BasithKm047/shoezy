// lib/presentation/bloc/productSort/product_sort_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_sort_state.dart';

class ProductSortCubit extends Cubit<ProductSortState> {
  ProductSortCubit()
      : super(const ProductSortState(
          selected: SortOption.relevance, // NEW: default
        ));

  void selectOption(SortOption option) {
    emit(state.copyWith(selected: option)); // NEW
  }

  void reset() {
    emit(const ProductSortState(selected: SortOption.relevance)); // NEW
  }
}
