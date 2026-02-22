import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoezy/data/models/user_model.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('User');

  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<void> createAccount({
    required UserModel user,
    required String password,
  }) async {
    try {
      final UserCredential userCred = await firebaseAuth
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          );

      final firebaseUser = userCred.user;
      if (firebaseUser == null) throw 'User creation failed';
      UserModel newModel = user.copyWith(id: firebaseUser.uid);
      await firestore.doc(newModel.id).set(newModel.toMap());
    } on FirebaseAuthException catch (e) {
      throw _firebaseErrorMessage(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final snapshot = await firestore.where('email', isEqualTo: email).get();
      if (snapshot.docs.isEmpty) {
        throw 'No account found with this email';
      }
      final userData = snapshot.docs.first.data();
      final userModel = UserModel.fromMap(userData);
      if (userModel.isBlocked == true) {
        return throw 'Your account is blocked by Admin.';
      }
      return await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _firebaseErrorMessage(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUsername({required String userName}) async {
    final user = currentUser;
    if (user == null) throw 'User not authenticated';
    await user.updateDisplayName(userName);
  }

  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    final user = currentUser;
    if (user == null) throw 'User not authenticated';

    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await user.reauthenticateWithCredential(credential);
    await user.delete();
    await firebaseAuth.signOut();
  }

  Future<void> signInWithGoogle({required bool isNewUser}) async {
    try {
      final existingUser = await firestore
          .where('email', isEqualTo: firebaseAuth.currentUser?.email)
          .get();

      if (existingUser.docs.isNotEmpty &&
          existingUser.docs.first['isBlocked'] == true) {
        throw 'Your account has been blocked by admin';
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          throw "Google sign-in aborted by user.";
        }

        final GoogleSignInAuthentication auth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken,
          idToken: auth.idToken,
        );

        final userCredential = await firebaseAuth.signInWithCredential(
          credential,
        );
        final firebaseUser = userCredential.user;

        if (firebaseUser != null) {
          final existingDocs = await firestore
              .where('email', isEqualTo: firebaseUser.email)
              .get();

          if (existingDocs.docs.isNotEmpty) {
            final doc = existingDocs.docs.first;
            final data = doc.data();

            // If the document is NOT named after the UID, migrate it
            if (doc.id != firebaseUser.uid) {
              log(
                "Migrating user data from old ID ${doc.id} to UID ${firebaseUser.uid}",
              );

              // 1. Create new document with UID
              await firestore.doc(firebaseUser.uid).set(data);

              // 2. Update the 'id' field inside the document to the UID
              await firestore.doc(firebaseUser.uid).update({
                'id': firebaseUser.uid,
              });

              // 3. Delete the old orphaned document
              await firestore.doc(doc.id).delete();
            } else {
              // Even if already migrated, ensure 'id' field is synced
              await firestore.doc(firebaseUser.uid).update({
                'id': firebaseUser.uid,
              });
            }
          } else {
            // New User flow
            final newUser = UserModel(
              id: firebaseUser.uid,
              userName: firebaseUser.displayName ?? '',
              email: firebaseUser.email ?? '',
              phoneNumber: '',
              imagePath: '',
              isAdmin: false,
              isBlocked: false,
              address: '',
            );

            await firestore.doc(newUser.id).set(newUser.toMap());
          }
        } else {
          throw "Google sign-in failed";
        }
      }
    } catch (e) {
      log("Google Sign-In Error: $e");
      rethrow;
    }
  }

  String _firebaseErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'weak-password':
        return 'Password should be at least 6 characters';
      case 'invalid-email':
        return 'Please enter a valid email address';
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      default:
        return e.message ?? 'Authentication failed';
    }
  }

  Future<UserModel> getUser() async {
    try {
      final user = currentUser;
      if (user == null) throw 'User not authenticated';
      final uid = user.uid;

      // Force server fetch to ensure we get latest phone/address updates
      var snapshot = await firestore
          .doc(uid)
          .get(const GetOptions(source: Source.server));

      // FALLBACK MIGRATION: If no document exists by UID, look for it by email
      if (!snapshot.exists) {
        log("No document found for UID $uid, checking by email ${user.email}");
        final emailMatch = await firestore
            .where('email', isEqualTo: user.email)
            .get(const GetOptions(source: Source.server));

        if (emailMatch.docs.isNotEmpty) {
          final oldDoc = emailMatch.docs.first;
          if (oldDoc.id != uid) {
            log("Migrating orphaned doc ${oldDoc.id} to UID $uid");
            final data = oldDoc.data();
            await firestore.doc(uid).set(data);
            await firestore.doc(uid).update({'id': uid});
            await firestore.doc(oldDoc.id).delete();

            // Re-fetch the newly created document from server
            snapshot = await firestore
                .doc(uid)
                .get(const GetOptions(source: Source.server));
          }
        }
      }

      final data = snapshot.data();
      if (data == null) throw 'User data is empty';

      return UserModel.fromMap(data);
    } catch (e) {
      log("AuthServices.getUser Error: $e");
      rethrow;
    }
  }

  Future<void> updatePhoneNumber({required String phoneNumber}) async {
    final uid = currentUser?.uid;
    if (uid == null) throw 'User not authenticated';
    await firestore.doc(uid).update({'phoneNumber': phoneNumber});
  }

  Future<void> updateAddress({required String address}) async {
    final uid = currentUser?.uid;
    if (uid == null) throw 'User not authenticated';
    await firestore.doc(uid).update({'address': address});
  }

  Future<void> updateProfile({
    required String userName,
    required String phoneNumber,
    required String imagePath,
    required String address,
  }) async {
    final user = currentUser;
    if (user == null) throw 'User not authenticated';

    await user.updateDisplayName(userName);
    await firestore.doc(user.uid).update({
      'userName': userName,
      'phoneNumber': phoneNumber,
      'imagePath': imagePath,
      'address': address,
    });
  }
}
