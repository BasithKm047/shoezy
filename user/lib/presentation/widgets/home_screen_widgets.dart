import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/brand_bloc/brand_bloc.dart';
import 'package:shoezy/application/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/screens/home_screen.dart';
import 'package:shoezy/presentation/screens/tags_detailed_showing_screen.dart';
import 'package:shoezy/presentation/widgets/brands_feild.dart';
import 'package:shoezy/presentation/widgets/cardfor_showing_shoes.dart';
import 'package:shoezy/presentation/widgets/carousel_card.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/presentation/widgets/dots_button.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreenWidgets {
  static PreferredSize appBar(double screenWidth) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 80.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
        child: AppBar(
          title: Colomforhome(screenWidth: screenWidth),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10, top: 15.0),
            child: Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: DotsButton(),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static BlocBuilder<BrandBloc, BrandState> brandFields(
    List<ProductModel> products,
  ) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        if (state is BrandLoadingState) {
          return CircularProgressIndicator(color: AppColors.blue);
        } else if (state is BrandLoadedState) {
          final brands = state.brands;
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return BrandsFeild(
                    products: products
                        .where((p) => p.brandName == brands[index].name)
                        .toList(),

                    imagePath: brands[index].imageUrl,
                    name: brands[index].name,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 20),
                itemCount: brands.length,
              ),
            ),
          );
        } else if (state is BrandLoadErrorState) {
          return Center(child: Text('Error Loading brand :${state.message}'));
        }
        return SizedBox();
      },
    );
  }

  static BlocBuilder<ProductBloc, ProductState> carousalCard(
    CarouselSliderController carouselController,
    ValueNotifier<int> activeIndex,
    double screenWidth,
  ) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final List<ProductModel> products = state.maybeWhen(
          orElse: () => [],
          loaded: (products) => products,
        );

        final filteredProducts = products
            .where((p) => p.tag.contains('Best Seller'))
            .toList();

        // Logger().d(filteredProducts);
        return CarouselSlider.builder(
          carouselController: carouselController,
          options: CarouselOptions(
            height: 170,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(seconds: 1),
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              activeIndex.value = index;
            },
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index, realIndex) {
            return CarouselCard(
              imageHeight: 120.0,
              shoeImage: filteredProducts[index].image.first,

              shoeName: filteredProducts[index].productName,
              price: filteredProducts[index].price,
              tag: filteredProducts[index].tag,
              width: screenWidth / 1.1,
              height: 110,
            );
          },
        );
      },
    );
  }

  static ValueListenableBuilder<int> animatorControllingCarousel(
    ValueNotifier<int> activeIndex,
    CarouselSliderController carouselController,
  ) {
    return ValueListenableBuilder(
      valueListenable: activeIndex,
      builder: (context, index, child) {
        return AnimatedSmoothIndicator(
          activeIndex: index,
          count: 3,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: AppColors.blue,
            dotColor: Colors.black,
          ),
          onDotClicked: (dotIndex) {
            carouselController.animateToPage(dotIndex);
          },
        );
      },
    );
  }

  static SizedBox tagLabel(
    double screenWidth,
    BuildContext context,
    String tagName,
    bool isWantToSeeAll,
  ) {
    return SizedBox(
      width: screenWidth / 1.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CostumWidget.labelText(context, tagName),
          if (isWantToSeeAll)
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TagsDetailedShowingScreen(),
                  ),
                );
              },

              child: Text(
                'See all',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.blue,
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }

  static Padding tagProducts(String tagName) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          final List<ProductModel> products = state.maybeWhen(
            orElse: () => [],
            loaded: (products) => products,
          );

          final filteredByTag = products
              .where((p) => p.tag.contains(tagName))
              .toList();
          // Logger().d(filteredByTag);

          return SizedBox(
            height: 220.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CardforShowingShoes(
                  width: 150.0,
                  imageUrl: filteredByTag[index].image.first,
                  price: filteredByTag[index].price,
                  shoeName: filteredByTag[index].productName,
                  tag: filteredByTag[index].tag,
                );
              },
              itemCount: filteredByTag.length,
              separatorBuilder: (context, index) => SizedBox(width: 20),
            ),
          );
        },
      ),
    );
  }
}
