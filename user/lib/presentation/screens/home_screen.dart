import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';
import 'package:shoezy/application/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/widgets/drawer.dart';
import 'package:shoezy/presentation/widgets/gender_tabbar.dart';
import 'package:shoezy/presentation/widgets/home_screen_widgets.dart';
import 'package:shoezy/presentation/widgets/horizontalGridview.dart';
import 'package:shoezy/presentation/widgets/searchField.dart';
import 'package:shoezy/presentation/widgets/loading_state_manager.dart';
import 'package:shoezy/utils/const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<String> selectedGender = ValueNotifier("Men");
  List<ProductModel> products = [];
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductEvent.loadProducts());
    selectedGender.value = "Men";
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
          
          final isLoading = state.maybeWhen(
            orElse: () => false,
            loading: () => true,
          );
          
          final isEmpty = products.isEmpty;

          return LoadingStateManager(
            isLoading: isLoading,
            isEmpty: isEmpty,
            emptyMessage: 'No products available',
            lottieAsset: 'asset/empty-box_2.json',
            child: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Searchfield(screenWidth: screenWidth)),
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
                GenderTabBar(selectedGender: selectedGender),
                SizedBox(height: 10),

                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    final List<ProductModel> products = state.maybeWhen(
                      orElse: () => [],
                      loaded: (products) => products,
                    );
                    return ValueListenableBuilder<String>(
                      valueListenable: selectedGender,
                      builder: (context, gender, child) {
                        final filteredProducts = products
                            .where(
                              (p) =>
                                  p.gender.toLowerCase() ==
                                      gender.toLowerCase() &&
                                  p.tag.contains('Top Rated'),
                            )
                            .toList();
                        Logger().d(filteredProducts);

                        return HorizontalTagSection(
                          gender: selectedGender.value,
                          tagName: 'Top Rated',
                          products: filteredProducts,
                          isLoading: state.maybeWhen(
                            orElse: () => false,
                            loading: () => true,
                          ),
                        );
                      },
                    );
                  },
                ),

                SizedBox(height: 10),
                if (products.isNotEmpty)
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      final List<ProductModel> products = state.maybeWhen(
                        orElse: () => [],
                        loaded: (products) => products,
                      );
                      return ValueListenableBuilder<String>(
                        valueListenable: selectedGender,
                        builder: (context, gender, child) {
                          final filteredProducts = products
                              .where(
                                (p) =>
                                    p.gender.toLowerCase() ==
                                        gender.toLowerCase() &&
                                    p.tag.contains('New Arrival'),
                              )
                              .toList();
                          Logger().d(filteredProducts);

                          return HorizontalTagSection(
                            gender: selectedGender.value,
                            tagName: 'New Arrival',
                            products: filteredProducts,
                            isLoading: state.maybeWhen(
                              orElse: () => false,
                              loading: () => true,
                            ),
                          );
                        },
                      );
                    },
                  ),

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
