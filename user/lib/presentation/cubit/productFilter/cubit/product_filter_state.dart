import 'package:equatable/equatable.dart';
import 'package:shoezy/data/models/product/product_model.dart';

class ProductFilterState extends Equatable {
 
  final List<String> selectedSizes;
  final List<String> selectedColors;
  final String? selectedGender;
  final String? selectedBrand;
  final List<ProductModel> sourceProducts;
  final List<ProductModel> filteredProducts;
  final List<ProductModel> defaultProducts;
  final List<String> allSizes;
  final List<String> allBrands;
  final List<String> allGenders;
  final String titleFilter;
  final bool priceFeildEnabled;
  final List<String> selectedPriceRanges;
  const ProductFilterState({
    required this.selectedSizes,
    required this.selectedColors,
    required this.selectedGender,
    required this.selectedBrand,
    required this.sourceProducts,
    required this.filteredProducts,
    required this.defaultProducts,
    required this.allSizes,
    required this.allBrands,
    required this.allGenders,
    required  this.titleFilter,
    required this.priceFeildEnabled,
    required this.selectedPriceRanges,
    
  });
   static const List<PriceRange> priceRange = [
    PriceRange(id: '0-600', label: 'Rs. 600 and below', min: 0, max: 600),
    PriceRange(
      id: '601-1000',
      label: 'Rs. 601 to Rs. 1000',
      min: 601,
      max: 1000,
    ),

    PriceRange(
      id: '1001-1500',
      label: 'Rs. 1001 to Rs. 1500',
      min: 1001,
      max: 1500,
    ),
    PriceRange(
      id: '1501-2000',
      label: 'Rs. 1501 to Rs. 2000',
      min: 1501,
      max: 2000,
    ),
    PriceRange(
      id: '2001-2500',
      label: 'Rs. 2001 to Rs. 2500',
      min: 2001,
      max: 2500,
    ),
    PriceRange(
      id: '2501-3000',
      label: 'Rs. 2501 to Rs. 3000',
      min: 2501,
      max: 3000,
    ),
    PriceRange(
      id: '3001-3500',
      label: 'Rs. 3001 to Rs. 3500  ',
      min: 3001,
      max: 3500,
    ),
    PriceRange(
      id: '3501-4000',
      label: 'Rs. 3501 to Rs. 4000',
      min: 3501,
      max: 4000,
    ),
    PriceRange(
      id: '4001-5000',
      label: 'Rs. 4001 to Rs. 5000',
      min: 4001,
      max: 5000,
    ),
    PriceRange(id: '5001+', label: 'Rs. 5001 and above', min: 5001, max: null),
  ];

  static const sentinel = Object();

  ProductFilterState copyWith({
    List<String>? selectedSizes,
    List<String>? selectedColors,
    Object? selectedGender = sentinel,
    Object? selectedBrand = sentinel,
    String? titleFilter,
    List<ProductModel>? sourceProducts,
    List<ProductModel>? defaultProducts,
    List<ProductModel>? filteredProducts,
    List<String>? allSizes,
    List<String>? allBrands,
    List<String>? allGenders,
    bool? priceFeildEnabled,
    List<String>? selectedPriceRanges,

  }) {
    return ProductFilterState(
      selectedSizes: selectedSizes ?? this.selectedSizes,
      selectedColors: selectedColors ?? this.selectedColors,
      selectedGender: identical(selectedGender, sentinel)
          ? this.selectedGender
          : selectedGender as String?,
      selectedBrand: identical(selectedBrand, sentinel)
          ? this.selectedBrand
          : selectedBrand as String?,
      titleFilter: titleFilter ?? this.titleFilter,
      sourceProducts: sourceProducts ?? this.sourceProducts,
      defaultProducts: defaultProducts ?? this.defaultProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      allSizes: allSizes ?? this.allSizes,
      allBrands: allBrands ?? this.allBrands,
      allGenders: allGenders ?? this.allGenders,
      priceFeildEnabled: priceFeildEnabled ?? this.priceFeildEnabled,
      selectedPriceRanges: selectedPriceRanges ?? this.selectedPriceRanges,
     
    );
  }

  /// Convenience: return a simple map (same structure modal expects)
  Map<String, dynamic> toMap() {
    return {
      'sizes': selectedSizes,
      'colors': selectedColors,
      'gender': selectedGender,
      'brand': selectedBrand,
      'selectedPriceRanges': selectedPriceRanges,
      'priceFeildEnabled': priceFeildEnabled,
    };
  }

  bool get hasActiveFilters {
    return selectedSizes.isNotEmpty ||
        selectedColors.isNotEmpty ||
        selectedGender != null ||
        selectedBrand != null ||
        (priceFeildEnabled && selectedPriceRanges.isNotEmpty);
  }

  @override
  List<Object?> get props => [
    selectedSizes,
    selectedColors,
    selectedGender,
    selectedBrand,
    sourceProducts,
    filteredProducts,
    defaultProducts,
    allSizes,
    allBrands,
    allGenders,
    titleFilter,

    priceFeildEnabled,
    selectedPriceRanges,
  ];
}

class PriceRange {
  final String id;
  final String label;
  final double min;
  final double? max;

  const PriceRange({
    required this.id,
    required this.label,
    required this.min,
    this.max,
  });

  bool matches(double price) {
    if (price < min) return false;
    if (max != null && price > max!) return false;
    return true;
  }
}
