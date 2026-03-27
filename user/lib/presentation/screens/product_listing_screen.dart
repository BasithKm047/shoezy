// lib/presentation/screens/product_listing_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';


import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/presentation/cubit/favourite/favourie_cubit.dart';
import 'package:shoezy/presentation/cubit/productFilter/cubit/product_filter_cubit.dart';
import 'package:shoezy/presentation/cubit/productFilter/cubit/product_filter_state.dart';
import 'package:shoezy/presentation/cubit/product_cart/cubit/product_cart_cubit.dart';
import 'package:shoezy/presentation/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:shoezy/presentation/screens/product_details_screen.dart';

import 'package:shoezy/presentation/widgets/loading_state_manager.dart';
import 'package:shoezy/presentation/widgets/product_grid_card.dart';

import 'package:shoezy/core/utils/const/colors.dart';
import 'package:shoezy/core/utils/const/navigation_styles.dart';

// const List<String> predefinedColorOptions = [
//   'Black',
//   'Brown',
//   'Blue',
//   'Red',
//   'Green',
//   'Yellow',
//   'White',
//   'Grey',
//   'Orange',
// ];

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
    return BlocProvider<ProductFilterCubit>(
      create: (context) {
        final cubit = ProductFilterCubit();
        // final productState = context.read<ProductBloc>().state;

        cubit.setSourceProducts(
          products,
          initialVisible: products,
          titleFilter: title,
        );
        return cubit;
      },
      child: _ProductListingView(title: title),
    );
  }
}

class _ProductListingView extends StatelessWidget {
  final String title;
  const _ProductListingView({required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFilterCubit, ProductFilterState>(
      builder: (context, fState) {
        final filtered = fState.filteredProducts;
        final isEmpty = filtered.isEmpty;
        final hasFilters = fState.hasActiveFilters;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0.4,
          ),

          body: Column(
            children: [
              // Active filters bar (shows chips for sizes, colors, brand, gender)
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              //   child: _ActiveFiltersBar(state: fState),
              // ),

              // Expanded grid area
              Expanded(
                child: LoadingStateManager(
                  isLoading:
                      false, // this screen relies on passed products; if you want loading use ProductBloc
                  isEmpty: isEmpty,
                  lottieAsset: 'asset/empty-box_2.json',
                  emptyMessage: hasFilters
                      ? 'No products match your filters'
                      : 'No products available',
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, productState) {
                        return productState.maybeWhen(
                          loading: () {
                            return GridView.builder(
                              itemCount: 6,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 280,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                  ),
                              itemBuilder: (_, __) => Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            );
                          },
                          loaded: (_) {
                            final favIds = context
                                .watch<FavoritesCubit>()
                                .state;
                            final visibleProducts = fState.hasActiveFilters
                                ? fState.filteredProducts
                                : fState.defaultProducts;
                            return GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: visibleProducts.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 280,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                  ),
                              itemBuilder: (_, index) {
                                final product = visibleProducts[index];
                                final isFavourite = favIds.contains(product.id);
                                return ProductGridCard(
                                  product: product,
                                  isFavourite: isFavourite,
                                  onFavouriteTap: () {
                                    context
                                        .read<FavoritesCubit>()
                                        .toggleFavorite(product.id!);
                                  },
                                  ontap: () {
                                    NavigationStyles.fade(
                                      context,
                                      BlocProvider.value(
                                        value: context.read<ProductCartCubit>(),
                                        child: BlocProvider(
                                          create: (context) => ProductDetailsCubit(product),
                                          child: ProductDetailsScreen(
                                            product: product,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          orElse: () => const SizedBox(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
