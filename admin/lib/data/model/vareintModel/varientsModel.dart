

import 'package:freezed_annotation/freezed_annotation.dart';
part 'varientsModel.freezed.dart';
part 'varientsModel.g.dart';

@freezed
// @JsonSerializable()
abstract class Varientsmodel with _$Varientsmodel{
  factory Varientsmodel({
    required String color,
    required List<String>images,
    required int size,
    required List<int>stock,
  })=_Varientsmodel;

  factory Varientsmodel.fromJson(Map<String, dynamic>json)=>_$VarientsmodelFromJson(json);
  
}

