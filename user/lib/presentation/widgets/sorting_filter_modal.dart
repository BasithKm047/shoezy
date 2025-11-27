// lib/presentation/widgets/sorting_filter_modal.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/presentation/bloc/product_sort/cubit/product_sort_cubit.dart';
import 'package:shoezy/presentation/bloc/product_sort/cubit/product_sort_state.dart';
import 'package:shoezy/utils/const/colors.dart';

class SortingFilterModal extends StatelessWidget {
  const SortingFilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSortCubit, ProductSortState>(
      builder: (context, state) {
        return SortingFilterModalBody(state: state); // NEW
      },
    );
  }
}

// helper model for UI only
class _SortItem {
  final SortOption option;
  final String label;
  const _SortItem(this.option, this.label);
}

class SortingFilterModalBody extends StatelessWidget {
  final ProductSortState state; // NEW

  const SortingFilterModalBody({super.key, required this.state}); // NEW

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductSortCubit>(); // NEW

    // NEW: options in the same order as screenshot
    final items = [
      const _SortItem(SortOption.relevance, 'Relevance'),
      const _SortItem(SortOption.popularity, 'Popularity'),
      const _SortItem(SortOption.priceLowToHigh, 'Price -- Low to High'),
      const _SortItem(SortOption.priceHighToLow, 'Price -- High to Low'),
      const _SortItem(SortOption.newestFirst, 'Newest First'),
      const _SortItem(SortOption.discount, 'Discount'),
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.30,
      maxChildSize: 0.7,
      builder: (ctx, scrollCtrl) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
          ),
          child: Column(
            children: [
              // drag handle
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                child: Row(
                  children: [
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'SORT BY', // NEW: title like screenshot
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        cubit.reset(); // NEW
                      },
                      child: Text(
                        'RESET',
                        style: TextStyle(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.builder(
                  controller: scrollCtrl,
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    final item = items[index];
                    final isSelected = state.selected == item.option;

                    return InkWell(
                      onTap: () {
                        cubit.selectOption(item.option); // NEW
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.label,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? AppColors.blue
                                    : Colors.black87,
                              ),
                            ),
                            Radio<SortOption>(
                              value: item.option,
                              groupValue: state.selected,
                              onChanged: (val) {
                                if (val != null) {
                                  cubit.selectOption(val); // NEW
                                }
                              },
                              activeColor: AppColors.blue,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 14),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // NEW
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
