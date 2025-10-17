import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/presentation/widgets/home_screen_widgets.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';

class TagsDetailedShowingScreen extends StatelessWidget {
  const TagsDetailedShowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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

        final List<String> tags = state.maybeWhen(
          orElse: () => [],
          loaded: (products) => products.map((p) => p.tag).toSet().toList(),
        );

        return Scaffold(
          body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: 10),
                  HomeScreenWidgets.tagLabel(
                    screenWidth,
                    context,
                    tags[index],
                    false,
                  ),
                  HomeScreenWidgets.tagProducts(tags[index]),
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
