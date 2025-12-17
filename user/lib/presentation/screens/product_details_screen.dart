import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/data/models/cart/cart_model.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_state.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/product_cart/cubit/product_cart_cubit.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> currentImageIndex = ValueNotifier<int>(0);
  ValueNotifier<String?> selectedColor = ValueNotifier<String?>(null);
  ValueNotifier<String?> selectedSize = ValueNotifier<String?>(null);
  @override
  void initState() {
    super.initState();
    selectedColor.value = widget.product.color.isNotEmpty
        ? widget.product.color.first
        : null;
    selectedSize.value = widget.product.size.isNotEmpty
        ? widget.product.size.first
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductImageSection(product: widget.product),
              const SizedBox(height: 20),
              _ProductHeaderSection(product: widget.product),
              const SizedBox(height: 20),
              _SectionTitle(title: 'Colors Available'),
              const SizedBox(height: 20),
              ColorOptionsRow(
                selectedColorNotifier: selectedColor,
                colors: widget.product.color,
                onSelect: (color) {
                  selectedColor.value = color;
                },
              ),
              const SizedBox(height: 30),
              _SectionTitle(title: 'Size Available'),
              const SizedBox(height: 20),
              SizeOptionsRow(
                selectedSizeNotifier: selectedSize,
                sizes: widget.product.size,
                onSelect: (size) {
                  selectedSize.value = size;
                },
              ),
              const SizedBox(height: 30),
              _SectionTitle(title: 'Rating & Reviews'),
              const SizedBox(height: 20),
              const RatingRow(rating: 4.5),
              const SizedBox(height: 30),
              _SectionTitle(title: 'Customer Reviews'),
              const SizedBox(height: 20),
              const CustomerReviewTile(
                userName: 'John Doe',
                rating: 4.5,
                comment: 'Great product, very comfortable!',
              ),
              const SizedBox(height: 30),
              PriceAndAddToCartRow(
                price: widget.product.price,
                onAddToCart: () {
                  final cartItem = CartModel(
                    productId: widget.product.id!,
                    image: widget.product.image.first,
                    name: widget.product.productName,
                    color: selectedColor.value ?? '',
                    size: selectedSize.value ?? '',
                    price: double.tryParse(widget.product.price) ?? 0.0,
                    userId: 'currentUserId', // Replace with actual user ID
                    quantity: 1,
                  );
                  
                  context.read<ProductCartCubit>().addItem(cartItem);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ------------------------- IMAGE + FAV + INDICATOR -------------------------

class _ProductImageSection extends StatefulWidget {
  final ProductModel product;

  const _ProductImageSection({required this.product});

  @override
  State<_ProductImageSection> createState() => _ProductImageSectionState();
}

class _ProductImageSectionState extends State<_ProductImageSection> {
  late final PageController _pageController;
  ValueNotifier<int> currentImageIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productImages = widget.product.image;

    return Column(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
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
                child: FavoriteIconButton(product: widget.product),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SmoothPageIndicator(
          controller: _pageController,
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
        ),
      ],
    );
  }
}

/// ------------------------- FAVORITE BUTTON -------------------------

class FavoriteIconButton extends StatelessWidget {
  final ProductModel product;

  const FavoriteIconButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final isFavorite = context.read<FavoritesCubit>().isFavorite(product);

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () {
            context.read<FavoritesCubit>().toggleFavorite(product);
          },
        );
      },
    );
  }
}

/// ------------------------- PRODUCT HEADER (TAG, NAME, DESC) -------------------------

class _ProductHeaderSection extends StatelessWidget {
  final ProductModel product;

