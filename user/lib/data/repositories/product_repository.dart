import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/web.dart';
import 'package:shoezy/data/models/product/product_model.dart';

class ProductRepository {
  final productsDb = FirebaseFirestore.instance.collection('products');
  DateTime _parseDate(dynamic date) {
  if (date is Timestamp) {
    return date.toDate();
  } else if (date is String) {
    return DateTime.tryParse(date) ?? DateTime.now();
  } else {
    return DateTime.now();
  }
}


  Future<List<ProductModel>> getProducts() async {
    try {
      final products = await productsDb.get();
      return products.docs.map((p) {
        final data = p.data();
        data['id'] = p.id;


        final List<dynamic> varaints = data['variants'] ?? [];
        final List<dynamic> sizeStock = data['sizeStock'] ?? [];

        final colors = varaints.expand((v) {
          final List<dynamic> colorList = v['color'] ?? [];
          return colorList.map((c) => c.toString());
        }).toList();

        final images = varaints.expand((v) {
          final List<dynamic> imageList = v['images'] ?? [];
          return imageList.map((img) => img.toString());
        }).toList();

        final sizes = sizeStock.map((s) => s['size'].toString()).toList();
        final stocks = sizeStock.map((s) => s['stock'].toString()).toList();

        return ProductModel(
          id: p.id,
          productName: data['productName'],
          brandName: data['brandName'],
          categoryName: data['categoryName'],
          price: data['price'],
          description: data['description'],
          color: colors,
          size: sizes,
          image: images,
          stock: stocks,
          tag: data['tag'],
          gender: data['gender'],
          createdAt: _parseDate(data['createdAt']),
        );
      }).toList();
    } catch (e) {
      Logger().d('Error fetching products: $e');
      rethrow;
    }
  }
}
