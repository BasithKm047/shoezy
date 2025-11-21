import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'product_filter_state.dart';

class ProductFilterCubit extends Cubit<ProductFilterState> {
  ProductFilterCubit({
    List<String>? initialSizes,
    List<String>? initialColors,
    String? initialGender,
    String? initialBrand,
    // required RangeValues initialPriceRange,
  }) : super(ProductFilterState(
          selectedSizes: initialSizes ?? [],
          selectedColors: initialColors ?? [],
          selectedGender: initialGender,
          selectedBrand: initialBrand,
          // priceRange: initialPriceRange,
        ));

  void toggleSize(String size) {
    final current = List<String>.from(state.selectedSizes);
    if (current.contains(size)) {
      current.remove(size);
    } else {
      current.add(size);
    }
    emit(state.copyWith(selectedSizes: current));
  }

  void toggleColor(String color) {
    final current = List<String>.from(state.selectedColors);
    if (current.contains(color)) {
      current.remove(color);
    } else {
      current.add(color);
    }
    emit(state.copyWith(selectedColors: current));
  }

  void selectGender(String? gender) {
    // toggle off when same selected
    final newGender = state.selectedGender == gender ? null : gender;
    emit(state.copyWith(selectedGender: newGender));
  }

  void selectBrand(String? brand) {
    final newBrand = state.selectedBrand == brand ? null : brand;
    emit(state.copyWith(selectedBrand: newBrand));
  }

  void updatePrice(RangeValues range) {
    emit(state.copyWith(priceRange: range));
  }

  // void reset(RangeValues defaultRange) {
  //   emit(const ProductFilterState()
  //       .copyWith(selectedSizes: [], selectedColors: [], selectedGender: null, selectedBrand: null, priceRange: defaultRange));
  // }
}
