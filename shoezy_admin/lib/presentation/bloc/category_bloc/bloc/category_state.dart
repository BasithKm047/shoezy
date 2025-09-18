part of 'category_bloc.dart';


 @freezed
  class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial; 
  const factory CategoryState.loading() = _Loading;
  const factory CategoryState.success()=_Success;
  const factory CategoryState.failure(String message) = _Failure;
  const factory CategoryState.imagesUpdated(List<Uint8List> images) = _ImagesUpdated;
  const factory CategoryState.imageRemoved(List<Uint8List> images) = _ImageRemoved; 
  const factory CategoryState.getcategories(List<CategoryModel> categories) = _GetCategories;
  const factory CategoryState.loaded({required List<CategoryModel> categories, String? selectedCategory}) = _Loaded;
}
