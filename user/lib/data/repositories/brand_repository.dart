import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:shoezy/data/models/brand_model.dart';

class BrandRepository {
  final firestore = FirebaseFirestore.instance.collection('brands');

  // final List<BrandModel>brands=[
  //   BrandModel(
  //     id: '1',
  //     name: 'Nike',
  //     imageUrl: './asset/brand-nike-svgrepo-com.svg',
  //   ),
  //   BrandModel(
  //     id: '2',
  //     name: 'Adidas',
  //     imageUrl: './asset/adidas-svgrepo-com.svg',
  //   ),
  //   BrandModel(
  //     id: '3',
  //     name: 'Puma',
  //     imageUrl: './asset/puma-logo.svg',
  //   ),
  //   BrandModel(
  //     id: '4',
  //     name: 'Converse',
  //     imageUrl: './asset/converse-logo3-logo-svgrepo-com.svg',
  //   ),

  // ];

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
