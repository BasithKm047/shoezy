import 'package:flutter/material.dart';
import 'package:shoezy/utils/const/colors.dart';

class ProductBottomNav extends StatelessWidget {
  final VoidCallback onSortTap;
  final VoidCallback onFilterTap;

  const ProductBottomNav({
    super.key,
    required this.onSortTap,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color navBarColor = isDark ? AppColors.black : Colors.white;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: navBarColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(12),
            bottom: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.4)
                  : Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navButton(
              icon: Icons.sort,
              label: "SORT BY",
              onTap: onSortTap,
            ),

            _verticalDivider(),

            // _navButton(
            //   icon: Icons.category,
            //   label: "CATEGORY",
            //   onTap: onCategoryTap,
            // ),

            // _verticalDivider(),

            _navButton(
              icon: Icons.filter_list,
              label: "FILTERS",
              onTap: onFilterTap,
            ),
          ],
        ),
      ),
    );
  }

  // reusable function
  Widget _navButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.blue),
          const SizedBox(width: 3),
          Text(
            label,
            style:  TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }

  // vertical divider widget
  Widget _verticalDivider() {
    return Container(
      height: 30,
      width: 1,
      color:AppColors.filterNavdividerColor ,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
