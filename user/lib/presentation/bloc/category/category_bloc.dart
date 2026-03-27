import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:shoezy/data/models/category/category_model.dart';
import 'package:shoezy/data/repositories/category_repository.dart';
part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepository categoryRepository;
  CategoryBloc(this.categoryRepository) : super((_Initial())) {
    on<_LoadCategories>((event, emit) async {
      emit(_Loading());
      try {
        final categories = await categoryRepository.getCategories();
        emit(_Loaded(categories));
        // for (var cat in categories) {
        //   // Logger().d('Category: ${cat.name}, Image: ${cat.image}');
        // }
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
