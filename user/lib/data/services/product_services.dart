import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class ProductServices {
  final productsDb = FirebaseFirestore.instance.collection('products');


  Future<List<Map<String, dynamic>>> fetchProducts() async {
    try {
      final snapshot = await productsDb.get();
      print('Firestore snapshot: ${snapshot.docs.length} docs fetched');
      return snapshot.docs.map((doc) {
           return doc.data();
        
      }).toList();
    } catch (e,stackTrace) {
      Logger().d('Error Fetching products: ',error: e,stackTrace: stackTrace);
      return [];
    }
  }

}