import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_state.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductImageSection(product: product),
              const SizedBox(height: 20),
              _ProductHeaderSection(product: product),
              const SizedBox(height: 20),
              _SectionTitle(
                title: 'Colors Available',
              ),
              const SizedBox(height: 20),
              ColorOptionsRow(colors: product.color),
              const SizedBox(height: 30),
              _SectionTitle(
                title: 'Size Available',
              ),
              const SizedBox(height: 20),
              SizeOptionsRow(sizes: product.size),
              const SizedBox(height: 30),
              _SectionTitle(
                title: 'Rating & Reviews',
              ),
              const SizedBox(height: 20),
              const RatingRow(rating: 4.5),
              const SizedBox(height: 30),
              _SectionTitle(
                title: 'Customer Reviews',
              ),
              const SizedBox(height: 20),
              const CustomerReviewTile(
                userName: 'John Doe',
                rating: 4.5,
                comment: 'Great product, very comfortable!',
              ),
              const SizedBox(height: 30),
              PriceAndAddToCartRow(
                price: product.price,
                onAddToCart: () {
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

  const _ProductImageSection({
    required this.product,
  });

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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
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

  const FavoriteIconButton({
    super.key,
    required this.product,
  });

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

  const _ProductHeaderSection({
    required this.product,
  });

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

  const _SectionTitle({
    required this.title,
  });

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

class ColorOptionsRow extends StatelessWidget {
  final List<String> colors;

  const ColorOptionsRow({
    super.key,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    if (colors.isEmpty) return const SizedBox.shrink();

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
    );
  }
}

/// ------------------------- SIZE OPTIONS ROW -------------------------

class SizeOptionsRow extends StatelessWidget {
  final List<String> sizes;

  const SizeOptionsRow({
    super.key,
    required this.sizes,
  });

  @override
  Widget build(BuildContext context) {
    if (sizes.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sizes.length,
          itemBuilder: (context, index) {
            final size = sizes[index];

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
                style: theme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// ------------------------- RATING ROW -------------------------

class RatingRow extends StatelessWidget {
  final double rating;

  const RatingRow({
    super.key,
    required this.rating,
  });

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
    default:
      return Colors.blue; // from your colors.dart
  }
}
