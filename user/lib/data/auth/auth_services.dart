import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoezy/data/models/user_model.dart';
import 'package:shoezy/utils/const/id.dart';

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
      UserCredential userCred = await firebaseAuth
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          );

      UserModel newModel = user.copyWith(id: userCred.user!.uid);
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
    await currentUser!.updateDisplayName(userName);
  }

  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }

  Future<void> signInWithGoogle({required bool isNewUser}) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw "Google sign-in aborted by user.";
      }

      final GoogleSignInAuthentication auth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );

      final userCredential = await firebaseAuth.signInWithCredential(credential);
      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final existingUser = await firestore
            .where('email', isEqualTo: firebaseUser.email)
            .get();

        bool isNewUser = existingUser.docs.isEmpty;
        if (isNewUser) {
          final newUser = UserModel(
            id: createId(),
            userName: firebaseUser.displayName ?? '',
            email: firebaseUser.email ?? '',
            phoneNumber: firebaseUser.phoneNumber ?? '',
            imagePath: '',
          );

          await firestore.doc(newUser.id).set(newUser.toMap());
        }
      } else {
        throw "Google sign-in failed";
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
}

