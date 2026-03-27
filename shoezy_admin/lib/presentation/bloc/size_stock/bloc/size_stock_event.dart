part of 'size_stock_bloc.dart';


@freezed
abstract class SizeStockEvent with _$SizeStockEvent {
  const factory SizeStockEvent.addedSizeStock(List<SizeStockModel> sizeStock)=_AddedSizeStock;
  const factory SizeStockEvent.removedSizeStock(SizeStockModel sizestock)=_RemovedSizeStock;
  const factory SizeStockEvent.getSizeStock()=_GetSizeStock;
  const factory SizeStockEvent.searchSizeStock(String query)=_SearchSizeStock;
  const factory SizeStockEvent.clearSizeStock()=_ClearSizeStock;
  const factory SizeStockEvent.getAllForEditing()=_GetAllForEditing;
  

}
