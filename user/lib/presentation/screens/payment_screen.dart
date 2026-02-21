import 'package:flutter/material.dart';
import 'package:shoezy/utils/const/colors.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackroundColor,
      appBar: CostumWidget.backButton(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildSectionCard(
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
                      title: "rumenhussen@gmail.com",
                      subtitle: "Email",
                    ),
                    const SizedBox(height: 16),
                    _buildContactTile(
                      icon: Icons.phone_outlined,
                      title: "+88-692 -764-269",
                      subtitle: "Phone",
                    ),
                  ],
                ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
              Text(
                subtitle,
                style: const TextStyle(color: AppColors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        const Icon(Icons.edit_outlined, color: AppColors.grey, size: 20),
      ],
    );
  }

  Widget _buildMapPreview() {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage(
            "https://miro.medium.com/max/1200/1*q3Z7A6FawUBy68shW9323A.png", // Generic map placeholder
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.location_on, color: Colors.white, size: 20),
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
          _buildSummaryRow("Subtotal", "\$1250.00"),
          const SizedBox(height: 12),
          _buildSummaryRow("Shopping", "\$40.90"),
          const SizedBox(height: 16),
          const Divider(height: 1, color: AppColors.lightGrey),
          const SizedBox(height: 16),
          _buildSummaryRow("Total Cost", "\$1690.99", isTotal: true),
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
