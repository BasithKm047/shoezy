import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/product/product_model.dart';
import 'package:shoezy_admin/fetures/core/id.dart';

class ProductServices {
  final firestore=FirebaseFirestore.instance.collection('Products');

  Future<void> addProduct({
    required ProductModel products
  }) async {
  try {
    final productId=createId();
    final nwProduct=products.copyWith(id: productId);

    await firestore.doc(productId).set(nwProduct.toJson());
    Logger().d("Product added successfully");
    Logger().d("Product data: ${products.toJson()}");
  } catch (e) {
    Logger().e("Error adding product: $e");
  }

// ignore: unused_element
Future<List<ProductModel>> getProduct() async {
   try {
    final snapshot = await firestore.get();

    return snapshot.docs.map((doc)=>ProductModel.fromJson(doc.data())).toList();
   }catch(e){
     Logger().e("Error fetching products: $e");
     rethrow;
   }
   
}

  }
  }