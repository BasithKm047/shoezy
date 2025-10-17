import 'package:flutter/material.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
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
    return GestureDetector(
      onTap: () {
        
      },
      child: Card(
        elevation: 2,
        shadowColor: AppColors.white,
      
        color: AppColors.white,
      
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [Colors.white, Colors.grey.shade100],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: AspectRatio(
                    aspectRatio: 1.4,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                
                      // height: 114,
                      // width: 200,
                      alignment: Alignment.center,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return ShimmerLoading.shimmerImagePlaceholder(height: 150, width: double.infinity);
                      },
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[400],
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
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
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              SizedBox(height: 5),
      
              CostumWidget.labelText(
                context,
                '₹$price',
                color: AppColors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
