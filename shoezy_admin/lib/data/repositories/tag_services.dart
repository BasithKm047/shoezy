import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/tag/tag_model.dart';
import 'package:shoezy_admin/fetures/core/id.dart';

// ignore: unused_field
class TagServices {
  final db = FirebaseFirestore.instance.collection('tags');

  Future<void> addTags(TagModel tagsmodel) async {
    try {
      final id = createId();
      final tags = TagModel(name: tagsmodel.name);
      await db.doc(id).set(tags.toJson());
    } catch (e) {
      Logger().d('Error adding tags: $e');
      rethrow;
    }
  }

  Future<List<TagModel>> getTags() async {
    try {
      final tags = await db.get();
      return tags.docs.map((e) {
        final data = e.data();
        return TagModel.fromJson(data).copyWith(id: e.id);
      }).toList();
    } catch (e) {
      Logger().d('Error fetching tags: $e');
      rethrow;
    }
  }

  Future<void> updateTags(TagModel tagsmodel) async {
    try {
      await db.doc(tagsmodel.id).update(tagsmodel.toJson());
    } catch (e) {
      Logger().d('Error updating tags: $e');
      rethrow;
    }
  }

  Future<void> deleteTags(String id) async {
    try {
      await db.doc(id).delete();
    } catch (e) {
      Logger().d('Error deleting tags: $e');
      rethrow;
    }
  }
Future<List<TagModel>> searchTag(String query) async {
  try {
    final tags = await db
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: '$query\uf8ff')
        .get();

    return tags.docs.map((tag) {
      final data = tag.data();
      return TagModel.fromJson(data).copyWith(id: tag.id);
    }).toList();
  } catch (e) {
    Logger().e('Error searching tags: $e');
    rethrow;
  }
}

}
