import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_state.dart';
import 'package:shoezy/presentation/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/screens/product_details_screen.dart';
import 'package:shoezy/presentation/widgets/filter_modal.dart';
import 'package:shoezy/presentation/widgets/filtering_product_nav_bar.dart';
import 'package:shoezy/presentation/widgets/loading_state_manager.dart';
import 'package:shoezy/presentation/widgets/product_grid_card.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:shoezy/utils/const/navigation_styles.dart';

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
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          orElse: () => false,
          loading: () => true,
        );
        final isEmpty = products.isEmpty;

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
          body: LoadingStateManager(
            isLoading: isLoading,
            isEmpty: isEmpty,
            lottieAsset: 'asset/empty-box_2.json',
            emptyMessage: 'No products available',
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<FavoritesCubit, FavoritesState>(
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
          ),
          bottomNavigationBar: ProductBottomNav(
            onSortTap: () {},
            onCategoryTap: () {},
            onFilterTap: () async {
              final List<ProductModel> allproducts = state.maybeWhen(
                loaded: (products) => products,
                orElse: () => [],
              );
              // Gather all unique sizes, colors, brands, and genders from the products
              final Set<String> allSizes = {};
              final Set<String> allColors = {};
              final Set<String> allBrands = {};
              final Set<String> allGenders = {};

              for (final product in allproducts) {
                // Add all available sizes

                for (final s in product.size) {
                  allSizes.add(s.toString());
                }

                // Add all available colors

                for (final c in product.color) {
                  allColors.add(c.toString());
                  allColors.add(product.color.toString());
                }

                // Add brand (if property exists)
                allBrands.add(product.brandName.toString());

                // Add gender (if property exists)
                allGenders.add(product.gender.toString());
              }

              // Show modal bottom sheet with these filter options
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => ProductFilterModal(
                  allSizes: allSizes.toList()..sort(),
                  allColors: allColors.toList(),
                  allBrands: allBrands.toList(),
                  allGenders: allGenders.toList(),
                  initialFilters: null,
                ),
              );

              //} context.read<ProductBloc>().add(ProductEvent.fetchWithFilters(result));
            },
          ),
        );
      },
    );
  }
}
