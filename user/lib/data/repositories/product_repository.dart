
import 'package:logger/logger.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/data/services/product_services.dart';

class ProductRepository {
  final _service = ProductServices();

  Future<List<ProductModel>> getProducts() async {
    try {
      final productList = await _service.fetchProducts();

      return productList.map((product) {
        return ProductModel.fromJson(product);
      }).toList();
    } catch (e, stackTrace) {
      Logger().d(
        'Error Getting Product list from firebase',
        error: e,
        stackTrace: stackTrace,
      );
      return [];
    }
  }
}
