import 'package:flutter/material.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/utils/const/colors.dart';

class ProductGridCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? ontap;
  final bool isFavourite;
  final VoidCallback? onFavouriteTap;
  const ProductGridCard({
    super.key,
    required this.product,
    this.ontap,
    required this.isFavourite,
    this.onFavouriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    product.image.first,
                    height: 180.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: AnimationLoading.shimmerImagePlaceholder(
                            height: 180,
                            width: double.infinity,
                          ),
                        );
                      }
                    },

                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[400],
                        size: 60,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavouriteTap,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: isFavourite ? Colors.red : Colors.grey,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating and reviews
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: AppColors.green),
                      SizedBox(width: 3),
                      Text(
                        '4.5',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '(1k reviews)',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),

                  // Brand Name
                  Text(
                    product.brandName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 2),

                  // Product Name
                  Text(
                    product.productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),

                  // Price and Tag
                  Row(
                    children: [
                      Text(
                        '₹${product.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 7),
                      if (product.tag.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.purple[50],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            product.tag,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.purple,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
