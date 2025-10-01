import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoezy_admin/data/model/user/userModel.dart';

class UserServices {
  final users=FirebaseFirestore.instance.collection('User');

  // fetch users
  Future<List<Usermodel>>fetchUsers()async{
    try{
  
      final snapshot=await users.get();
      return snapshot.docs.map((doc){
        final data=doc.data();
        return Usermodel.fromJson(data).copyWith(id: doc.id);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
  // user by id
  Future<Usermodel> getUserById(String id) async {
    try {
      final snapshot = await users.doc(id).get();
      if (snapshot.exists) {
        return Usermodel.fromJson(snapshot.data()!).copyWith(id: snapshot.id);
      }
      return Usermodel(id: '', userName: '', email: '', phone: '', address: '', profileImage: '', isAdmin: false, createdAt: DateTime.now());
    } catch (e) {
      rethrow;
    }

  }
  

  //Search Users
  Future<List<Usermodel>> searchUsers(String query) async {
    try {
      final snapshot = await users
          .where('userName', isGreaterThanOrEqualTo: query)
          .where('userName', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Usermodel.fromJson(data).copyWith(id: doc.id);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

// delete user
  Future<void> deleteUser(String id) async {
    try{
      await users.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  

}