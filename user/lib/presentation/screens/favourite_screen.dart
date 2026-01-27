import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/presentation/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/presentation/screens/product_details_screen.dart';
import 'package:shoezy/presentation/widgets/product_grid_card.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/utils/const/navigation_styles.dart';

// ignore: must_be_immutable
class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  List<ProductModel> favorites = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Favorites",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<FavoritesCubit, Set<String>>(
          builder: (context, favIds) {
            final productsState = context.watch<ProductBloc>().state;

            return productsState.maybeWhen(
              loaded: (products) {
                final favorites = products
                    .where((p) => favIds.contains(p.id))
                    .toList();

                if (favorites.isEmpty) {
                  return AnimationLoading.emptyBoxField(
                    message: 'No favorite products yet!',
                  );
                }

                return GridView.builder(
                  itemCount: favorites.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 280,
                  ),
                  itemBuilder: (_, i) {
                    final product = favorites[i];
                    return ProductGridCard(
                      ontap: () {
                        NavigationStyles.fade(
                          context,
                          ProductDetailsScreen(product: product),
                        );
                        // Navigate to product details
                      },
                      product: product,
                      isFavourite: true,
                      onFavouriteTap: () {
                        context.read<FavoritesCubit>().toggleFavorite(
                          product.id!,
                        );
                      },
                    );
                  },
                );
              },
              orElse: () => AnimationLoading.buildShimmerGrid(
                itemCount: 6,
                mainAxisExtent: 280,
              ),
            );
          },
        ),
      ),
    );
  }
}
