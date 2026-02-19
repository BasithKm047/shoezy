import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/product_cart/cubit/product_cart_cubit.dart';
import 'package:shoezy/presentation/bloc/product_details_cubit/cubit/product_details_cubit.dart';
import 'package:shoezy/presentation/screens/product_details_screen.dart';
import 'package:shoezy/presentation/widgets/lottie_widgets.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:shoezy/utils/const/commonFunctions.dart';
import 'package:shoezy/utils/const/navigation_styles.dart';

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
        child:
            AnimationLoading.shimmerTagGrid(), // shimmer for horizontal scroll
      );
    }

    if (filteredProducts.isEmpty) {
      return Center(child: LottieWidgets.noData('Product', context));
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
            child: ProductHorizontalCard(product: product),
          );
        },
      ),
    );
  }
}

class ProductHorizontalCard extends StatelessWidget {
  final ProductModel product;

  const ProductHorizontalCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isFavourite = Commonfunctions.isFavorite(context, product);

    return GestureDetector(
      onTap: () {
        NavigationStyles.fade(
          context,
          BlocProvider.value(
            value: context.read<ProductCartCubit>(),
            child: BlocProvider(
              create: (context) => ProductDetailsCubit(product),
              child: ProductDetailsScreen(product: product),
            ),
          ),
        );
      },
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
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Commonfunctions.productImage(product),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () =>
                          Commonfunctions.toggleFavorite(context, product),
                      child: Container(
                        padding: const EdgeInsets.all(6),
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
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
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
