import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:shoezy/utils/const/colors.dart';

class Searchfield extends StatelessWidget {
  final double screenWidth;
  const Searchfield({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shadowColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      elevation: 5,
      child: SizedBox(
        width: screenWidth / 1.1,
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: Icon(Entypo.camera, color: AppColors.black),
            prefixIcon: Icon(
              AntDesign.search1,
              size: 25.0,
              color: AppColors.black,
            ),
            hintStyle: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.black),
            hintText: 'Search',
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
