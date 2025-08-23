

import 'package:freezed_annotation/freezed_annotation.dart';
part 'varientsModel.freezed.dart';
part 'varientsModel.g.dart';

@freezed
abstract class Variantsmodel with _$Variantsmodel{
  factory Variantsmodel({
    String ? id,
    String ? brandId,
    required String color,
    required List<String>images,
    
    required List<String> size,
    required String stock,
  })=_Variantsmodel;

  factory Variantsmodel.fromJson(Map<String, dynamic>json)=>_$VariantsmodelFromJson(json);
  
  
}

