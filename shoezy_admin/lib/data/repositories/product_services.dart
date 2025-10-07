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
}
