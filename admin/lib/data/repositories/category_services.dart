import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoezy_admin/data/model/categoryModel/category_model.dart';
import 'package:shoezy_admin/fetures/core/id.dart';

class CategoryServices {
  final db = FirebaseFirestore.instance.collection('categories');
  Future<void> addCategory(String name, List<String> image) async {
    final category = CategoryModel(id: createId(), name: name, image: image);
    await db.add(category.toJson());
  }

  Future<void> deleteCategory(String id) async {
    await db.doc(id).delete();
  }

  Future<void> updateCategory(
    String name,
    List<String> image,
    String id,
  ) async {
    await db.doc(id).update({'name': name, 'image': image});
  }



  Stream<List<CategoryModel>> getCategories() {
    return db.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()))
          .toList();
    });
  }

  Future<void> getCategorybyid(String id) async {
    await db.doc(id).get();
  }
}
