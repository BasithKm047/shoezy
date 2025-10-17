import 'package:flutter/material.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/presentation/widgets/product_grid_card.dart';
import 'package:shoezy/utils/const/colors.dart';

class ProductListingScreen extends StatelessWidget {
  final List<ProductModel> products;
  final String title;

  const ProductListingScreen({
    super.key,
    required this.products,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,

          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.black
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: products.isEmpty
            ? const Center(
                child: Text(
                  "No products available",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 280,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductGridCard(
                    product: product,
                    ontap: () {
                      // Navigate to product details (optional)
                    },
                  );
                },
              ),
      )
    );
  }
}
