import 'dart:typed_data';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/categoryModel/category_model.dart';
import 'package:shoezy_admin/data/repositories/category_services.dart';
// import 'package:meta/meta.dart';
part 'category_bloc.freezed.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryServices categoryServices;
  CategoryBloc(this.categoryServices) : super(CategoryState.initial()) {
    on<CategoryEvent>((event, emit) async {
      await event.maybeWhen(
        orElse: () {},
        addCategory: (category) async {
          emit(CategoryState.loading());
          try {
            await categoryServices.addCategory(category.name, category.image!);
        Logger().d('Category Added Successfully');

            emit(CategoryState.success());
          } catch (e) {
            emit(CategoryState.failure(e.toString()));
          }
        },
        deleteCategory: (id)async {
          emit(CategoryState.loading());
          try{
            await categoryServices.deleteCategory(id);
            emit(CategoryState.success());
          }catch(e){
            Logger().d('Error: ${e.toString()}');
            emit(CategoryState.failure(e.toString()));
          }
        },
        updateCategory: (category) async{
          emit(CategoryState.loading());
          try{
            await categoryServices.updateCategory(category);
            emit(CategoryState.success());
          }catch(e){
            Logger().d('Error: ${e.toString()}');
            emit(CategoryState.failure(e.toString()));
          }
        },
        reset: () {},
        resetImage: () {},
        getCategories: () async {
          emit(const CategoryState.loading());
          try {
            final categories = await categoryServices.getCategories();
            emit(
              CategoryState.loaded(
                categories: categories,
                selectedCategory: null,
              ),
            );
          } catch (e) {
            emit(CategoryState.failure(e.toString()));
          }
        },
        searchCategories: (categoryServices) {},
        imagesUpdated: (images) {
          emit(CategoryState.imagesUpdated(images));
        },
       
        selectedCategory: (categoryName) {
          state.maybeWhen(
            orElse: () {},
            loaded: (categories, selectedCategory) {
              emit(
                CategoryState.loaded(
                  categories: categories,
                  selectedCategory: categoryName,
                ),
              );
            },
          );
        },
        clearSelection: () {
          state.maybeWhen(
            orElse: () {},
            loaded: (categories, selectedCategory) {
              emit(
                CategoryState.loaded(
                  categories: categories,
                  selectedCategory: null,
                ),
              );
            },
          );
        },
      clearImage: () {
  emit(CategoryState.imagesUpdated(null));
  Logger().d("All images cleared");
},

      );
    });
  }
}
