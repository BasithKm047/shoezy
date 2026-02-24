import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/cubit/product_cart/cubit/product_cart_cubit.dart';
import 'package:shoezy/presentation/cubit/product_cart/cubit/product_cart_state.dart';
import 'package:shoezy/presentation/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:shoezy/presentation/screens/product_details_screen.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/core/utils/const/colors.dart';
import 'package:shoezy/core/utils/const/commonFunctions.dart';
import 'package:shoezy/core/utils/const/navigation_styles.dart';

class HorizontalTagSection extends StatefulWidget {
  final String tagName;
  final ValueNotifier<String> selectedGender;
  final List<ProductModel> products;
  final bool isLoading;

  const HorizontalTagSection({
    super.key,
    required this.tagName,
    required this.selectedGender,
    required this.products,
    this.isLoading = false,
  });

  @override
  State<HorizontalTagSection> createState() => _HorizontalTagSectionState();
}

class _HorizontalTagSectionState extends State<HorizontalTagSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<String> genders = const ["Men", "Women", "Kids"];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
      reverseDuration: const Duration(milliseconds: 550),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    Future.delayed(const Duration(milliseconds: 150), () {
      _animationController.forward();
    });

    widget.selectedGender.addListener(() {
      _animationController.forward(from: 0);
    });
  }

  String getNextGender(String current) {
    final index = genders.indexOf(current);
    return (index < genders.length - 1) ? genders[index + 1] : current;
  }

  String getPreviousGender(String current) {
    final index = genders.indexOf(current);
    return (index > 0) ? genders[index - 1] : current;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        final velocity = details.primaryVelocity;
        if (velocity == null) return;

        if (velocity < -50) {
          widget.selectedGender.value = getNextGender(
            widget.selectedGender.value,
          );
        } else if (velocity > 50) {
          widget.selectedGender.value = getPreviousGender(
            widget.selectedGender.value,
          );
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ValueListenableBuilder<String>(
          valueListenable: widget.selectedGender,
          builder: (context, gender, _) {
            final filteredProducts = widget.products
                .where(
                  (p) =>
                      p.gender.toLowerCase() == gender.toLowerCase() &&
                      p.tag.contains(widget.tagName),
                )
                .toList();

            if (filteredProducts.isEmpty) {
              return const SizedBox.shrink();
            }

            if (widget.isLoading) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: AnimationLoading.shimmerTagGrid(),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.tagName,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // NavigationStyles.slideFromLeft(
                          //   context,
                          //   // TagsDetailedShowingScreen(gender: gender),
                          // );
                        },
                        child: Text(
                          "See All →",
                          style: TextStyle(color: AppColors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 360,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: _imageCard(
                            context,
                            filteredProducts[0],
                            isLarge: true,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: _imageCard(
                                  context,
                                  filteredProducts.length > 1
                                      ? filteredProducts[1]
                                      : filteredProducts[0],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Expanded(
                                flex: 5,
                                child: _imageCard(
                                  context,
                                  filteredProducts.length > 2
                                      ? filteredProducts[2]
                                      : filteredProducts[0],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _imageCard(
    BuildContext context,
    ProductModel product, {
    bool isLarge = false,
  }) {
    return BlocBuilder<ProductCartCubit, ProductCartState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            NavigationStyles.fade(
              context,
              BlocProvider.value(
                value: context.read<ProductCartCubit>(),
                child: BlocProvider(
                  create: (context) => ProductDetailsCubit(product),
                  child: ProductDetailsScreen(product: product),
                ),
              ),
            );
          },

          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 6,
                  offset: const Offset(2, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Commonfunctions.productImage(product),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: isLarge ? 15 : 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "₹${product.price}",
                          style: TextStyle(
                            fontSize: isLarge ? 14 : 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
