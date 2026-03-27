 
 
import 'package:freezed_annotation/freezed_annotation.dart';
part 'variant_model.freezed.dart';
part 'variant_model.g.dart';

@freezed
 abstract class Variantsmodel with _$Variantsmodel{
 const factory Variantsmodel({
    String ? id,
    required String color,
    required List<String> images,

  })=_Variantsmodel;
  factory Variantsmodel.fromJson(Map<String, dynamic>json)=>_$VariantsmodelFromJson(json);

 }
