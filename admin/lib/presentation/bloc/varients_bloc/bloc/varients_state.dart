part of 'varients_bloc.dart';

@freezed
abstract class VariantsState with _$VariantsState {
  const factory VariantsState.inintial() = _Initail;
  const factory VariantsState.loading() = _Loading;
  const factory VariantsState.success()=_Success;
   const factory VariantsState.imageAddedState( List<Uint8List> images) =_ImageAddedState;  
  const factory VariantsState.failure(String error) = _Failure;
  const factory VariantsState.imageRemovedState(List<Uint8List> image)=_ImageRemovedState;
  const factory VariantsState.variantsLoaded(List<Variantsmodel>variants)=_VariantsLoaded;
}
