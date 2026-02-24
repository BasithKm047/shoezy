import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/data/models/cart/cart_model.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shoezy/presentation/cubit/favourite/favourie_cubit.dart';
import 'package:shoezy/presentation/cubit/product_cart/cubit/product_cart_cubit.dart';
import 'package:shoezy/presentation/cubit/product_cart/cubit/product_cart_state.dart';
import 'package:shoezy/presentation/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:shoezy/presentation/cubit/product_details_cubit/product_details_state.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/core/utils/const/colors.dart';
import 'package:shoezy/core/utils/const/commonFunctions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailsCubit>();
    print("Product: ${widget.product.productName}");
    print("Variants count: ${widget.product.variants.length}");
  }

  @override
  Widget build(BuildContext context) {
    // final details = context.read<ProductDetailsCubit>().state;

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
              if (widget.product.variants.isNotEmpty) ...[
                _SectionTitle(title: 'Colors Available'),
                const SizedBox(height: 20),
                ColorOptionsRow(
                  colors: widget.product.variants.map((v) => v.color).toList(),
                ),
                const SizedBox(height: 30),
              ],

              const SizedBox(height: 30),
              _SectionTitle(title: 'Size Available'),
              const SizedBox(height: 20),
              SizeOptionsRow(
                sizes: widget.product.sizeStock.map((v) => v.size).toList(),
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
              BlocConsumer<ProductCartCubit, ProductCartState>(
                listener: (context, state) {},

                builder: (context, state) {
                  return PriceAndAddToCartRow(
                    price: widget.product.price,
                    onAddToCart: () async {
                      final details = context.read<ProductDetailsCubit>().state;
                      if (details.selectedColor.isEmpty ||
                          details.selectedSize.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select color and size!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                        return;
                      }
                      final user = context
                          .read<AuthBloc>()
                          .authServices
                          .currentUser;

                      final userId = user?.uid;

                      final cartitem = CartModel(
                        productId: details.productId ?? '',
                        image: details.selectedImage,
                        name: details.product.productName,
                        price: double.parse(details.product.price),
                        color: details.selectedColor,
                        size: details.selectedSize,
                        quantity: 1,
                        userId: userId ?? 'guest',
                      );

                      if (context.mounted) {
                          CostumWidget.showCustomSnackbar(
                          context: context,
                          message: 'Adding to cart...',
                          duration: const Duration(seconds: 1),
                        );
                      }

                      await Future.delayed(const Duration(seconds: 1));
                      if (context.mounted) {
                        Navigator.pop(context, true);
                      }

                      await context.read<ProductCartCubit>().addItem(cartitem);

                      if (context.mounted) {
                        // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        CostumWidget.showCustomSnackbar(
                          context: context,
                          message: 'Added to cart!',
                          duration: const Duration(seconds: 1),
                          
                      
                        );

                      }
                    },
                  );
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
  String? _lastColor;

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
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final selectedColor = state.selectedColor;
        final variants = widget.product.variants;
        final selectedVariant = variants.isNotEmpty
            ? variants.firstWhere(
                (v) =>
                    v.color.trim().toLowerCase() ==
                    selectedColor.trim().toLowerCase(),
                orElse: () => variants.first,
              )
            : null;
        final productImages = selectedVariant?.images ?? [];

        if (_lastColor != selectedColor) {
          _lastColor = selectedColor;
          currentImageIndex.value = 0;
          if (_pageController.hasClients) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_pageController.hasClients) {
                _pageController.jumpToPage(0);
              }
            });
          }
        }

        return Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      currentImageIndex.value = index;
                      if (index >= 0 && index < productImages.length) {
                        context.read<ProductDetailsCubit>().selectImage(
                          productImages[index],
                        );
                      }
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
      },
    );
  }
}

/// ------------------------- FAVORITE BUTTON -------------------------

class FavoriteIconButton extends StatelessWidget {
  final ProductModel product;

  const FavoriteIconButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, Set<String>>(
      builder: (context, state) {
        final isFavorite = state.contains(product.id);
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () => Commonfunctions.toggleFavorite(context, product),
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

  const ColorOptionsRow({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                final colorName = colors[index];
                final color = getColorFromName(colorName);
                final isSelected = state.selectedColor == colorName;

                return GestureDetector(
                  onTap: () {
                    context.read<ProductDetailsCubit>().selectColor(colorName);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 12),
                    width: isSelected ? 46 : 38,
                    height: isSelected ? 46 : 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.grey,
                        width: isSelected ? 2 : 1,
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

  const SizeOptionsRow({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    if (sizes.isEmpty) return const SizedBox.shrink();

    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sizes.length,
              itemBuilder: (context, index) {
                final size = sizes[index];
                final isSelected = state.selectedSize == size;

                return GestureDetector(
                  onTap: () {
                    context.read<ProductDetailsCubit>().selectSize(size);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.grey),
                    ),
                    child: Text(
                      size,
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppColors.grey,
                        fontWeight: FontWeight.bold,
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
