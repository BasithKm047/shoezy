import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shoezy_admin/data/model/categoryModel/category_model.dart';
import 'package:shoezy_admin/fetures/core/id.dart';

class CategoryServices {
  final db = FirebaseFirestore.instance.collection('categories');
  Future<void> addCategory(String name, String image) async {
    final category = CategoryModel(id: createId(), name: name, image: image);
    await db.add(category.toJson());
  }

  Future<void> deleteCategory(String id) async {
    try{
      await db.doc(id).delete();
    } catch (e) {
      // Logger().e('Error deleting category: $e');
      rethrow;
    }
  }

  Future<void> updateCategory(CategoryModel category) async {
    await db.doc(category.id).update(category.toJson());
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final snapshot = await db.get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return CategoryModel.fromJson(data).copyWith(id: doc.id);
      }).toList();
    } catch (e) {
      // Logger().e('Error fetching categories: $e');
      rethrow;
    }
  }

  Future<void> getCategorybyid(String id) async {
    await db.doc(id).get();
  }
  Future<List<CategoryModel>> searchCategories(String query) async {
    try {
      final snapshot = await db
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return CategoryModel.fromJson(data).copyWith(id: doc.id);
      }).toList();
    } catch (e) {
      // Logger().e('Error searching categories: $e');
      rethrow;
    }
  }
}
