// lib/presentation/widgets/product_filter_modal.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';
import 'package:shoezy/presentation/bloc/productFilter/cubit/product_filter_cubit.dart';
import 'package:shoezy/presentation/bloc/productFilter/cubit/product_filter_state.dart';
import 'package:shoezy/utils/const/colors.dart';

const List<String> predefinedColorOptions = [
  'Black',
  'Brown',
  'Blue',
  'Red',
  'Green',
  'Yellow',
  'White',
  'Grey',
  'Orange',
];

/// --- Helper functions (shared by modal and body) --- //

String _cleanToken(String raw) {
  var s = raw.trim();
  // remove surrounding brackets like [ ... ]
  if (s.startsWith('[') && s.endsWith(']')) {
    s = s.substring(1, s.length - 1).trim();
  }
  // remove surrounding single/double quotes
  if ((s.startsWith("'") && s.endsWith("'")) ||
      (s.startsWith('"') && s.endsWith('"'))) {
    s = s.substring(1, s.length - 1).trim();
  }
  // final trim
  return s.trim();
}

class ProductFilterModal extends StatelessWidget {
  const ProductFilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFilterCubit, ProductFilterState>(
      builder: (context, state) {
        return ProductFilterModalBody(state: state);
      },
    );
  }
}

class ProductFilterModalBody extends StatelessWidget {
  final ProductFilterState state;

  const ProductFilterModalBody({super.key, required this.state});

  Color _colorFromName(String name) {
    final n = name.toLowerCase();
    const map = {
      'black': Colors.black,
      'brown': Colors.brown,
      'blue': Colors.blue,
      'red': Colors.red,
      'green': Colors.green,
      'yellow': Colors.yellow,
      'white': Colors.white,
      'grey': Colors.grey,
      'gray': Colors.grey,
      'orange': Colors.orange,
    };
    for (final entry in map.entries) {
      if (n.contains(entry.key)) {
        return entry.value;
      }
    }
    return Colors.grey;
  }

  Widget _styledFilterChip({
    required String label,
    required bool selected,
    required VoidCallback onTap,
    Widget? leading,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.blue : Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: selected ? AppColors.blue : Colors.grey.shade300,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.blue.withOpacity(0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[leading, const SizedBox(width: 8)],
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorDot(String name, {double size = 12}) {
    final color = _colorFromName(name);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
      ),
    );
  }

  // // create normalized lists for rendering
  // List<String> get _sizesNormalized => _normalizeAndDedupe(allSizes, numericSort: true);
  // List<String> get _colorsNormalized => predefinedColorOptions;
  // List<String> get _brandsNormalized => _normalizeAndDedupe(allBrands);
  // List<String> get _gendersNormalized => _normalizeAndDedupe(allGenders);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductFilterCubit>();
    final priceRanges = ProductFilterState.priceRange;
    final priceEnabled = state.priceFeildEnabled;
    final selectedPriceIds = state.selectedPriceRanges;
    
    return DraggableScrollableSheet(
      initialChildSize: 0.78,
      minChildSize: 0.45,
      maxChildSize: 0.95,
      builder: (ctx, scrollCtrl) {
        final sizes = state.allSizes;
        final colors = predefinedColorOptions;
        final brands = state.allBrands;
        final genders = state.allGenders;
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
          ),
          child: SingleChildScrollView(
            controller: scrollCtrl,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 4,
                        margin: const EdgeInsets.only(top: 8, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'Filter by',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                cubit.resetFilters();
                              },
                              child: Text(
                                'RESET',
                                style: TextStyle(color: AppColors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Gender',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: genders.map((g) {
                      final label = _cleanToken(g);
                      final sel =
                          state.selectedGender?.toLowerCase() ==
                          label.toLowerCase();
                      return _styledFilterChip(
                        label: label,
                        selected: sel,
                        onTap: () {
                          Logger().w(state.selectedGender);
                          Logger().w('Selected gender: $label');
                          cubit.selectGender(label);
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Size',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 48,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (_, i) {
                        final s = _cleanToken(sizes[i]);
                        final sel = state.selectedSizes.contains(s);
                        return _styledFilterChip(
                          label: s,
                          selected: sel,
                          onTap: () {
                            Logger().w(state.selectedSizes);
                            Logger().w('Toggled size: $s');
                            cubit.toggleSize(s);
                            Logger().w(
                              'Unselected sizes: ${state.selectedSizes}',
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Color',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 48,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (_, i) {
                        final raw = colors[i];
                        final label = _cleanToken(raw);
                        final sel = state.selectedColors.contains(label);
                        return _styledFilterChip(
                          label: label,
                          selected: sel,
                          leading: _colorDot(label),
                          onTap: () => cubit.toggleColor(label),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Brand',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 44,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: brands.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (_, i) {
                        final b = _cleanToken(brands[i]);
                        final sel =
                            state.selectedBrand?.toLowerCase() ==
                            b.toLowerCase();
                        return _styledFilterChip(
                          label: b,
                          selected: sel,
                          onTap: () {
                            Logger().w(state.selectedBrand);
                            Logger().w('Selected brand: $b');
                            cubit.selectBrand(b);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Price',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Enable price filter',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Switch(
                        value: priceEnabled,
                        activeColor: AppColors.blue,
                        onChanged: (val) {
                          cubit.togglePriceFilterEnabled(val);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                 if( priceEnabled)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: priceRanges.length,
                    itemBuilder: (_, i) {
                      final range = priceRanges[i];
                      final isSelected = selectedPriceIds.contains(range.id);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: InkWell(
                          onTap: priceEnabled
                              ? () => cubit.togglePriceRange(range.id)
                              : null,
                          child: Row(
                            children: [
                              Checkbox(
                                value: priceEnabled && isSelected,
                                onChanged: priceEnabled
                                    ? (_) => cubit.togglePriceRange(range.id)
                                    : null,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: AppColors.blue,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  range.label,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        cubit.recomputeFiltered();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
