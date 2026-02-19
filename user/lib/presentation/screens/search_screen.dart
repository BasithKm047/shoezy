import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoezy/presentation/bloc/brand_bloc/brand_bloc.dart';
import 'package:shoezy/presentation/bloc/category/bloc/category_bloc.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_state.dart';
import 'package:shoezy/presentation/bloc/productFilter/cubit/product_filter_cubit.dart';
import 'package:shoezy/presentation/bloc/productFilter/cubit/product_filter_state.dart';
import 'package:shoezy/presentation/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/product_cart/cubit/product_cart_cubit.dart';
import 'package:shoezy/presentation/bloc/product_details_cubit/cubit/product_details_cubit.dart';
import 'package:shoezy/presentation/bloc/product_sort/cubit/product_sort_cubit.dart';
import 'package:shoezy/presentation/screens/product_details_screen.dart';
import 'package:shoezy/presentation/widgets/filter_modal.dart';
import 'package:shoezy/presentation/widgets/filtering_product_nav_bar.dart';
import 'package:shoezy/presentation/widgets/product_grid_card.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/presentation/widgets/sorting_filter_modal.dart';
import 'package:shoezy/utils/const/navigation_styles.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  late final ValueNotifier<String> _queryNotifier;
  late final ValueNotifier<List<String>> _recentSearchesNotifier;
  Timer? _debounce;

  final List<String> _suggestions = [
    'Nike',
    'Adidas',
    'Sneakers',
    'Running Shoes',
    'Casual',
    'Puma',
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _queryNotifier = ValueNotifier<String>('');
    _recentSearchesNotifier = ValueNotifier<List<String>>([]);

    _loadRecentSearches().then((value) {
      _recentSearchesNotifier.value = value;
    });

    context.read<CategoryBloc>().add(CategoryEvent.loadCategories());
    context.read<ProductBloc>().add(ProductEvent.loadProducts());
    context.read<BrandBloc>().add(LoadBrandEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _queryNotifier.dispose();
    _recentSearchesNotifier.dispose();
    super.dispose();
    _debounce?.cancel();
  }

  // 🔍 Filter logic
  List<ProductModel> _filterProducts(
    List<ProductModel> products,
    String query,
  ) {
    if (query.isEmpty) return [];
    final lowerQuery = query.toLowerCase();

    return products
        .where((product) {
          final name = product.productName.toLowerCase();
          final category = product.categoryName.toLowerCase();
          final brand = product.brandName.toLowerCase();
          return name.contains(lowerQuery) ||
              category.contains(lowerQuery) ||
              brand.contains(lowerQuery);
        })
        .take(6)
        .toList();
  }

  // 🕘 Save recent searches
  Future<void> _addToRecentSearches(String query) async {
    if (query.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    final currentList = prefs.getStringList('recent_searches') ?? [];
    final updated = [query, ...currentList.where((e) => e != query)];
    if (updated.length > 5) updated.removeLast();
    prefs.setStringList('recent_searches', updated);
  }

  Future<List<String>> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('recent_searches') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          orElse: () => false,
          loading: () => true,
        );

        final products = state.maybeWhen(
          orElse: () => <ProductModel>[],
          loaded: (productList) => productList,
        );
        final filterCubit = context.read<ProductFilterCubit>();
        if (products.isNotEmpty && filterCubit.state.sourceProducts.isEmpty) {
          filterCubit.setSourceProducts(products);
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Search Products'),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.5,
          ),
          body: isLoading
              ? buildShimmerGrid()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search by product, category, or brand',
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          if (_debounce?.isActive ?? false) _debounce?.cancel();

                          _debounce = Timer(
                            const Duration(milliseconds: 300),
                            () async {
                              _addToRecentSearches(value);
                              _queryNotifier.value = value;

                              final products = context
                                  .read<ProductBloc>()
                                  .state
                                  .maybeWhen(
                                    orElse: () => <ProductModel>[],
                                    loaded: (products) => products,
                                  );
                              context
                                  .read<ProductFilterCubit>()
                                  .setSourceProducts(
                                    products,
                                    titleFilter: value,
                                  );
                              _recentSearchesNotifier.value =
                                  await _loadRecentSearches();
                            },
                          );
                        },
                        onSubmitted: (value) async {
                          _addToRecentSearches(value);
                          _queryNotifier.value = value;
                          FocusScope.of(context).unfocus();
                          final products = context
                              .read<ProductBloc>()
                              .state
                              .maybeWhen(
                                orElse: () => <ProductModel>[],
                                loaded: (products) => products,
                              );
                          context.read<ProductFilterCubit>().setSourceProducts(
                            products,
                            titleFilter: value,
                          );
                          _recentSearchesNotifier.value =
                              await _loadRecentSearches();
                        },
                      ),
                    ),

                    Expanded(
                      child: ValueListenableBuilder<String>(
                        valueListenable: _queryNotifier,
                        builder: (context, query, _) {
                          return BlocBuilder<
                            ProductFilterCubit,
                            ProductFilterState
                          >(
                            builder: (context, state) {
                              final showSuggestions =
                                  query.isEmpty && !state.hasActiveFilters;
                              final defaultProducts = state.defaultProducts
                                  .take(4)
                                  .toList();
                              final filteredProducts = state.hasActiveFilters
                                  ? state.filteredProducts
                                  : _filterProducts(
                                      state.sourceProducts,
                                      query,
                                    );
                              return SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // 🕘 Recent Searches + Popular Searches
                                      if (showSuggestions) ...[
                                        const SizedBox(height: 10),
                                        ValueListenableBuilder<List<String>>(
                                          valueListenable:
                                              _recentSearchesNotifier,
                                          builder: (context, recent, _) {
                                            if (recent.isEmpty) {
                                              return const SizedBox.shrink();
                                            }
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Recent Searches',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Wrap(
                                                  spacing: 8,
                                                  children: recent
                                                      .map(
                                                        (item) => ActionChip(
                                                          backgroundColor:
                                                              Colors
                                                                  .grey
                                                                  .shade300,
                                                          label: Text(item),
                                                          onPressed: () {
                                                            _searchController
                                                                    .text =
                                                                item;
                                                            _queryNotifier
                                                                    .value =
                                                                item;
                                                          },
                                                        ),
                                                      )
                                                      .toList(),
                                                ),
                                                const SizedBox(height: 20),
                                              ],
                                            );
                                          },
                                        ),
                                        const Text(
                                          'Popular Searches',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Wrap(
                                          spacing: 8,
                                          children: _suggestions
                                              .map(
                                                (sug) => ActionChip(
                                                  backgroundColor:
                                                      Colors.grey.shade300,
                                                  label: Text(sug),
                                                  onPressed: () {
                                                    _searchController.text =
                                                        sug;
                                                    _addToRecentSearches(sug);
                                                    _queryNotifier.value = sug;
                                                  },
                                                ),
                                              )
                                              .toList(),
                                        ),
                                        const SizedBox(height: 25),

                                        // 👟 Recommended Products (Always 4)
                                        const Text(
                                          'Recommended for You',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        _buildProductGrid(
                                          context,
                                          defaultProducts,
                                        ),
                                      ],

                                      // 🔍 Filtered Search Results
                                      if (!showSuggestions) ...[
                                        const SizedBox(height: 10),
                                        _buildProductGrid(
                                          context,
                                          filteredProducts,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
          bottomNavigationBar: ProductBottomNav(
            onSortTap: () async {
              final sortCubit = context.read<ProductSortCubit>(); // NEW

              await showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => BlocProvider.value(
                  value: sortCubit,
                  child: const SortingFilterModal(), // NEW
                ),
              );
            },

            onFilterTap: () async {
              final cubit = context.read<ProductFilterCubit>();

              // Get current products from ProductBloc
              final productState = context.read<ProductBloc>().state;
              final currentProducts = productState.maybeWhen(
                orElse: () => <ProductModel>[],
                loaded: (products) => products,
              );
              final currentQuery = _queryNotifier.value;
              cubit.setSourceProducts(
                currentProducts,
                titleFilter: currentQuery.isEmpty ? null : currentQuery,
              );

              // Initialize filter cubit with products

              await showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => BlocProvider.value(
                  value: cubit,
                  child: const ProductFilterModal(),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 280,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 6,
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

  // 🔹 Grid for 4 products
  Widget _buildProductGrid(
    BuildContext context,
    List<ProductModel> productsList,
  ) {
    if (productsList.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Center(child: AnimationLoading.boxEmptyField()),
      );
    }

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 280,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: productsList.length.clamp(0, 4), // Show max 4
      itemBuilder: (context, index) {
        final product = productsList[index];

        return BlocSelector<FavoritesCubit, Set<String>, bool>(
          selector: (state) {
            return state.contains(product.id!);
          },
          builder: (context, isFav) {
            return ProductGridCard(
              isFavourite: isFav,
              onFavouriteTap: () {
                context.read<FavoritesCubit>().toggleFavorite(product.id!);
              },
              product: product,
              ontap: () {
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
            );
          },
        );
      },
    );
  }
}
