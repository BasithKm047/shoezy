import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductFilterState extends Equatable {
  final List<String> selectedSizes;
  final List<String> selectedColors;
  final String? selectedGender;
  final String? selectedBrand;
  // final RangeValues priceRange;

  const ProductFilterState({
    this.selectedSizes = const [],
    this.selectedColors = const [],
    this.selectedGender,
    this.selectedBrand,
    // required this.priceRange,
  });

  ProductFilterState copyWith({
    List<String>? selectedSizes,
    List<String>? selectedColors,
    String? selectedGender,
    String? selectedBrand,
    RangeValues? priceRange,
  }) {
    return ProductFilterState(
      selectedSizes: selectedSizes ?? this.selectedSizes,
      selectedColors: selectedColors ?? this.selectedColors,
      selectedGender: selectedGender == null && selectedGender != this.selectedGender
          ? null
          : selectedGender ?? this.selectedGender,
      selectedBrand: selectedBrand == null && selectedBrand != this.selectedBrand
          ? null
          : selectedBrand ?? this.selectedBrand,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sizes': selectedSizes,
      'colors': selectedColors,
      'gender': selectedGender,
      'brand': selectedBrand,
      // 'priceMin': priceRange.start,
      // 'priceMax': priceRange.end,
    };
  }

  @override
  List<Object?> get props => [selectedSizes, selectedColors, selectedGender, selectedBrand, ];
}
