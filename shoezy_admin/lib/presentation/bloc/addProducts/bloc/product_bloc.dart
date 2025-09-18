import 'dart:typed_data';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: unnecessary_import
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
    on<_AddProduct>((event, emit) async {
      emit(ProductState.loading());
      try {
        final product = event.product;
          
         await productServices.addProduct(products: product);
        Logger().d('Product Added Successfully');

        emit(ProductState.success());
      } catch (e) {
        emit(ProductState.error(e.toString()));
      }
    });
    on<_GetProduct>((event, emit) async{
      emit(_Loading());
      try{
        final products=await productServices.getProduct();
        emit(ProductState.loaded(products: products));
      }catch(e){
        emit(ProductState.error(e.toString()));
      }
    },);

  }
}
