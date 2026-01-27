// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:logger/logger.dart';
// import 'package:shoezy/data/models/product/product_model.dart';

// class FavoritesRepository {
//   final String userId;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   FavoritesRepository({required this.userId});
//  CollectionReference get _favRef => firestore
//       .collection('users')
//       .doc(userId)
//       .collection('favorites');

//   Future<void> addFavorite(String  productId) async {
//  await _favRef.doc(productId).set({
//       'addedAt': FieldValue.serverTimestamp(),
//     });
    
//   }

//  Future<void> removeFavorite(String productId) async {
//     await _favRef.doc(productId).delete();
//   }

//   Future<bool> isFavorite(String productId) async {
//     final favRef = firestore
//         .collection('users')
//         .doc(userId)
//         .collection('favorites')
//         .doc(productId);
//     final snapshot = await favRef.get();
//     return snapshot.exists;
//   }

//   Future<List<String>> getFavoriteIds() async {
//     final query = await _favRef.get();
//     return query.docs.map((e) => e.id).toList();
//   }

//   Future<void> toggleFavorite(ProductModel product) async {
//     final isFav = await isFavorite(product.id!);
//     if (isFav) {
//       await removeFavorite(product.id!);
//     } else {
//       await addFavorite(product.id!);
//     }
//     Logger().d(
//         '${isFav ? 'Removed from' : 'Added to'} favorites: ${product.id}');
//   }
// }
