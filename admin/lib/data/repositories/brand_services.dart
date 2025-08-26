import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/brand/brand_model.dart';
import 'package:shoezy_admin/fetures/core/id.dart';

class BrandServices {
  final db = FirebaseFirestore.instance.collection('brands');
  Future<void> addBrand({
    required String name,
    required List<String> image,
  }) async {
    try {
     
      final brand = BrandModel(id: createId(), name: name, imageUrl: image);
      await db.doc(brand.id).set(brand.toJson());
    } catch (e) {
      Logger().e("Error adding brand: $e");
    }
  }

  Future<void> updateBrand({
    required String id,
    required String name,
    required List<String> image,
  }) async {
    final brand = BrandModel(id: id, name: name, imageUrl: image);
    await db.doc(brand.id).update(brand.toJson());
  }

  Future<void> deleteBrand(String id) async {
    await db.doc(id).delete();
  }

  Future<List<BrandModel>> getBrands() async {
    final snapshot = await db.get();
    return snapshot.docs
        .map((doc) => BrandModel.fromJson(doc.data()))
        .toList();
  } 
}
