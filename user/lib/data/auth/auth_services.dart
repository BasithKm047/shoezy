import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoezy/data/models/user_model.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference<Map<String, dynamic>> _users =
      FirebaseFirestore.instance.collection('User');

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // ==========================
  // CREATE ACCOUNT
  // ==========================
  Future<void> createAccount({
    required UserModel user,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      final firebaseUser = credential.user;
      if (firebaseUser == null) {
        throw Exception("User creation failed");
      }

      final newUser = user.copyWith(id: firebaseUser.uid);

      await _users.doc(firebaseUser.uid).set(newUser.toMap());
    } on FirebaseAuthException catch (e) {
      throw _firebaseErrorMessage(e);
    }
  }

  // ==========================
  // SIGN IN
  // ==========================
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = credential.user;
      if (firebaseUser == null) {
        throw Exception("Login failed");
      }

      // 🔥 AFTER login check blocked
      final doc = await _users.doc(firebaseUser.uid).get();
      if (!doc.exists) {
        throw Exception("User data not found");
      }

      final userModel = UserModel.fromMap(doc.data()!);

      if (userModel.isBlocked!) {
        await _auth.signOut();
        throw Exception("Your account is blocked by Admin.");
      }

      return credential;
    } on FirebaseAuthException catch (e) {
      throw _firebaseErrorMessage(e);
    }
  }

  // ==========================
  // GOOGLE SIGN IN
  // ==========================
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception("Google sign-in aborted.");
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _auth.signInWithCredential(credential);

      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        throw Exception("Google sign-in failed");
      }

      final doc = await _users.doc(firebaseUser.uid).get();

      if (doc.exists) {
        final userModel = UserModel.fromMap(doc.data()!);

        if (userModel.isBlocked!) {
          await _auth.signOut();
          throw Exception("Your account is blocked by Admin.");
        }
      } else {
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

        await _users.doc(firebaseUser.uid).set(newUser.toMap());
      }
    } catch (e) {
      log("Google Sign-In Error: $e");
      rethrow;
    }
  }
  
  // ==========================
  // SIGN OUT
  // ==========================
   
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // ==========================
  // GET USER
  // ==========================
  Future<UserModel> getUser() async {
    final user = currentUser;
    if (user == null) throw Exception("User not authenticated");

    final doc = await _users.doc(user.uid).get();

    if (!doc.exists) {
      throw Exception("User document not found");
    }

    return UserModel.fromMap(doc.data()!);
  }

  // ==========================
  // UPDATE METHODS
  // ==========================
  Future<void> updatePhoneNumber(String phone) async {
    final uid = currentUser?.uid;
    if (uid == null) throw Exception("User not authenticated");

    await _users.doc(uid).update({'phoneNumber': phone});
  }

  Future<void> updateEmail({
  required String newEmail,
  required String password,
}) async {
  final user = currentUser;
  if (user == null) throw Exception("User not authenticated");

  // 🔥 Step 1: Reauthenticate
  final credential = EmailAuthProvider.credential(
    email: user.email!,
    password: password,
  );

  await user.reauthenticateWithCredential(credential);

  // 🔥 Step 2: Now update email
  await user.verifyBeforeUpdateEmail(newEmail);

  // 🔥 Step 3: Update Firestore
  await _users.doc(user.uid).update({'email': newEmail});
}

// ==========================
// Update Address
// ==========================

  Future<void> updateAddress(String address) async {
    final uid = currentUser?.uid;
    if (uid == null) throw Exception("User not authenticated");

    await _users.doc(uid).update({'address': address});
  }
 


// ==========================
// DELETE ACCOUNT
// ==========================

  Future<void> deleteAccount(String password) async {
    final user = currentUser;
    if (user == null) throw Exception("User not authenticated");

    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: password,
    );

    await user.reauthenticateWithCredential(credential);
    await _users.doc(user.uid).delete();
    await user.delete();
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // ==========================
  // ERROR HANDLER
  // ==========================
  String _firebaseErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'weak-password':
        return 'Password should be at least 6 characters';
      case 'invalid-email':
        return 'Invalid email address';
      case 'user-not-found':
        return 'No account found';
      case 'wrong-password':
        return 'Incorrect password';
      default:
        return e.message ?? 'Authentication failed';
    }
  }
}