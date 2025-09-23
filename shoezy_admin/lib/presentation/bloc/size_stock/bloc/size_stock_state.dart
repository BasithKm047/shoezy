part of 'size_stock_bloc.dart';

@freezed
abstract class SizeStockState with _$SizeStockState{
  const factory SizeStockState.initial()=_$Initail;
  const factory SizeStockState.success()=_Success;
  const factory SizeStockState.loading()=_Loading;
  const factory SizeStockState.loaded(List<SizeStockModel>sizeStock)=_Loaded;
  const factory SizeStockState.failure(String message)=_Failure;



}
