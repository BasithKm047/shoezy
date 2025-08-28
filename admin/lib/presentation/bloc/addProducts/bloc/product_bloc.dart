import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/product/product_model.dart';
import 'package:shoezy_admin/data/repositories/product_services.dart';

part 'product_event.dart';
part 'product_state.dart';

part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductServices productServices;
  ProductBloc(this.productServices) : super(ProductState.inintial()) {
    on<ProductEvent>((event, emit) {});
    on<_UploadImage>((event, emit) {
      emit(_Loading());
      try {
        emit(_ImagesUpdated(event.images));
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });

    on<_RemoveImage>((event, emit) {
      emit(_Loading());
      try {
        final currentImage = state.maybeWhen(
          orElse: () => [],
          imagesUpdated: (images) => images,
          imageRemoved: (removedImage) => removedImage,
        );
        final updatedImage = List<Uint8List>.from(currentImage)
          ..remove(event.removedImage);
        emit(_ImagesUpdated(updatedImage));
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
    on<_AddProduct>((event, emit) {
      emit(ProductState.loading());
      try {
        productServices.addProduct(products: event.products);
        Logger().d('Product Added Successfully');

        emit(ProductState.success());
      } catch (e) {
        emit(ProductState.error(e.toString()));
      }
    });
  }
}
