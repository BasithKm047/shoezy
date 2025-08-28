part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.addCategory({required CategoryModel category}) =
      AddCategory;
  const factory CategoryEvent.deleteCategory({required String id}) =
      DeleteCategory;
  const factory CategoryEvent.updateCategory({
    required String id,
    required String name,
    required List<Uint8List> image,
  }) = UpdateCategory;
  const factory CategoryEvent.reset() = Reset;
  const factory CategoryEvent.resetImage() = ResetImage;
  const factory CategoryEvent.getCategories() = GetCategories;
  const factory CategoryEvent.searchCategories({required String query}) =
      SearchCategories;
  const factory CategoryEvent.imagesUpdated({required List<Uint8List> images}) =
      ImagesUpdated;
  const factory CategoryEvent.imageRemoved({required Uint8List removedImages}) =
      ImageRemoved;
   const factory CategoryEvent.selectedCategory(String ? categoryName) = SelectedCategory;

}