  const _ProductHeaderSection({required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.tag,
            style: theme.headlineMedium?.copyWith(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.productName,
            style: theme.headlineMedium?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.description,
            style: theme.bodyMedium?.copyWith(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------- SECTION TITLE -------------------------

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        title,
        style: theme.headlineMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

/// ------------------------- COLOR OPTIONS ROW -------------------------
// ignore: must_be_immutable
class ColorOptionsRow extends StatelessWidget {
  final List<String> colors;
  final ValueNotifier<String?> selectedColorNotifier;
  final void Function(String) onSelect;

  const ColorOptionsRow({
    super.key,
    required this.colors,
    required this.selectedColorNotifier,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    if (colors.isEmpty) return const SizedBox.shrink();

    return ValueListenableBuilder(
      valueListenable: selectedColorNotifier,
      builder: (context, selectedColor, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                final colorName = colors[index];
                final color = getColorFromName(colorName);
                final bool isSelected = selectedColor == colorName;

                return GestureDetector(
                  onTap: () => onSelect(colorName),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutBack,
                    margin: const EdgeInsets.only(right: 12),
                    padding: EdgeInsets.all(isSelected ? 6: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // boxShadow: isSelected
                      //     ? [
                      //         BoxShadow(
                      //           color: color.withOpacity(0.5),
                      //           blurRadius: 12,
                      //           spreadRadius: 2,
                      //         ),
                      //       ]
                      //     : [],
                    ),
                    child: AnimatedScale(
                      scale: isSelected ? 1.30 :.85,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutBack,
                      child: Container(
                        width: isSelected ? 50: 40,
                        height: isSelected ? 50: 40,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          // border: Border.all(
                          //   color: isSelected
                          //       ? Colors.black
                          //       : Colors.grey.shade400,
                          //   width: isSelected ? 1 : 0,
                          // ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

/// ------------------------- SIZE OPTIONS ROW -------------------------
// ignore: must_be_immutable
class SizeOptionsRow extends StatelessWidget {
  final List<String> sizes;
  final void Function(String) onSelect;
  ValueNotifier<String?> selectedSizeNotifier = ValueNotifier<String?>(null);

  SizeOptionsRow({
    super.key,
    required this.sizes,
    required this.onSelect,
    required this.selectedSizeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    if (sizes.isEmpty) return const SizedBox.shrink();

    return ValueListenableBuilder(
      valueListenable: selectedSizeNotifier,
      builder: (context, selectedSize, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sizes.length,
              itemBuilder: (context, index) {
                final size = sizes[index];
                final bool isSelected = selectedSize == size;

                return GestureDetector(
                  onTap: () => onSelect(size),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutBack,
                    margin: const EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(
                      horizontal: isSelected ? 6 : 3,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.blue.withOpacity(0.4),
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                    child: AnimatedScale(
                      scale: isSelected ? 1.12 : 1.0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutBack,
                      child: Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected ? Colors.white : AppColors.grey,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

/// ------------------------- RATING ROW -------------------------

class RatingRow extends StatelessWidget {
  final double rating;

  const RatingRow({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          const Icon(Icons.star, size: 24, color: Colors.amber),
          const SizedBox(width: 8),
          Text(
            rating.toStringAsFixed(1),
            style: theme.bodyMedium?.copyWith(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------- CUSTOMER REVIEW TILE -------------------------

class CustomerReviewTile extends StatelessWidget {
  final String userName;
  final double rating;
  final String comment;

  const CustomerReviewTile({
    super.key,
    required this.userName,
    required this.rating,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              const Icon(Icons.person, size: 24, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                userName,
                style: theme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                rating.toStringAsFixed(1),
                style: theme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            comment,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.bodyMedium?.copyWith(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}

/// ------------------------- PRICE + ADD TO CART -------------------------

class PriceAndAddToCartRow extends StatelessWidget {
  final String price;
  final VoidCallback onAddToCart;

  const PriceAndAddToCartRow({
    super.key,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: theme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '₹$price',
                style: theme.headlineMedium?.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: onAddToCart,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              'Add to Cart',
              style: theme.bodyMedium?.copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------- COLOR HELPER -------------------------

Color getColorFromName(String name) {
  switch (name.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    case 'green':
      return Colors.green;
    case 'yellow':
      return Colors.yellow;
    case 'orange':
      return Colors.orange;
    case 'purple':
      return Colors.purple;
    case 'pink':
      return Colors.pink;
    case 'grey':
      return Colors.grey;
    case 'brown':
      return Colors.brown;

    default:
      return Colors.blue;
  }
}


class FunctiosForProductDetailsScreen {

  static imageShowingFunction(
      String colorSelected

  ) {

    //showing image based on the color selected
    
   

  }
} 