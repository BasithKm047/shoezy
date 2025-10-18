import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:shoezy/data/models/brand_model.dart';

class BrandRepository {
  final firestore = FirebaseFirestore.instance.collection('brands');

  Future<List<BrandModel>> getBrands() async {
    try {
      final brands = await firestore.get();

      return brands.docs.map((b) {
        final data = b.data();
        return BrandModel.fromMap(data, b.id);
      }).toList();
    } catch (e) {
      Logger().d('Error fetching brands: $e');
      rethrow;
    }
  }
}
