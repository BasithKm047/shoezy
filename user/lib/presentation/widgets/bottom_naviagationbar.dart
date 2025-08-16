import 'package:flutter/material.dart';
import 'package:shoezy/utils/const/colors.dart';

class BottomNaviagationbar extends StatelessWidget {
  const BottomNaviagationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return   BottomNavigationBar(
        // fixedColor: AppColors.white,
        backgroundColor: AppColors.white,
      

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: AppColors.black),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, color: AppColors.black),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined, color: AppColors.black),

            label: "Profile",
          ),
        ]);
  }
}