import 'dart:typed_data';

import 'package:bloc/bloc.dart';
// import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:loginpage/data/model/categoryModel/category_model.dart';
import 'package:loginpage/data/repositories/category_services.dart';
// import 'package:meta/meta.dart';
part 'category_bloc.freezed.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryServices categoryServices;
  CategoryBloc(this.categoryServices) : super(CategoryState.initial()) {
    on<ImagesUpdated>((event, emit) {
      emit(CategoryState.imagesUpdated(event.images));
    });
    on<ImageRemoved>((event, emit) {
      try {
        final List<Uint8List> currentImages = state.maybeWhen(
          orElse: () => [],
          imagesUpdated: (images) => images,
          imageRemoved: (image) => image,
        );
        if (event.index >= 0 && event.index < currentImages.length) {
          final updatedImage = List<Uint8List>.from(currentImages)
            ..removeAt(event.index);
          emit(CategoryState.imagesUpdated(updatedImage));
        } else {
          emit(CategoryState.imagesUpdated(currentImages));
        }
        Logger().d('Image Removed');

      } catch (e) {
        emit(CategoryState.failure(e.toString()));
      }
    });
    on<AddCategory>((event, emit) {
      emit(CategoryState.loading());
      try {
        categoryServices.addCategory(event.category.name, event.category.image);
        emit(CategoryState.success());
      } catch (e) {
        emit(CategoryState.failure(e.toString()));
      }
    });
    on<ResetImage>((event, emit) {
      emit(CategoryState.imagesUpdated([]));
    });

    on<SelectedCategory>((event, emit) {
      state.maybeWhen(
        orElse: () {},
        loaded: (categories, selectedCategory) {
          emit(
            CategoryState.loaded(
              categories: categories,
              selectedCategory: event.categoryName,
            ),
          );
        },
      );
    });
    on<ClearImage>((event, emit) {
      emit(CategoryState.imagesUpdated([]));
    });
    on<GetCategories>((event, emit) async {
      emit(CategoryState.loading());
      try {
        await emit.forEach<List<CategoryModel>>(
          categoryServices.getCategories(),
          onData: (categories) => CategoryState.loaded(categories: categories),
          onError: (error, stackTrace) =>
              CategoryState.failure(error.toString()),
        );
      } catch (e) {
        emit(CategoryState.failure(e.toString()));
      }
    });
    on<ClearSelection>((event, emit) {
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
    });
  }
}
