import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/web.dart';
import 'package:shoezy/data/models/category/category_model.dart';

class CategoryRepository {
  final fireStore = FirebaseFirestore.instance.collection('categories');

  Future<List<CategoryModel>> getCategories() async {
    try {
      final categories = await fireStore.get();
      return categories.docs.map((c) {
        final data = c.data();
        return CategoryModel.fromJson(data).copyWith(id: c.id );
      }).toList();
    } catch (e) {
      Logger().d('Error fetching categories: $e');
      rethrow;
    }
  }
}
