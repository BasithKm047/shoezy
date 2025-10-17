import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoezy/data/models/product/product_model.dart';

class FavoritesRepository {
  final String userId;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FavoritesRepository({required this.userId});

  Future<void> addFavorite(ProductModel product) async {
    final favRef = firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(product.id);

    await favRef.set({
      'product': product.toJson(), // ✅ FIXED
      'addedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> removeFavorite(String productId) async {
    final favRef = firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(productId);
    await favRef.delete();
  }

  Future<bool> isFavorite(String productId) async {
    final favRef = firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(productId);
    final snapshot = await favRef.get();
    return snapshot.exists;
  }

  Future<List<ProductModel>> getFavorites() async {
    final query = await firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .get();

    return query.docs
        .map((doc) => ProductModel.fromJson(doc['product']))
        .toList();
  }

  Future<void> toggleFavorite(ProductModel product) async {
    final isFav = await isFavorite(product.id!);
    if (isFav) {
      await removeFavorite(product.id!);
    } else {
      await addFavorite(product);
    }
  }
}
