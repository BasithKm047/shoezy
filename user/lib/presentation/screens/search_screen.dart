import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/brand_bloc/brand_bloc.dart';
import 'package:shoezy/application/bloc/category/bloc/category_bloc.dart';
import 'package:shoezy/application/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/application/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/screens/product_details_screen.dart';
import 'package:shoezy/presentation/widgets/product_grid_card.dart';
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

    // Load all data once
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
        .toList(); // show only 6 products
  }

  // 🕘 Save recent searches
  void _addToRecentSearches(String query) {
    if (query.isEmpty) return;
    final currentList = _recentSearchesNotifier.value;
    final updated = [query, ...currentList.where((e) => e != query)];
    if (updated.length > 5) updated.removeLast(); // limit to 5 items
    _recentSearchesNotifier.value = updated;
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

        return Scaffold(
          appBar: AppBar(
            title: const Text('Search Products'),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.5,
          ),
          body:
           isLoading ? buildShimmerGrid():
           Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  onChanged: (value) => _queryNotifier.value = value,
                  onSubmitted: (value) {
                    _addToRecentSearches(value);
                    _queryNotifier.value = value;
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),

              Expanded(
                child: ValueListenableBuilder<String>(
                  valueListenable: _queryNotifier,
                  builder: (context, query, _) {
                    final filteredProducts = _filterProducts(products, query);
                    final defaultProducts = products.take(4).toList();
                    final showSuggestions = query.isEmpty;

                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 🕘 Recent Searches + Popular Searches
                            if (showSuggestions) ...[
                              ValueListenableBuilder<List<String>>(
                                valueListenable: _recentSearchesNotifier,
                                builder: (context, recent, _) {
                                  if (recent.isEmpty) return const SizedBox.shrink();
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                                backgroundColor: Colors.grey.shade300,
                                                label: Text(item),
                                                onPressed: () {
                                                  _searchController.text = item;
                                                  _queryNotifier.value = item;
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
                                        backgroundColor: Colors.grey.shade300,
                                        label: Text(sug),
                                        onPressed: () {
                                          _searchController.text = sug;
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
                              _buildProductGrid(context, defaultProducts),
                            ],

                            // 🔍 Filtered Search Results
                            if (!showSuggestions) ...[
                              const SizedBox(height: 10),
                              _buildProductGrid(context, filteredProducts),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
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
  Widget _buildProductGrid(BuildContext context, List<ProductModel> productsList) {
    if (productsList.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'No products found',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
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
        final isFav = context.read<FavoritesCubit>().isFavorite(product);
        return ProductGridCard(
          isFavourite: isFav,
          onFavouriteTap: () {
            context.read<FavoritesCubit>().toggleFavorite(product);
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
  }
}
