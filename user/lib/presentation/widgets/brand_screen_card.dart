import 'package:flutter/material.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/screens/product_listing_screen.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';

// ignore: must_be_immutable
class BrandScreenCard extends StatelessWidget {
  List<ProductModel> products;
  final String title;
  final String imageUrl;

  BrandScreenCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products
        .where((p) => p.brandName == title)
        .toList();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                ProductListingScreen(products: filteredProducts, title: title),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: AnimationLoading.shimmerImagePlaceholder(
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      );
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(12),
                  color: Colors.black.withOpacity(0.6),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
