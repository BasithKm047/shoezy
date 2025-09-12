import 'dart:typed_data';

import 'package:bloc/bloc.dart';
// ignore: unnecessary_import
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:loginpage/data/model/product/product_model.dart';
import 'package:loginpage/data/repositories/product_services.dart';

part 'product_event.dart';
part 'product_state.dart';

part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductServices productServices;
  ProductBloc(this.productServices) : super(ProductState.inintial()) {
    on<_UploadImage>((event, emit) {
      emit(_Loading());
      try {
        emit(_ImagesUpdated(event.images));
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });

    on<_RemoveImage>((event, emit) {
      try {
        final List<Uint8List> currentImage = state.maybeWhen(
          orElse: () => [],
          imagesUpdated: (images) => images,
          imageRemoved: (removedImage) => removedImage,
        );
        if(event.index>=0 && event.index<currentImage.length){
    final updatedImage = List<Uint8List>.from(currentImage)
          ..removeAt(event.index);
        emit(_ImagesUpdated(updatedImage));

        }else{
          emit(_ImagesUpdated( currentImage));
        }
    
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
