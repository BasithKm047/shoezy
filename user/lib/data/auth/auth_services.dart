import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoezy/data/models/user_model.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('User');
  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<void> createAccount({required UserModel user,required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      UserModel newModel = user.copyWith(id: createId());
      log(newModel.id.toString());
    log(newModel.toString());
      await firestore.doc(newModel.id).set(newModel.toMap());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
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
  Future<void>signInWithGoogle()async{
    try{
     
 final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
 if(googleUser==null){
    throw Exception("Google sign-in aborted by user.");
 }
 
 final GoogleSignInAuthentication auth=await googleUser.authentication;
 if(auth==null){
  log(auth.toString());
 }
  final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );
      log(auth.accessToken.toString());
      log(auth.idToken.toString());
    final userCredential = await firebaseAuth.signInWithCredential(credential);
 final firebaseUser=userCredential.user;
 
      if (firebaseUser != null) {
        // Check if user already exists in Firestore
        final existingUser = await firestore.where('email', isEqualTo: firebaseUser.email).get();

        if (existingUser.docs.isEmpty) {
          final newUser = UserModel(
            id: createId(),
            userName: firebaseUser.displayName ?? '',
            email: firebaseUser.email ?? '',
            phoneNumber: firebaseUser.phoneNumber ?? '',
            imagePath: '', 
          );

          await firestore.doc(newUser.id).set(newUser.toMap());
        }
      }
   

    } catch (e) {
      log("Google Sign-In Error: $e");
      rethrow;

    }
  }
}


String createId() {
  return FirebaseFirestore.instance.collection("hj").doc().id;
}
