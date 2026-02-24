import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/presentation/screens/search_screen.dart';
import 'package:shoezy/presentation/screens/tags_detailed_showing_screen.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/presentation/widgets/drawer.dart';
import 'package:shoezy/presentation/widgets/home_screen_widgets.dart';
import 'package:shoezy/presentation/widgets/loading_state_manager.dart';
import 'package:shoezy/presentation/widgets/lottie_widgets.dart';
import 'package:shoezy/presentation/widgets/searchField.dart';
import 'package:shoezy/core/utils/const/colors.dart';
import 'package:shoezy/core/utils/const/commonFunctions.dart';
import 'package:shoezy/core/utils/const/navigation_styles.dart';
import 'package:shoezy/presentation/widgets/home_screen_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final ValueNotifier<String> selectedGender = ValueNotifier("Men");
  List<ProductModel> products = [];
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductEvent.loadProducts());
    // selectedGender.value = "Men";
  }

  @override
  void dispose() {
    // selectedGender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CarouselSliderController carouselController =
        CarouselSliderController();
    ValueNotifier<int> activeIndex = ValueNotifier(0);

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: HomeScreenWidgets.appBar(screenWidth),

      drawer: MyDrawer(),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          products = state.maybeWhen(
            orElse: () => [],
            loaded: (products) => products,
          );
          final filteredProducts = products
              .where((p) => Commonfunctions.hasTag(p, 'Best Seller'))
              .toList();
          final filteredProducts2 = products
              .where((p) => Commonfunctions.hasTag(p, 'Top Rated'))
              .toList();
          final filteredProducts3 = products
              .where((p) => Commonfunctions.hasTag(p, 'New Arrival'))
              .toList();

          final isLoading = state.maybeWhen(
            orElse: () => false,
            loading: () => true,
          );

          final isEmpty = products.isEmpty;

          return LoadingStateManager(
            isLoading: isLoading,
            isEmpty: isEmpty,
            emptyMessage: 'No products available',
            lottieAsset: 'asset/empty-box_1.json',
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SearchField(
                      screenWidth: screenWidth,
                      onTap: () {
                        NavigationStyles.scale(context, const SearchScreen());
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  HomeScreenWidgets.brandFields(products),
                  SizedBox(height: 5),

                  HomeScreenWidgets.carousalCard(
                    carouselController,
                    activeIndex,
                    screenWidth,
                  ),
                  SizedBox(height: 5),
                  HomeScreenWidgets.animatorControllingCarousel(
                    activeIndex,
                    carouselController,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CostumWidget.labelText(
                          context,
                          'New Arrival',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationStyles.slideFromLeft(
                            context,
                            const TagsDetailedShowingScreen(),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: CostumWidget.labelText(
                            context,
                            'See All →',
                            color: AppColors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 250,
                    child: filteredProducts3.isEmpty
                        ? Center(
                            child: LottieWidgets.emptyBox1('Product', context),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 8),
                            itemCount: filteredProducts3.length,
                            itemBuilder: (context, index) {
                              return ProductCardHorizontal(
                                height: 180,
                                product: filteredProducts3[index],
                                onAdd: () {
                                  CostumWidget.showCustomSnackbar(
                                    context: context,
                                    message:
                                        '${filteredProducts3[index].productName} added to cart',
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CostumWidget.labelText(
                          context,
                          'Best Seller',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationStyles.slideFromLeft(
                            context,
                            const TagsDetailedShowingScreen(),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: CostumWidget.labelText(
                            context,
                            'See All →',
                            color: AppColors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 250,
                    child: filteredProducts.isEmpty
                        ? Center(
                            child: LottieWidgets.emptyBox1('Product', context),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 8),
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              return ProductCardHorizontal(
                                product: filteredProducts[index],
                                onAdd: () {
                                  CostumWidget.showCustomSnackbar(
                                    context: context,
                                    message:
                                        '${filteredProducts[index].productName} added to cart',
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CostumWidget.labelText(
                          context,
                          'Top Rated',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationStyles.slideFromLeft(
                            context,
                            const TagsDetailedShowingScreen(),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: CostumWidget.labelText(
                            context,
                            'See All →',
                            color: AppColors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 300,
                    child: filteredProducts2.isEmpty
                        ? Center(
                            child: LottieWidgets.emptyBox1('Product', context),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 8),
                            itemCount: filteredProducts2.length,
                            itemBuilder: (context, index) {
                              return ProductCardHorizontal(
                                product: filteredProducts2[index],
                                onAdd: () {
                                  CostumWidget.showCustomSnackbar(
                                    context: context,
                                    message:
                                        '${filteredProducts2[index].productName} added to cart',
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  SizedBox(height: 10),

                  //     final List<ProductModel> products = state.maybeWhen(
                  //       orElse: () => [],
                  //       loaded: (products) => products,
                  //     );
                  //     return ValueListenableBuilder<String>(
                  //       valueListenable: selectedGender,
                  //       builder: (context, gender, child) {
                  //         // final filteredProducts = products
                  //         //     .where(
                  //         //       (p) =>
                  //         //           p.gender.toLowerCase() ==
                  //         //               gender.toLowerCase() &&
                  //         //           p.tag.contains('Top Rated'),
                  //         //     )
                  //         //     .toList();
                  //         // Logger().f(filteredProducts);

                  //         return HorizontalTagSection(
                  //           selectedGender: selectedGender,
                  //           // gender: selectedGender.value,
                  //           tagName: 'Top Rated',
                  //           products: products,
                  //           isLoading: state.maybeWhen(
                  //             orElse: () => false,
                  //             loading: () => true,
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),

                  // SizedBox(height: 10,),
                  // BlocBuilder<ProductBloc, ProductState>(
                  //   builder: (context, state) {
                  //     final List<ProductModel> products = state.maybeWhen(
                  //       orElse: () => [],
                  //       loaded: (products) => products,
                  //     );
                  //     return ValueListenableBuilder<String>(
                  //       valueListenable: selectedGender,
                  //       builder: (context, gender, child) {
                  //         final filteredProducts = products
                  //             .where(
                  //               (p) =>
                  //                   p.gender.toLowerCase() ==
                  //                       gender.toLowerCase() &&
                  //                   p.tag.contains('Best Seller'),
                  //             )
                  //             .toList();
                  //         Logger().f(filteredProducts);

                  //         return HorizontalTagSection(
                  //           selectedGender: selectedGender,
                  //           // gender: selectedGender.value,
                  //           tagName: 'Best Seller',
                  //           products: products,
                  //           isLoading: state.maybeWhen(
                  //             orElse: () => false,
                  //             loading: () => true,
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),

                  // SizedBox(height: 10,),
                  // BlocBuilder<ProductBloc, ProductState>(
                  //   builder: (context, state) {
                  //     final List<ProductModel> products = state.maybeWhen(
                  //       orElse: () => [],
                  //       loaded: (products) => products,
                  //     );
                  //     return ValueListenableBuilder<String>(
                  //       valueListenable: selectedGender,
                  //       builder: (context, gender, child) {
                  //         final filteredProducts = products
                  //             .where(
                  //               (p) =>
                  //                   p.gender.toLowerCase() ==
                  //                       gender.toLowerCase() &&
                  //                   p.tag.contains('New Arrival'),
                  //             )
                  //             .toList();
                  //         Logger().f(filteredProducts);

                  //         return HorizontalTagSection(
                  //           selectedGender: selectedGender,
                  //           // gender: selectedGender.value,
                  //           tagName: 'New Arrival',
                  //           products: products,
                  //           isLoading: state.maybeWhen(
                  //             orElse: () => false,
                  //             loading: () => true,
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),
                  // if (products.isNotEmpty)
                  //   BlocBuilder<ProductBloc, ProductState>(
                  //     builder: (context, state) {
                  //       final List<ProductModel> products = state.maybeWhen(
                  //         orElse: () => [],
                  //         loaded: (products) => products,
                  //       );
                  //       return ValueListenableBuilder<String>(
                  //         valueListenable: selectedGender,
                  //         builder: (context, gender, child) {
                  //           final filteredProducts = products
                  //               .where(
                  //                 (p) =>
                  //                     p.gender.toLowerCase() ==
                  //                         gender.toLowerCase() &&
                  //                     p.tag.contains('Trending'),
                  //               )
                  //               .toList();
                  //           Logger().d(filteredProducts);

                  //           return HorizontalTagSection(
                  //             selectedGender: selectedGender,
                  //             // : selectedGender.value,
                  //             tagName: 'Trending',
                  //             products: products,
                  //             isLoading: state.maybeWhen(
                  //               orElse: () => false,
                  //               loading: () => true,
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     },
                  //   ),

                  // 'Best Seller'

                  // HomeScreenWidgets.tagProducts('Top Rated'),
                  // SizedBox(height: 5),
                  // HomeScreenWidgets.tagLabel(
                  //   screenWidth,
                  //   context,
                  // ,
                  //   true,
                  // ),
                  SizedBox(height: 10),
                  // HomeScreenWidgets.tagProducts('Best Seller'),

                  // SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Colomforhome extends StatelessWidget {
  double screenWidth;
  Colomforhome({required this.screenWidth, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Text(
          'Shipping location',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            SizedBox(width: screenWidth / 8),
            Icon(Icons.location_on_outlined, size: 20, color: AppColors.orange),
            SizedBox(width: 2),
            Text(
              'Tirurangadi',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
