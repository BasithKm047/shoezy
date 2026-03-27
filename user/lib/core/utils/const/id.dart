import 'package:cloud_firestore/cloud_firestore.dart';

String createId() {
  return FirebaseFirestore.instance.collection("hj").doc().id;
}
