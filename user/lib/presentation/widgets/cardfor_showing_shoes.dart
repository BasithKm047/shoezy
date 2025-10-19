import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/widgets/lottie_widgets.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/utils/const/colors.dart';

class HorizontalProductList extends StatelessWidget {
  final String tagName;
  // final String gender;
  final List<ProductModel> products;
  final bool isLoading;

  const HorizontalProductList({
    super.key,
    required this.tagName,
    // required this.gender,
    required this.products,
    this.isLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products
        .where((p) => p.tag.contains(tagName))
        .toList();

    if (isLoading) {
      return SizedBox(
        height: 250,
        child: AnimationLoading.shimmerTagGrid(), // shimmer for horizontal scroll
      );
    }

    if (filteredProducts.isEmpty) {
      return Center(child: LottieWidgets.noData('Product', context ,));
    }

    return SizedBox(
      height: 250, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: _productCard(context, product),
          );
        },
      ),
    );
  }

  Widget _productCard(BuildContext context, ProductModel product) {
    onFavouriteTap() {
      context.read<FavoritesCubit>().toggleFavorite(product);
    }

    final isFavourite = context.watch<FavoritesCubit>().isFavorite(product);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180, 
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
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
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
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[400],
                        size: 60,
                      ),
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
            ),

            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 6.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "₹${product.price}",
                      style: TextStyle(
                        fontSize: 14,
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
