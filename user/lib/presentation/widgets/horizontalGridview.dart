import 'package:flutter/material.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/screens/tags_detailed_showing_screen.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:shoezy/utils/const/navigation_styles.dart';

class HorizontalTagSection extends StatelessWidget {
  final String tagName;
  final String gender;
  final List<ProductModel> products;
  final bool isLoading;

  const HorizontalTagSection({
    super.key,
    required this.tagName,
    required this.gender,
    required this.products,
    this.isLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ Filter products by gender and tag
    final filteredProducts = products
        .where(
          (p) =>
              p.gender.toLowerCase() == gender.toLowerCase() &&
              p.tag.contains(tagName),
        )
        .toList();
    if (filteredProducts.isEmpty) {
      return SizedBox.shrink(); // returns an empty widget
    }
    // ✅ Show shimmer when loading or empty
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: AnimationLoading.shimmerTagGrid(),
      );
    }

    // ✅ Actual UI
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Header Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tagName,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  NavigationStyles.slideFromLeft(context, TagsDetailedShowingScreen(gender: gender));
                },
                child: Text(
                  "See All →",
                  style: TextStyle(color: AppColors.blue),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: 360,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: _imageCard(filteredProducts[0], isLarge: true),
                ),
                const SizedBox(width: 12),

                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: _imageCard(
                          filteredProducts.length > 1
                              ? filteredProducts[1]
                              : filteredProducts[0],
                        ),
                      ),
                      SizedBox(height: 12),
                      Expanded(
                        flex: 5,
                        child: _imageCard(
                          filteredProducts.length > 2
                              ? filteredProducts[2]
                              : filteredProducts[0],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageCard(ProductModel product, {bool isLarge = false}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.network(
                  product.image.first,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return AnimationLoading.shimmerImagePlaceholder(
                      height: double.infinity,
                      width: double.infinity,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isLarge ? 15 : 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "₹${product.price}",
                      style: TextStyle(
                        fontSize: isLarge ? 14 : 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
