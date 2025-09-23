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
  const factory VariantsState.variantAdded()=_VariantAdded;
  const factory VariantsState.variantRemoved()=_VariantRemoved;
  const factory VariantsState.variantUpdated()=_VariantUpdated;
  const factory VariantsState.variantSearched(List<Variantsmodel> variants)=_VariantSearched;
  const factory VariantsState.showFieldsState()=_ShowFieldsState;
  const factory VariantsState.hideFieldsState()=_HideFieldsState;
  const factory VariantsState.addedSizeStockState(List<SizeStockModel> sizeStock)=_AddedSizeStockState;
  const factory VariantsState.removedSizeStockState(List<SizeStockModel> sizeStock)=_RemovedSizeStockState;

  const factory VariantsState.data({
    required List<Uint8List> images,
    required List<Variantsmodel> variants,
    @Default(false) bool showFields,  // If you need to track show/hide fields too
  }) = _Data;

}
