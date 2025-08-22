import 'package:bloc/bloc.dart';
// import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:meta/meta.dart';
part 'category_bloc.freezed.dart';

part 'category_event.dart';
part 'category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc():super(CategoryState());
  
}
