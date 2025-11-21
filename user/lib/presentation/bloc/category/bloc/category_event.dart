part of 'category_bloc.dart';

@freezed
abstract class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.loadCategories() = _LoadCategories;
  const factory CategoryEvent.searchCategories(String query) = _SearchCategories;
  

}

