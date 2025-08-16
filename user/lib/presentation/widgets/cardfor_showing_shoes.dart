import 'package:flutter/material.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/utils/const/colors.dart';

class CardforShowingShoes extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final String tag;
  final String shoeName;
  final String price;
  const CardforShowingShoes({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    required this.price,
    required this.shoeName,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 5,
      shadowColor:AppColors.white,
      
      color: AppColors.white,

      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Image.asset(imageUrl),
            SizedBox(height: 15),
            CostumWidget.labelText(
              context,
              tag,
              color: AppColors.blue,
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
            ),
            //  SizedBox(height: 3,),
            CostumWidget.labelText(
              context,
              shoeName,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 5),

            CostumWidget.labelText(
              context,
              '₹$price',
              color: AppColors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
