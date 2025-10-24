import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/application/bloc/favourite/cubit/favourie_state.dart';
import 'package:shoezy/data/models/product/product_model.dart';
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
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            final isLoading = state is FavoritesLoading;

            if (state is FavoritesError) {
              return const Center(child: Text("Error Fetching Favorites!"));
            } else if (state is FavoritesLoaded) {
              favorites = state.favorites;
            }

            final isEmpty = favorites.isEmpty;

            // Show shimmer loading grid when loading
            if (isLoading) {
              return AnimationLoading.buildShimmerGrid(
                itemCount: 6,
                mainAxisExtent: 280,
              );
            }

            // Show empty state with Lottie animation
            if (isEmpty) {
              return AnimationLoading.emptyBoxField(
                message: 'No favorite products yet!',
              );
            }

            // Show actual content
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 280,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];
                return ProductGridCard(
                  product: product,
                  isFavourite: true,
                  onFavouriteTap: () =>
                      context.read<FavoritesCubit>().toggleFavorite(product),
                  ontap: () {
                    NavigationStyles.fade(
                      context,
                      ProductDetailsScreen(products: product),
                    );
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
