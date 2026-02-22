import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/presentation/bloc/product_cart/cubit/product_cart_cubit.dart';
import 'package:shoezy/presentation/bloc/product_cart/cubit/product_cart_state.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';
import 'package:shoezy/presentation/bloc/payment_screen_bloc/payment_screen_cubit.dart';
import 'package:shoezy/presentation/bloc/payment_screen_bloc/payment_screen_state.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';

class PaymentScreen extends StatefulWidget {
  final double totalAmount;

  const PaymentScreen({super.key, required this.totalAmount});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final ValueNotifier<bool> _isEditingPhoneNotifier = ValueNotifier<bool>(
    false,
  );
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    // Proactively fetch latest user info
    context.read<ProductCartCubit>().getUser();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _isEditingPhoneNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackroundColor,
      appBar: CostumWidget.backButton(context),
      body: BlocListener<PaymentScreenCubit, PaymentScreenState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              // Refresh original source of truth
              context.read<ProductCartCubit>().getUser();
            },
            error: (message) {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: message,
                backgroundColor: AppColors.red,
              );
            },
          );
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                BlocBuilder<ProductCartCubit, ProductCartState>(
                  builder: (context, state) {
                    final isLoadingUser = state.maybeWhen(
                      loading: () => true,
                      userLoaded: (user) => user == null,
                      orElse: () => false,
                    );

                    final user = state.maybeWhen(
                      loaded: (items, user) => user,
                      userLoaded: (user) => user,
                      error: (message, user) => user,
                      orElse: () => null,
                    );

                    final currentEmail = user?.email ?? "";
                    final currentPhone = user?.phoneNumber ?? "";

                    final displayPhoneText =
                        (currentPhone == 'PhoneNumber' || currentPhone.isEmpty)
                        ? "Add phone number"
                        : currentPhone;

                    if (isLoadingUser && user == null) {
                      return _buildSectionCard(
                        child: AnimationLoading.shimmerImagePlaceholder(
                          height:
                              120, // Match Contact Information height aproximately
                          width: double.infinity,
                        ),
                      );
                    }

                    return _buildSectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CostumWidget.labelText(
                            context,
                            "Contact Information",
                            fontSize: 16,
                          ),
                          const SizedBox(height: 16),
                          _buildContactTile(
                            icon: Icons.email_outlined,
                            title: currentEmail,
                            subtitle: "Email",
                          ),
                          const SizedBox(height: 16),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isEditingPhoneNotifier,
                            builder: (context, isEditing, _) {
                              return _buildContactTile(
                                icon: Icons.phone_outlined,
                                title: displayPhoneText,
                                subtitle: "Phone",
                                isEditing: isEditing,
                                controller: _phoneController,
                                onEdit: () {
                                  _phoneController.text =
                                      (currentPhone == "PhoneNumber" ||
                                          currentPhone.isEmpty)
                                      ? ""
                                      : currentPhone;
                                  _isEditingPhoneNotifier.value = true;
                                },
                                onSave: () {
                                  final newNumber = _phoneController.text
                                      .trim();
                                  if (newNumber.isNotEmpty &&
                                      newNumber.length == 10) {
                                    context
                                        .read<PaymentScreenCubit>()
                                        .updatePhoneNumber(newNumber);
                                    _isEditingPhoneNotifier.value = false;
                                    CostumWidget.showCustomSnackbar(
                                      context: context,
                                      message: 'Phone number updated',
                                    );
                                  } else {
                                    CostumWidget.showCustomSnackbar(
                                      context: context,
                                      message:
                                          'Please enter a valid phone number',
                                    );
                                  }
                                },
                                onCancel: () {
                                  _isEditingPhoneNotifier.value = false;
                                  _phoneController.text =
                                      (currentPhone == "PhoneNumber" ||
                                          currentPhone.isEmpty)
                                      ? ""
                                      : currentPhone;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildSectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CostumWidget.labelText(context, "Address", fontSize: 16),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Newahall St 36, London, 12908 - UK",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.grey),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildMapPreview(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildSectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CostumWidget.labelText(
                        context,
                        "Payment Method",
                        fontSize: 16,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.paypal,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Paypal Card",
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "**** **** 0696 4629",
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(color: AppColors.grey),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomSummary(context),
    );
  }

  Widget _buildSectionCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isEditing = false,
    TextEditingController? controller,
    VoidCallback? onEdit,
    VoidCallback? onSave,
    VoidCallback? onCancel,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.black, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: isEditing
              ? TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  autofocus: true,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    border: InputBorder.none,
                    hintText: "Enter phone number",
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: (title == "Add phone number")
                            ? AppColors.blue
                            : AppColors.black,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
        ),
        if (isEditing) ...[
          IconButton(
            onPressed: onCancel,
            icon: const Icon(Icons.close, color: Colors.red, size: 20),
          ),
          IconButton(
            onPressed: onSave,
            icon: const Icon(Icons.check, color: Colors.green, size: 20),
          ),
        ] else if (onEdit != null)
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onEdit,
            icon: const Icon(
              Icons.edit_outlined,
              color: AppColors.blue,
              size: 16,
            ),
            label: const Text(
              "CHANGE",
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        else
          const SizedBox(width: 48), // Match IconButton size
      ],
    );
  }

  Widget _buildMapPreview() {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(
            "asset/ChatGPT Image Feb 21, 2026, 08_31_34 PM.png", // Generic map placeholder
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBottomSummary(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSummaryRow("Subtotal", widget.totalAmount.toStringAsFixed(2)),
          const SizedBox(height: 12),
          _buildSummaryRow("Shopping", "\$40.90"),
          const SizedBox(height: 16),
          const Divider(height: 1, color: AppColors.lightGrey),
          const SizedBox(height: 16),
          _buildSummaryRow(
            "Total Cost",
            (widget.totalAmount + 40.90).toStringAsFixed(2),
            isTotal: true,
          ),
          const SizedBox(height: 24),
          CostumWidget.costumElevatedButton(
            context: context,
            title: "Payment",
            width: double.infinity,
            height: 55,
            borderRadius: 20,
            ontap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? AppColors.black : AppColors.grey,
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColors.black,
            fontSize: isTotal ? 20 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
