import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoezy/utils/const/colors.dart';

class BrandsFeild extends StatelessWidget {
  final String imagePath;
  const BrandsFeild({ super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
            boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // shadow color
              spreadRadius: 1, // how far the shadow spreads
              blurRadius: 5, // how soft the shadow is
              offset: Offset(0, 3), // shadow position (x, y)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 10.0),
          child: SvgPicture.asset(imagePath,
          fit: BoxFit.contain,),
        )
      ),
    );
  }
}