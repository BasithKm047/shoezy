import 'package:flutter/material.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/screens/product_listing_screen.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/utils/const/colors.dart';

class BrandsFeild extends StatelessWidget {
  final String imagePath;
  final String name;
  final List<ProductModel> products;
  const BrandsFeild({
    super.key,
    required this.imagePath,
    required this.name,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ProductListingScreen(products: products, title: name),
              ),
            );
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                backgroundImage: NetworkImage(imagePath),
                onBackgroundImageError: (exception, stackTrace) =>
                    AnimationLoading.shimmerCircular(size: 80),
             
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
