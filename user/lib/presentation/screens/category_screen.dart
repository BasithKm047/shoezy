import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy/application/bloc/category/bloc/category_bloc.dart';
import 'package:shoezy/application/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/data/models/category/category_model.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/screens/product_listing_screen.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(CategoryEvent.loadCategories());
    context.read<ProductBloc>().add(ProductEvent.loadProducts());
    List<CategoryModel> categories = [];
    List<ProductModel> products = [];
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        products = state.maybeWhen(
          orElse: () => [],
          loaded: (products) => products,
        );
        Logger().d(products);
        return BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            categories = state.maybeWhen(
              orElse: () => [],
              loaded: (categories) => categories,
            );
            Logger().d(categories);

            state.maybeWhen(
              orElse: () {},
              loading: () {
                return Scaffold(body: AnimationLoading.spinnerAnimation());
              },
            );

            state.maybeWhen(
              orElse: () {},
              error: (message) {
                return Scaffold(body: Center(child: Text(message)));
              },
            );

            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: AppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: Text(
                    'SHOES',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
              ),

              body: categories.isNotEmpty
                  ? ListView.separated(
                      itemCount: categories.length,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Divider(height: 1, color: Colors.grey),
                      ),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return ListTile(
                          leading: Image.network(
                            category.image,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            category.name.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            final filteredProducts = products
                                .where(
                                  (p) =>
                                      p.categoryName.toLowerCase() ==
                                      category.name.toLowerCase(),
                                )
                                .toList();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductListingScreen(
                                  products: filteredProducts,
                                  title: category.name,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : Center(child: AnimationLoading.spinnerAnimation()),
            );
          },
        );
      },
    );
  }
}
