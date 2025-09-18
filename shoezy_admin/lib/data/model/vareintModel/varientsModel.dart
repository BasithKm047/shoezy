

import 'package:freezed_annotation/freezed_annotation.dart';
part 'varientsModel.freezed.dart';
part 'varientsModel.g.dart';

@freezed
abstract class Variantsmodel with _$Variantsmodel{
  factory Variantsmodel({
    // String ? id,
    required List<String> color,
    required List<String> images,
    required List<Map<String, dynamic>> sizeStock,

  })=_Variantsmodel;

  factory Variantsmodel.fromJson(Map<String, dynamic>json)=>_$VariantsmodelFromJson(json);
  
  
}

