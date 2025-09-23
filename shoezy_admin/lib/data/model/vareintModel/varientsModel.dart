

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
part 'varientsModel.freezed.dart';
part 'varientsModel.g.dart';

@freezed
// @JsonSerializable(explicitToJson: true)
abstract class Variantsmodel with _$Variantsmodel{
  factory Variantsmodel({
    String ? id,
    required List<String> color,
    required List<String> images,

  })=_Variantsmodel;

  factory Variantsmodel.fromJson(Map<String, dynamic>json)=>_$VariantsmodelFromJson(json);
  // factory Variantsmodel.create({
  //   required List<String> color,
  //   required List<String> images,
  // }) {
  //   return Variantsmodel(
  //     id: Uuid().v4(),
  //     color: color,
  //     images: images,
  //   );
  // }

  
}

