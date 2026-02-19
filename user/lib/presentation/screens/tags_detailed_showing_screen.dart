import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/presentation/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/widgets/cardfor_showing_shoes.dart';
import 'package:shoezy/presentation/widgets/home_screen_widgets.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/utils/const/colors.dart';

class TagsDetailedShowingScreen extends StatelessWidget {

  const TagsDetailedShowingScreen({super.key,});

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
              child: AnimationLoading.buildShimmerGrid(
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
                    tagName: tags[index][index],
                    products: products,
                    isLoading: state.maybeWhen(
                      orElse: () => false,
                      loading: () => true,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left:50,right: 50),
              child: SizedBox(
                width: 24,
                height: 30,
                child: Divider(color: AppColors.grey,),
              ),
            ),
            itemCount: tags.length,
          ),
        );
      },
    );
  }
}
