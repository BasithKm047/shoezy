part of 'varients_bloc.dart';

@freezed
abstract class VarientsState with _$VarientsState {
  const factory VarientsState.inintial() = _Initail;
  const factory VarientsState.loading() = _Loading;
  const factory VarientsState.success()=_Success;
   const factory VarientsState.imageAddedState( List<Uint8List> images) =_ImageAddedState;  
  const factory VarientsState.failure(String error) = _Failure;
  const factory VarientsState.imageRemovedState(List<Uint8List> image)=_ImageRemovedState;
}
