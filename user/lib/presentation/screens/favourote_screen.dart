import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoezy/application/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/application/bloc/favourite/cubit/favourie_state.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/widgets/product_grid_card.dart';

// ignore: must_be_immutable
class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  List<ProductModel> favorites = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoading) {
              return GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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

            if (state is FavoritesError) {
              return const Center(child: Text("Error Fetching Favorites!"));
            } else if (state is FavoritesLoaded) {
              favorites = state.favorites;
            }

            if (favorites.isEmpty) {
              return Center(child: Text("No favorite products yet!"));
            }

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
                  ontap: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
