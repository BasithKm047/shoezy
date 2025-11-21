// lib/presentation/widgets/product_filter_modal.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  if ((s.startsWith("'") && s.endsWith("'")) || (s.startsWith('"') && s.endsWith('"'))) {
    s = s.substring(1, s.length - 1).trim();
  }
  // final trim
  return s.trim();
}

/// Split a single raw string into tokens by common separators (comma, semicolon, pipe)
List<String> _extractColorTokensFromString(String raw) {
  final cleaned = _cleanToken(raw);
  if (cleaned.isEmpty) return [];
  final parts = cleaned.split(RegExp(r'\s*[;,|]\s*'));
  return parts.map((p) => _cleanToken(p)).where((p) => p.isNotEmpty).toList();
}

/// Extract tokens from dynamic input that could be:
/// - String: "red,blue" or "['red']"
// ignore: unintended_html_in_doc_comment
/// - List<String>: ['red', 'blue']
// ignore: unintended_html_in_doc_comment
/// - List<dynamic>
/// - null
List<String> _extractTokensFromDynamic(dynamic raw) {
  if (raw == null) return [];
  if (raw is Iterable) {
    final out = <String>[];
    for (final item in raw) {
      final s = (item ?? '').toString();
      out.addAll(_extractColorTokensFromString(s));
    }
    return out;
  }
  // otherwise treat as single string
  return _extractColorTokensFromString(raw.toString());
}

/// Normalize list: clean tokens, dedupe and sort
List<String> _normalizeAndDedupe(List<String> list, {bool numericSort = false}) {
  final cleaned = list.map((s) => _cleanToken(s)).where((s) => s.isNotEmpty).toList();
  if (numericSort) {
    final nums = cleaned.where((s) => double.tryParse(s) != null).toList();
    final nonNums = cleaned.where((s) => double.tryParse(s) == null).toList();
    nums.sort((a, b) => double.parse(a).compareTo(double.parse(b)));
    nonNums.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return {...nums, ...nonNums}.toList(); // preserve dedupe via set literal
  } else {
    final normalized = cleaned.toSet().toList();
    normalized.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return normalized;
  }
}

/// --- Widget --- //

class ProductFilterModal extends StatelessWidget {
  /// Pass the **complete** lists (all sizes, all colors, all brands, all genders)
  /// coming from your products collection (not just the currently visible/available ones).
  final List<String> allSizes;
  // ignore: unused_field
  final List<String> allColors;
  final List<String> allBrands;
  final List<String> allGenders;
  final Map<String, dynamic>? initialFilters;

  const ProductFilterModal({
    super.key,
    required this.allSizes,
    required this.allColors,
    required this.allBrands,
    required this.allGenders,
    this.initialFilters,
  });

  @override
  Widget build(BuildContext context) {
    // Use same extraction + normalization logic for initial filters so UI and cubit align.
    final initialSizes = _normalizeAndDedupe(_extractTokensFromDynamic(initialFilters?['sizes']), numericSort: true);
    final initialColors = _normalizeAndDedupe(_extractTokensFromDynamic(initialFilters?['colors']));
    final initialBrands = _normalizeAndDedupe(_extractTokensFromDynamic(initialFilters?['brand']));
    final initialGenders = _normalizeAndDedupe(_extractTokensFromDynamic(initialFilters?['gender']));

    // choose first value for single-select initial fields
    final initialGender = initialGenders.isNotEmpty ? initialGenders.first : null;
    final initialBrand = initialBrands.isNotEmpty ? initialBrands.first : null;

    return BlocProvider(
      create: (_) => ProductFilterCubit(
        initialSizes: initialSizes,
        initialColors: initialColors,
        initialGender: initialGender,
        initialBrand: initialBrand,
      ),
      child: ProductFilterModalBody(
        allSizes: allSizes,
        allColors: allColors,
        allBrands: allBrands,
        allGenders: allGenders,
      ),
    );
  }
}

class ProductFilterModalBody extends StatelessWidget {
  final List<String> allSizes;
  final List<String> allColors;
  final List<String> allBrands;
  final List<String> allGenders;

  const ProductFilterModalBody({
    super.key,
    required this.allSizes,
    required this.allColors,
    required this.allBrands,
    required this.allGenders,
  });

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
          border: Border.all(color: selected ? AppColors.blue : Colors.grey.shade300),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.blue.withOpacity(0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              leading,
              const SizedBox(width: 8),
            ],
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

  // create normalized lists for rendering
  List<String> get _sizesNormalized => _normalizeAndDedupe(allSizes, numericSort: true);
  List<String> get _colorsNormalized => predefinedColorOptions;
  List<String> get _brandsNormalized => _normalizeAndDedupe(allBrands);
  List<String> get _gendersNormalized => _normalizeAndDedupe(allGenders);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductFilterCubit>();

    final sizes = _sizesNormalized;
    final colors = _colorsNormalized;
    final brands = _brandsNormalized;
    final genders = _gendersNormalized;

    return DraggableScrollableSheet(
      initialChildSize: 0.78,
      minChildSize: 0.45,
      maxChildSize: 0.95,
      builder: (ctx, scrollCtrl) {
        return Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(22))),
          child: SingleChildScrollView(
            controller: scrollCtrl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
              child: BlocBuilder<ProductFilterCubit, ProductFilterState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
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
                                  child: Center(child: Text('Filters', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Reset via cubit (ensure you implement reset() in cubit)
                                    
                                      try {
                                        // cubit.reset();
                                      } catch (_) {}
                                    
                                  },
                                  child: Text('RESET', style: TextStyle(color: AppColors.blue)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // Gender (single select)
                      const Text('Gender', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: genders.map((g) {
                          final label = _cleanToken(g);
                          final sel = state.selectedGender == label;
                          return _styledFilterChip(
                            label: label,
                            selected: sel,
                            onTap: () => cubit.selectGender(label),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),

                      // Size horizontal chips
                      const Text('Size', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
                              onTap: () => cubit.toggleSize(s),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Color chips
                      const Text('Color', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 48,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: colors.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 10),
                          itemBuilder: (_, i) {
                            final raw = colors[i];
                            // ensure single token (colors[i] should already be single token after normalization)
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

                      // Brand (single-select horizontal)
                      const Text('Brand', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 44,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: brands.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemBuilder: (_, i) {
                            final b = _cleanToken(brands[i]);
                            final sel = state.selectedBrand == b;
                            return _styledFilterChip(
                              label: b,
                              selected: sel,
                              onTap: () => cubit.selectBrand(b),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Apply: pop with cubit.state.toMap()
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(state.toMap()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                          ),
                          child: const Text('Apply', style: TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
