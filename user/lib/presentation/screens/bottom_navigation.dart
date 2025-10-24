import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/navigation_bar/cubit/bottom_navigation_bar_cubit.dart';
import 'package:shoezy/presentation/screens/cart_screen.dart';
import 'package:shoezy/presentation/screens/category_screen.dart';
import 'package:shoezy/presentation/screens/favourote_screen.dart';
import 'package:shoezy/presentation/screens/home_screen.dart';
import 'package:shoezy/utils/const/colors.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  final Color activeColor = const Color(0xFF00FF7F);
  final Color inactiveColorLight = const Color(0xFFE8E8E8);
  final Color inactiveColorDark = const Color(0xFF2C2C2C);

  final List<Map<String, dynamic>> navitems = const [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.grid_view, 'label': 'category'},
    {'icon': Icons.favorite_border, 'label': 'Favourite'},
    {'icon': Icons.shopping_cart_outlined, 'label': 'Cart'},
    // {'icon': Icons.person, 'label': 'Profile'},
  ];

  final List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    FavoritesScreen(),
    const CartScreen(),
    // const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color navBarColor = isDark ? const Color(0xFF1A1A1A) : Colors.white;
    final Color inactiveColor = isDark ? inactiveColorDark : inactiveColorLight;
    final Color iconColor = isDark ? AppColors.white : AppColors.black;
    // final Color textColor = isDark ? Colors.white : Colors.black87;

    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (state.index != 0) {
              context.read<BottomNavigationBarCubit>().changeIndex(0);
              return false;
            } else {
              return true;
            }
          },
          child: Scaffold(
            body: screens[state.index],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: navBarColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(22),
                    bottom: Radius.circular(22),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(navitems.length, (index) {
                    final items = navitems[index];
                    final isSelected = state.index == index;

                    return GestureDetector(
                      onTap: () => context
                          .read<BottomNavigationBarCubit>()
                          .changeIndex(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? activeColor : inactiveColor,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: activeColor.withOpacity(0.4),
                                    blurRadius: 8,
                                    spreadRadius: 1,
                                  ),
                                ]
                              : [],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              items['icon'],
                              color: isSelected ? Colors.black : iconColor,
                              size: 24,
                            ),
                            if (isSelected)
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                  items['label'],
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: isDark
                                            ? Colors.black
                                            : Colors.black87,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
