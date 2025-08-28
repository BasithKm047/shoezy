import 'dart:typed_data';

import 'package:bloc/bloc.dart';
// import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/categoryModel/category_model.dart';
import 'package:shoezy_admin/data/repositories/brand_services.dart';
import 'package:shoezy_admin/data/repositories/category_services.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc.dart';
// import 'package:meta/meta.dart';
part 'category_bloc.freezed.dart';

part 'category_event.dart';
part 'category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryServices categoryServices;
  CategoryBloc(this.categoryServices):super(CategoryState.initial()){
   on<ImagesUpdated>((event, emit) {
     emit(CategoryState.loading());
     try{
       final updateImage=event.images;
       emit(CategoryState.imagesUpdated(updateImage));
     }catch(e){
      emit(CategoryState.failure(e.toString()));
     }
   },);
   on<ImageRemoved>((event, emit) {
     emit(CategoryState.loading());
     try{
      final currentImages=state.maybeWhen(
        orElse: () => [],
        imagesUpdated: (images) => images,
        imageRemoved: (image) => image,
      );
      final updatedImages=List<Uint8List>.from(currentImages)..remove(event.removedImages);
      Logger().d('Image Removed');
      
      emit(CategoryState.imageRemoved(updatedImages));

     }catch(e){
      emit(CategoryState.failure(e.toString()));
     }
   },);
   on<AddCategory>((event, emit) {
     emit(CategoryState.loading());
     try{
        categoryServices.addCategory(event.category.name, event.category.image);
       emit(CategoryState.success());
     }catch(e){
      emit(CategoryState.failure(e.toString()));
     }
   },);
   on<ResetImage>((event, emit) {
    emit(CategoryState.imagesUpdated([]));
  });

   
   on<SelectedCategory>((event, emit) {
     state.maybeWhen(orElse: (){}, 
     loaded: (categories, selectedCategory){
      emit(CategoryState.loaded(categories: categories, selectedCategory: event.categoryName));
     });
   });
   on<GetCategories>((event, emit) async {
     emit(CategoryState.loading());
     try {
       await emit.forEach<List<CategoryModel>>(
         categoryServices.getCategories(),
      onData: (categories)=> CategoryState.loaded(categories: categories),
      onError: (error, stackTrace) => CategoryState.failure(error.toString()),
        );
     } catch (e) {
       emit(CategoryState.failure(e.toString()));
     }
   });
  }
}


