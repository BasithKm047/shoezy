import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy/data/models/product/product_model.dart';
import 'package:shoezy/data/repositories/product_repository.dart';
part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(_Initial()) {
    on<_LoadProducts>((event, emit) async {
      emit(_Loading());
      try {
        final products = await productRepository.getProducts();
        emit(_Loaded(products));
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
   
  }
}
