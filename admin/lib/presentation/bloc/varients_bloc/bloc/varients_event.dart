part of 'varients_bloc.dart';

@freezed
abstract class VarientsEvent with _$VarientsEvent {
  const factory VarientsEvent.imageUpload(List<Uint8List> image)=_ImageUploadedEvent;
  const factory VarientsEvent.imageRemoved(Uint8List removedImage)=_ImageRemoved;
 }


