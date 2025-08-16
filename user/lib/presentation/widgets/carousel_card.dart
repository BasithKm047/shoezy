import 'package:flutter/material.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/utils/const/colors.dart';

class CarouselCard extends StatelessWidget {
  final String shoeName;
  final String tag;
  final String price;
  final String shoeImage;
  final double? height;
  final double? width;
  final double? imageHeight;
  final double? imageWidth;
  const CarouselCard({
    super.key,
    required this.shoeImage,
    required this.shoeName,
    required this.price,
    required this.tag,
    this.height,
    this.width,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shadowColor: AppColors.white,

      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: nAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 20),
                  CostumWidget.labelText(
                    context,
                    tag,
                    color: AppColors.blue,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  ),
                  // SizedBox(height: 3),
                  CostumWidget.labelText(
                    context,
                    shoeName,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 10),
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

            SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: Image.asset(shoeImage),
            ),
          ],
        ),
      ),
    );
  }
}
