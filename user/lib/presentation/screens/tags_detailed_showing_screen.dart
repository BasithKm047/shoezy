import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/widgets/cardfor_showing_shoes.dart';
import 'package:shoezy/presentation/widgets/home_screen_widgets.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';

class TagsDetailedShowingScreen extends StatelessWidget {
   final String gender;
  const TagsDetailedShowingScreen({super.key, required this.gender});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    List<ProductModel> products = [];
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.maybeWhen(orElse: () => false, loading: () => true)) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ShimmerLoading.buildShimmerGrid(
                itemCount: 6,
                mainAxisExtent: 280,
              ),
            ),
          );
        }

        products = state.maybeWhen(
          orElse: () => [],
          loaded: (products) => products,
        );
        final tags = products.map((p) => p.tag).toSet().toList();
        final filterdByGender = products
            .where((p) => p.gender.toLowerCase() == gender.toLowerCase())
            .toList();
        products = filterdByGender;

        return Scaffold(
          body: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  HomeScreenWidgets.tagLabel(
                    screenWidth,
                    context,
                    tags[index],
                    false,
                  ),
                  SizedBox(height: 10),

                  HorizontalProductList(
                    tagName: tags[index],
                    products: products,
                    isLoading: state.maybeWhen(
                      orElse: () => false,
                      loading: () => true,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: tags.length,
          ),
        );
      },
    );
  }
}
