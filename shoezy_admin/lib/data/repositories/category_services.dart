import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

import 'package:shoezy_admin/data/model/categoryModel/category_model.dart';
import 'package:shoezy_admin/fetures/core/id.dart';

class CategoryServices {
  final db = FirebaseFirestore.instance.collection('categories');
  Future<void> addCategory(String name, String image) async {
    final category = CategoryModel(id: createId(), name: name, image: image);
    await db.add(category.toJson());
  }

  Future<void> deleteCategory(String id) async {
    await db.doc(id).delete();
  }

  Future<void> updateCategory(
    String name,
    String image,
    String id,
  ) async {
    await db.doc(id).update({'name': name, 'image': image});
  }


Future<List<CategoryModel>> getCategories() async {
    try {
      final snapshot = await db.get();
      return snapshot.docs.map((doc) => CategoryModel.fromJson(doc.data())).toList();
    } catch (e) {
      Logger().e('Error fetching categories: $e');
      rethrow;
    }
  }

  Future<void> getCategorybyid(String id) async {
    await db.doc(id).get();
  }
}
