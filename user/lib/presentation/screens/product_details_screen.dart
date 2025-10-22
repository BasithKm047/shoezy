import 'package:flutter/material.dart';
import 'package:shoezy/data/models/product/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel products;
  const ProductDetailsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Product Details Screen'),),
    );
  }
}