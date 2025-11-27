import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/productFilter/cubit/product_filter_state.dart';
import 'package:shoezy/utils/const/filtering_finctions.dart';

class ProductFilterCubit extends Cubit<ProductFilterState> {
  ProductFilterCubit({
    List<String>? initialSizes,
    List<String>? initialColors,
    String? initialGender,
    String? initialBrand,
    String? titleFilter,
    bool? priceFeildEnabled,
    List<String>? selectedPriceRanges,
  }) : super(
         ProductFilterState(
           priceFeildEnabled: priceFeildEnabled ?? false,
           selectedPriceRanges: selectedPriceRanges ?? const [],
           titleFilter: titleFilter ?? '',
           selectedSizes: initialSizes ?? [],
           selectedColors: initialColors ?? [],
           selectedGender: initialGender,
           selectedBrand: initialBrand,
           sourceProducts: const [],
           filteredProducts: const [],
           allSizes: const [],
           allBrands: const [],
           allGenders: const [],
           defaultProducts: const [],
         ),
       );

  void setSourceProducts(
    List<ProductModel> catalog, {
    List<ProductModel>? initialVisible,
    String? titleFilter,
  }) {
    final uniqueSizes = _extractUniqueSizes(catalog);
    final uniqueBrands = _extractUniqueBrands(catalog);
    final uniqueGenders = _extractUniqueGenders(catalog);

    final titleScoped = applyTitleFilter(catalog, titleFilter);
    late final List<ProductModel> defaultList;
    if (initialVisible != null && initialVisible.isNotEmpty) {
      defaultList = initialVisible;
    } else if (titleFilter != null && titleFilter.trim().isNotEmpty) {
      // search mode – can be empty
      defaultList = titleScoped; // ← may be []
    } else {
      // no search – full catalog
      defaultList = catalog;
    }

    emit(
      state.copyWith(
        sourceProducts: catalog,
        defaultProducts: defaultList,
        allSizes: uniqueSizes,
        allBrands: uniqueBrands,
        allGenders: uniqueGenders,
        titleFilter: titleFilter,
      ),
    );
    recomputeFiltered();
  }

  void toggleSize(String size) {
    final current = List<String>.from(state.selectedSizes);
    if (current.contains(size)) {
      current.remove(size);
    } else {
      current.add(size);
    }
    emit(state.copyWith(selectedSizes: current));
    recomputeFiltered();
  }

  String _normalizeToken(String raw) {
    var s = raw.trim();
    if (s.startsWith('[') && s.endsWith(']')) {
      s = s.substring(1, s.length - 1).trim();
    }
    if ((s.startsWith("'") && s.endsWith("'")) ||
        (s.startsWith('"') && s.endsWith('"'))) {
      s = s.substring(1, s.length - 1).trim();
    }
    return s;
  }

  void toggleColor(String color) {
    final current = List<String>.from(state.selectedColors);
    if (current.contains(color)) {
      current.remove(color);
    } else {
      current.add(color);
    }
    emit(state.copyWith(selectedColors: current));
    recomputeFiltered();
  }

  void selectGender(String gender) {
    final norm = _normalizeToken(gender);
    final current = state.selectedGender;
    if (current != null && current.toLowerCase() == norm.toLowerCase()) {
      emit(state.copyWith(selectedGender: null));
    } else {
      emit(state.copyWith(selectedGender: norm));
    }
    recomputeFiltered();
  }

  void selectBrand(String? brand) {
    final norm = brand != null ? _normalizeToken(brand) : null;
    final current = state.selectedBrand;
    if (current != null && current.toLowerCase() == norm?.toLowerCase()) {
      emit(state.copyWith(selectedBrand: null));
    } else {
      emit(state.copyWith(selectedBrand: norm));
    }
    recomputeFiltered();
  }

  void resetFilters() {
    emit(
      state.copyWith(
        selectedSizes: [],
        selectedColors: [],
        selectedGender: null,
        selectedBrand: null,
        filteredProducts: state.defaultProducts,
        priceFeildEnabled: false,
        selectedPriceRanges: const [],
      ),
    );
  }

