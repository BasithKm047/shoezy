import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy/presentation/cubit/product_cart/cubit/product_cart_cubit.dart';
import 'package:shoezy/presentation/cubit/product_cart/cubit/product_cart_state.dart';
import 'package:shoezy/presentation/screens/payment_screen.dart';
import 'package:shoezy/presentation/widgets/loading_state_manager.dart';
import 'package:shoezy/core/utils/const/colors.dart';
import 'package:shoezy/core/utils/const/navigation_styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<ProductCartCubit>().getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            /// ---------------- APP BAR ----------------
            Padding(
              padding: const EdgeInsets.all(20),
              child: AppBar(
                title: Text(
                  "My Cart",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                centerTitle: true,
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.black,
                elevation: 0.4,
              ),
            ),

            /// ---------------- CART LIST ----------------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<ProductCartCubit, ProductCartState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );

                    final cartItems = state.maybeWhen(
                      loaded: (items) => items,
                      orElse: () => [],
                    );

                    final error = state.maybeWhen(
                      error: (msg, user) => msg,
                      orElse: () => null,
                    );

                    if (error != null) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 40,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Error: $error",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.red),
                            ),
                            TextButton(
                              onPressed: () => context
                                  .read<ProductCartCubit>()
                                  .getCartItems(),
                              child: const Text("Retry"),
                            ),
                          ],
                        ),
                      );
                    }

                    final isEmpty = cartItems.isEmpty;

                    return LoadingStateManager(
                      isLoading: isLoading,
                      isEmpty: isEmpty,
                      emptyMessage: "Your cart is empty",
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cartItems.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 18),
                        itemBuilder: (context, index) {
                          final item = cartItems[index];

                          return TweenAnimationBuilder<double>(
                            duration: Duration(
                              milliseconds: 400 + (index * 100),
                            ),
                            tween: Tween(begin: 0, end: 1),
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: Transform.translate(
                                  offset: Offset(0, 20 * (1 - value)),
                                  child: child,
                                ),
                              );
                            },
                            child: _animatedCartCard(item),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),

            /// ---------------- BOTTOM TOTAL SECTION ----------------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: BlocBuilder<ProductCartCubit, ProductCartState>(
                builder: (context, state) {
                  final cartItems = state.maybeWhen(
                    loaded: (items) => items,
                    orElse: () => [],
                  );

                  final isEmpty = cartItems.isEmpty;

                  final totalPrice = context
                      .read<ProductCartCubit>()
                      .getTotalPrice();

                  final shipping = isEmpty ? 0.0 : 40.90;
                  final grandTotal = totalPrice + shipping;

                  return Column(
                    children: [
                      if (!isEmpty) ...[
                        _priceRow(
                          context,
                          "Subtotal",
                          "\$${totalPrice.toStringAsFixed(2)}",
                        ),
                        const SizedBox(height: 10),
                      ],
                      _priceRow(
                        context,
                        "Shipping",
                        "\$${shipping.toStringAsFixed(2)}",
                      ),
                      const SizedBox(height: 15),
                      const Divider(),
                      const SizedBox(height: 15),
                      _priceRow(
                        context,
                        "Total Cost",
                        "\$${grandTotal.toStringAsFixed(2)}",
                        isBold: true,
                      ),
                      const SizedBox(height: 25),

                      /// Checkout Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: (isEmpty)
                                ? Colors.grey
                                : AppColors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          onPressed: (isEmpty)
                              ? null
                              : () {
                                  NavigationStyles.fade(
                                    context,
                                    PaymentScreen(totalAmount: totalPrice),
                                  );
                                },
                          child: const Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------------- CART ITEM ----------------
  Widget _animatedCartCard(item) {
    bool isPressed = false;

    return StatefulBuilder(
      builder: (context, setLocalState) {
        return GestureDetector(
          onTapDown: (_) => setLocalState(() => isPressed = true),
          onTapUp: (_) => setLocalState(() => isPressed = false),
          onTapCancel: () => setLocalState(() => isPressed = false),
          child: AnimatedScale(
            // ignore: dead_code
            scale: isPressed ? 0.98 : 1.0,
            duration: const Duration(milliseconds: 150),
            child: Card(
              elevation: 6,
              shadowColor: Colors.black.withOpacity(0.06),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey.shade50],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        item.image,
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 90,
                            width: 90,
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation(Colors.grey),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 16),

                    /// Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Title + Size
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Size ${item.size}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          /// Price
                          Text(
                            "\$${item.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                            ),
                          ),

                          const SizedBox(height: 12),

                          /// Quantity + Delete
                          Row(
                            children: [
                              _animatedQtyButton(
                                icon: Icons.remove,
                                onTap: () {
                                  if (item.id != null) {
                                    context
                                        .read<ProductCartCubit>()
                                        .decrementQuantity(item.id!);
                                    Logger().i("Decremented");
                                  }
                                },
                              ),
                              const SizedBox(width: 12),
                              Text(
                                item.quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 12),
                              _animatedQtyButton(
                                icon: Icons.add,
                                isAdd: true,
                                onTap: () {
                                  if (item.id != null) {
                                    context
                                        .read<ProductCartCubit>()
                                        .incrementQuantity(item.id!);
                                  }
                                  Logger().i("Incremented");
                                },
                              ),
                              const Spacer(),
                              InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  if (item.id != null) {
                                    context.read<ProductCartCubit>().removeItem(
                                      item.id!,
                                    );
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Quantity Button
  Widget _animatedQtyButton({
    required IconData icon,
    bool isAdd = false,
    required VoidCallback onTap,
  }) {
    bool pressed = false;

    return StatefulBuilder(
      builder: (context, setLocalState) {
        return GestureDetector(
          onTapDown: (_) => setLocalState(() => pressed = true),
          onTap: () {
            setLocalState(() => pressed = false);
            onTap();
          },
          onTapCancel: () => setLocalState(() => pressed = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: isAdd ? Colors.blue : Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            // ignore: dead_code
            transform: Matrix4.identity()..scale(pressed ? 0.85 : 1.0),
            child: Icon(
              icon,
              size: 18,
              color: isAdd ? Colors.white : Colors.black54,
            ),
          ),
        );
      },
    );
  }

  /// Price Row
  Widget _priceRow(
    BuildContext context,
    String title,
    String value, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 15,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            color: isBold ? AppColors.black : AppColors.moreDarker,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
