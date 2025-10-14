import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/product/product_model.dart';
import 'package:shoezy_admin/fetures/core/id.dart';

class ProductServices {
  final firestoreCollection = FirebaseFirestore.instance.collection('products');

  Future<void> addProduct({required ProductModel products}) async {
    try {
      final productId = createId();
      final nwProduct = products.copyWith(id: productId);

      await firestoreCollection.doc(productId).set(nwProduct.toJson());
      Logger().d("Product added successfully");
      Logger().d("Product data: ${nwProduct.toJson()}");
    } catch (e) {
      Logger().e("Error adding product: $e");
    }
  }

  Future<void> updateProduct({required ProductModel product}) async {
    try {
      await firestoreCollection.doc(product.id).update(product.toJson());
      Logger().d("Product updated successfully");
    } catch (e) {
      Logger().e("Error updating product: $e");
      rethrow;
    }
  }

  Future<List<ProductModel>> getProduct() async {
    try {
      final snapshot = await firestoreCollection.get();

      return snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      Logger().e("Error fetching products: $e");
      rethrow;
    }
  }

  Future<void> deleteProduct({required String id}) async {
    try {
      await firestoreCollection.doc(id).delete();
      Logger().d("Product deleted successfully");
    } catch (e) {
      Logger().e("Error deleting product: $e");
      rethrow;
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final lowerQuery = query.toLowerCase().trim();

      final nameSnapshot = await firestoreCollection
          .where('productName', isGreaterThanOrEqualTo: query)
          .where('productName', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      final brandSnapshot = await firestoreCollection
          .where('brandName', isGreaterThanOrEqualTo: query)
          .where('brandName', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      final categorySnapshot = await firestoreCollection
          .where('categoryName', isGreaterThanOrEqualTo: query)
          .where('categoryName', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      final allDocs = {
        ...nameSnapshot.docs,
        ...brandSnapshot.docs,
        ...categorySnapshot.docs,
      };

      final allProducts = allDocs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      final filteredProducts = allProducts.where((product) {
        final name = product.productName.toLowerCase();
        final brand = product.brandName.toLowerCase();
        final category = product.categoryName.toLowerCase();

        final hasMatchingVariant = product.variants.any((variant) {
          final color = variant.color.toString().toLowerCase();
          return color.contains(lowerQuery);
        });

        return name.contains(lowerQuery) ||
            brand.contains(lowerQuery) ||
            category.contains(lowerQuery) ||
            hasMatchingVariant;
      }).toList();

      final uniqueProducts = {
        for (var product in filteredProducts) product.id!: product,
      }.values.toList();

      return uniqueProducts;
    } catch (e) {
      print('Error while searching products: $e');
      return [];
    }
  }
}
