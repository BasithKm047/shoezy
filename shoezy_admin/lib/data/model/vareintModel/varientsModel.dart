

import 'package:freezed_annotation/freezed_annotation.dart';
part 'varientsModel.freezed.dart';
part 'varientsModel.g.dart';

@freezed
abstract class Variantsmodel with _$Variantsmodel{
  factory Variantsmodel({
    String ? id,
    required List<String> size,
    required List<String> color,
    required int stock,
    required List<String> images,

  })=_Variantsmodel;

  factory Variantsmodel.fromJson(Map<String, dynamic>json)=>_$VariantsmodelFromJson(json);
  
  
}

