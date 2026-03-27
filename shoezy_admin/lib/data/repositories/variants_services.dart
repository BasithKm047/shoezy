import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';

class VariantsServices {
  final fireStore = FirebaseFirestore.instance.collection('variants');

  Future<void> addVariant({
    required String color,
    required List<String> images,
    required List<String> size,
    
  }) async {
    try {
      // final variants = Variantsmodel(
      //   color: [color],
      //   // id: createId(),
      //   // sizeStock: 
      //   images: images,
      // );
      // await fireStore.add(variants.toJson());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Variantsmodel>> getVaraints() async {
    try {
      final snapshot = await fireStore.get();
      final varaintsList = snapshot.docs
          .map((doc) => Variantsmodel.fromJson(doc.data()))
          .toList();
      return varaintsList;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
