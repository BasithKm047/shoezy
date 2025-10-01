import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/brand/brand_model.dart';
import 'package:shoezy_admin/fetures/core/id.dart';

class BrandServices {
  final db = FirebaseFirestore.instance.collection('brands');
  Future<void> addBrand({required String name, required String image}) async {
    try {
      final id = createId();
      final brand = BrandModel(id: id, name: name, imageUrl: image);
      await db.doc(id).set(brand.toJson());
    } catch (e) {
      Logger().e("Error adding brand: $e");
    }
  }

  Future<void> updateBrand({required BrandModel brand}) async {
    try {
      await db
          .doc(brand.id)
          .update(
            brand.toJson(),
          ); 
    } catch (e) {
      Logger().e("Error updating brand: $e");
      rethrow;
    }
  }

  Future<void> deleteBrand(String id) async {
    try {
      await db.doc(id).delete();
    } catch (e) {
      Logger().e("Error deleting brand: $e");
    }
  }

  Future<List<BrandModel>> getBrands() async {
    try {
      final snapshot = await db.get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return BrandModel.fromJson(data).copyWith(id: doc.id);
      }).toList();
    } catch (e) {
      Logger().d("Error Fetching Brands$e");
      rethrow;
    }
  }

  Future<BrandModel?> getBrandById(String id) async {
    try {
      final snapshot = await db.doc(id).get();
      if (snapshot.exists) {
        return BrandModel.fromJson(snapshot.data()!).copyWith(id: snapshot.id);
      }
      return null;
    } catch (e) {
      Logger().e("Error fetching brand by id: $e");
      rethrow;
    }
  }
  Future<List<BrandModel>> searchBrands(String query) async {
    try {
      final snapshot = await db
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return BrandModel.fromJson(data).copyWith(id: doc.id);
      }).toList();
    } catch (e) {
      Logger().e("Error searching brands: $e");
      rethrow;
    }
  }
}
