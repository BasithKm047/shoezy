import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:shoezy/data/models/cart/cart_model.dart';

class CartRepository {
  // Add your repository methods and properties here

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CartRepository();

  String get uid {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception("User not logged in");
    }
    return user.uid;
  }

  CollectionReference get _cartCollection =>
      _firestore.collection('users').doc(uid).collection('cart');

  Future<void> addToCart(CartModel cartData) async {
    Logger().i("DEBUG: addToCart START");
    try {
      final q = await _cartCollection
          .where('productId', isEqualTo: cartData.productId)
          .where('color', isEqualTo: cartData.color)
          .where('size', isEqualTo: cartData.size)
          .limit(1)
          .get();
      Logger().i("DEBUG: Query found ${q.docs.length} docs");

      if (q.docs.isNotEmpty) {
        final doc = q.docs.first;
        final existingQty =
            (doc.data() as Map<String, dynamic>)['quantity'] as int? ?? 0;
        await doc.reference.update({
          'quantity': existingQty + cartData.quantity,
        });
        Logger().i("🔥 Repository addToCart: Updated existing item quantity");
        Logger().i("UID: $uid, ProductId: ${cartData.productId}");
      } else {
        final newDoc = _cartCollection.doc();
        // Use copyWith to set the firestore doc id and the current uid
        // Ensure productId from cartData is preserved
        final data = cartData.copyWith(id: newDoc.id, userId: uid).toJson();
        await newDoc.set(data);

        Logger().i(
          "🔥 Repository addToCart: Created new cart item ${newDoc.id} for product ${cartData.productId}",
        );
        Logger().i("UID: $uid");
      }
      Logger().i("DEBUG: addToCart END");
    } catch (e) {
      Logger().e("Error in addToCart: $e");
      rethrow;
    }
  }

  Future<List<CartModel>> getCartItems() async {
    final query = await _cartCollection.get();
    return query.docs.map((doc) {
      final map = Map<String, dynamic>.from(doc.data() as Map);
      // ensure id is included
      map['id'] = doc.id;
      Logger().i("🔥 Repository getCartItems called");
      return CartModel.fromJson(map);
    }).toList();
  }

  // Real-time stream for UI
  Stream<List<CartModel>> cartItemsStream() {
    return _cartCollection.snapshots().map((snap) {
      return snap.docs.map((doc) {
        final map = Map<String, dynamic>.from(doc.data() as Map);
        map['id'] = doc.id;
        return CartModel.fromJson(map);
      }).toList();
    });
  }

  Future<void> removeFromCart(String cartItemId) async {
    await _cartCollection.doc(cartItemId).delete();
  }

  Future<void> clearCart() async {
    const batchLimit = 500;
    QuerySnapshot snapshot = await _cartCollection.limit(batchLimit).get();
    while (snapshot.docs.isNotEmpty) {
      final batch = _firestore.batch();
      for (var doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
      // get next batch
      snapshot = await _cartCollection.limit(batchLimit).get();
    }
  }

  Future<void> updateQuantity(String cartItemId, int newQuantity) async {
    try {
      final docRef = _cartCollection.doc(cartItemId);
      await docRef.update({'quantity': newQuantity});
      Logger().i(
        "🔥 Repository updateQuantity: Success (ID: $cartItemId, Qty: $newQuantity)",
      );
    } catch (e) {
      Logger().e("Error in updateQuantity: $e");
      rethrow;
    }
  }
}
