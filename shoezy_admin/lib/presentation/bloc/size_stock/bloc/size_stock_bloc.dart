// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy_admin/data/model/size_stock_model.dart/size_stock_model.dart';

part 'size_stock_event.dart';
part 'size_stock_state.dart';
part 'size_stock_bloc.freezed.dart';

class SizeStockBloc extends Bloc<SizeStockEvent, SizeStockState> {
  List<SizeStockModel> sizeStock = [];
  SizeStockBloc() : super(SizeStockState.initial()) {
    on<_AddedSizeStock>((event, emit) {
      emit(const SizeStockState.loading());
      try {
        sizeStock.addAll(event.sizeStock);
        emit(const SizeStockState.success());
        // 👇 also emit loaded after success
        add(const SizeStockEvent.getSizeStock());
      } catch (e) {
        emit(SizeStockState.failure(e.toString()));
      }
    });

    on<_RemovedSizeStock>((event, emit) {
      sizeStock.remove(event.sizestock);
      emit(const SizeStockState.success());
      // 👇 also reload after removal
      add(const SizeStockEvent.getSizeStock());
    });

    on<_GetSizeStock>((event, emit) {
      emit(const SizeStockState.loading());
      try {
        emit(
          SizeStockState.loaded(List.from(sizeStock)),
        ); // always give fresh list
      } catch (e) {
        emit(SizeStockState.failure(e.toString()));
      }
    });
    on<_ClearSizeStock>((event, emit) {
      sizeStock.clear();
      emit(const SizeStockState.success());
    });
    on<_SearchSizeStock>((event, emit) {
      emit(const SizeStockState.loading());
      try {
        final query = event.query.toLowerCase();
        final filteredSizeStock = sizeStock.where((sizeStockItem) {
          return sizeStockItem.size.toLowerCase().contains(query);
        }).toList();
        emit(SizeStockState.loaded(filteredSizeStock));
      } catch (e) {
        emit(SizeStockState.failure(e.toString()));
      }
    });
    on<_GetAllForEditing>((event, emit) {
      emit(const SizeStockState.loading());
      try {
        emit(
          SizeStockState.editing(List.from(sizeStock)),
        ); // always give fresh list
      } catch (e) {
        emit(SizeStockState.failure(e.toString()));
      }
    });
      
  }
}
