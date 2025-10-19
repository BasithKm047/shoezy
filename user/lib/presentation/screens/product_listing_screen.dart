import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoezy/application/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/application/bloc/favourite/cubit/favourie_state.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/widgets/product_grid_card.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/utils/const/colors.dart';

class ProductListingScreen extends StatelessWidget {
  final List<ProductModel> products;
  final String title;

  const ProductListingScreen({
    super.key,
    required this.products,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,

          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: products.isEmpty
            ?  Center(
                child: AnimationLoading.spinnerAnimation()
              )
            : BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, favouriteStatus) {
                  if (favouriteStatus is FavoritesLoading) {
                    return GridView.builder(
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 280,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 280,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final isFav = context.read<FavoritesCubit>().isFavorite(
                        product,
                      );
                      return ProductGridCard(
                        isFavourite: isFav,
                        onFavouriteTap: () {
                          context.read<FavoritesCubit>().toggleFavorite(
                            product,
                          );
                        },
                        product: product,
                        ontap: () {
                          // Navigate to product details (optional)
                        },
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
