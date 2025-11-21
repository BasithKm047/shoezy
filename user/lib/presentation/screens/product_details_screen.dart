import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_state.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel products;
  const ProductDetailsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    var productImages = products.image;
    ValueNotifier<int> currentImageIndex = ValueNotifier<int>(0);
    final PageController pageController = PageController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: const Color.fromARGB(255, 241, 241, 241),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      onPageChanged: (index) {
                        currentImageIndex.value = index;
                      },
                      itemCount: productImages.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          productImages[index],
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: BlocBuilder<FavoritesCubit, FavoritesState>(
                        builder: (context, state) {
                          final isFavorite = context
                              .read<FavoritesCubit>()
                              .isFavorite(products);

                          return IconButton(
                            icon: !isFavorite
                                ? Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
                                    size: 30,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                            onPressed: () {
                              context.read<FavoritesCubit>().toggleFavorite(
                                products,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ValueListenableBuilder<int>(
                  valueListenable: currentImageIndex,
                  builder: (context, value, child) {
                    return SmoothPageIndicator(
                      controller: pageController,
                      count: productImages.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotHeight: 10,
                        expansionFactor: 4,
                        dotWidth: 10,
                        radius: 8,
                        dotColor: Colors.grey,
                        spacing: 10,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  products.tag,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  products.productName,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  products.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Colors Available',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.color.length,
                    itemBuilder: (context, index) {
                      final colorName = products.color[index];
                      final color = getColorFromName(colorName);

                      return Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: color == Colors.white
                              ? Border.all(color: Colors.grey)
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Size Available',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.size.length,
                    itemBuilder: (context, index) {
                      final size = products.size[index];
                      return Container(
                        width: 60,
                        height: 40,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          size,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Rating & Reviews',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Add rating and reviews section here
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(Icons.star, size: 24, color: Colors.amber),
                    SizedBox(width: 8),
                    Text(
                      '4.5',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Customer Reviews',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Add customer reviews section here
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(Icons.person, size: 24, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(
                      'John Doe',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(
                      '4.5',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 8.0,
                ),
                child: Text(
                  'Great product, very comfortable!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 8.0,
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Price',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '₹${products.price}',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        // Handle add to cart action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