  void togglePriceFilterEnabled(bool value) {
    emit(state.copyWith(priceFeildEnabled: value));
    recomputeFiltered();
  }

  void togglePriceRange(String id) {
    final current = List<String>.from(state.selectedPriceRanges );
    if (current.contains(id)) {
      current.remove(id);
    } else {
      current.add(id);
    }
    emit(state.copyWith(selectedPriceRanges: current));
    recomputeFiltered();
  }

  /// Internal: recompute filteredProducts from current selections
  void recomputeFiltered() {
    final products = state.defaultProducts;
    final sizesSel = state.selectedSizes.map((s) => s.toString()).toSet();
    final colorsSel = state.selectedColors.map((s) => s.toLowerCase()).toSet();
    final brandSel = state.selectedBrand?.toLowerCase();
    final genderSel = state.selectedGender?.toLowerCase();
    final priceEnabled = state.priceFeildEnabled;
    final selectedPriceIds = state.selectedPriceRanges.toSet();
    final priceRanges = ProductFilterState.priceRange;

    final filtered = products.where((p) {
      // Sizes: require at least one selected size to be present in product
      if (sizesSel.isNotEmpty) {
        final prodSizes = p.size.map((s) => s.toString()).toSet();
        if (!sizesSel.any((sel) => prodSizes.contains(sel))) return false;
      }

      // Colors: product colors normalized to tokens
      if (colorsSel.isNotEmpty) {
        final prodColors = _productColorTokens(
          p,
        ).map((c) => c.toLowerCase()).toSet();
        if (!colorsSel.any((sel) => prodColors.contains(sel))) return false;
      }

      // Brand
      if (brandSel != null && brandSel.isNotEmpty) {
        final prodBrand = (p.brandName).toString().toLowerCase().trim();
        if (prodBrand != brandSel) return false;
      }

      // Gender
      if (genderSel != null && genderSel.isNotEmpty) {
        final prodGender = (p.gender).toString().toLowerCase().trim();
        if (prodGender != genderSel) return false;
      }
      // Price Ranges
      if (priceEnabled &&
          selectedPriceIds.isNotEmpty) {
        final double price = double.tryParse(p.price.toString()) ?? 0.0;
        
        final match = priceRanges
            .where((r) => selectedPriceIds.contains(r.id))
            .any((r) => r.matches(price));
        if (!match) return false;
      }

      return true;
    }).toList();

    emit(state.copyWith(filteredProducts: filtered));
  }

  // Helper: extract color tokens from a product's color field; supports List or String formats
  List<String> _productColorTokens(ProductModel p) {
    final raw = p.color;
    final out = <String>[];
    for (final item in raw) {
      out.addAll(splitTokens((item).toString()));
    }
    return out.map((s) => s.toLowerCase()).toSet().toList();
  }

  // Unique list builders
  List<String> _extractUniqueSizes(List<ProductModel> products) {
    final s = <String>{};
    for (final p in products) {
      for (final size in p.size) {
        s.add(size.toString());
      }
    }
    final list = s.toList();
    list.sort((a, b) {
      final an = double.tryParse(a);
      final bn = double.tryParse(b);
      if (an != null && bn != null) return an.compareTo(bn);
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
    return list;
  }

  List<String> _extractUniqueBrands(List<ProductModel> products) {
    final s = <String>{};
    for (final p in products) {
      s.add(p.brandName.toString());
    }
    final list = s.toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return list;
  }

  List<String> _extractUniqueGenders(List<ProductModel> products) {
    final s = <String>{};
    for (final p in products) {
      s.add(p.gender.toString());
    }
    final list = s.toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return list;
  }

  List<ProductModel> applyTitleFilter(
    List<ProductModel> products,
    String? titleFilter,
  ) {
    if (titleFilter == null || titleFilter.trim().isEmpty) return products;
    final lowered = titleFilter.toLowerCase().trim();
    final scoped = products
        .where(
          (p) =>
              p.productName.toString().toLowerCase().contains(lowered) ||
              p.brandName.toString().toLowerCase().contains(lowered) ||
              p.categoryName.toString().toLowerCase().contains(lowered),
        )
        .toList();
    return scoped.isEmpty ? products : scoped;
  }
}
