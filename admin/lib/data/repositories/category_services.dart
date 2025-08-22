import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoezy_admin/data/model/categoryModel/category_model.dart';
import 'package:uuid/uuid.dart';

class CategoryServices {
  final db = FirebaseFirestore.instance;
  Future<void> addCategory(String type, List<String> name) async {
    final id = Uuid().v4();
    final category = CategoryModel(id: id, name: name, type: type);
    await db.collection('categories').doc(id).set(category.toJson());
  }

  Future<void> deleteCategory(String id) async {
    await db.collection('categories').doc(id).delete();
  }

  Future<void> updateCategory(String name, String type, String id) async {
    await db.collection('categories').doc(id).update({
      'name': name,
      'type': type,
    });
  }

  Stream<List<CategoryModel>> getCategories() {
    return db
        .collection('categories')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => CategoryModel.fromJson(doc.data()))
              .toList(),
        );
  }
}
