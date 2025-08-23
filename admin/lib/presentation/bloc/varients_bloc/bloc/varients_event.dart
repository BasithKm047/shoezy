part of 'varients_bloc.dart';

@freezed
abstract class VariantsEvent with _$VariantsEvent {
  const factory VariantsEvent.imageUpload(List<Uint8List> image)=_ImageUploadedEvent;
  const factory VariantsEvent.imageRemoved(Uint8List removedImage)=_ImageRemoved;
  const factory VariantsEvent.addVariants(Variantsmodel varaints)=_AddVaraints;
  const factory VariantsEvent.getVariants()=_Getvariants;
  const factory VariantsEvent.resetImgae()=_ResetImage;

 }


