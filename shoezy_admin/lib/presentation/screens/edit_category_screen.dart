import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/data/model/categoryModel/category_model.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
// Keep uploads in repository/bloc layer; screen only supplies bytes
// import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/bloc/category_bloc/bloc/category_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';

// ignore: must_be_immutable
class EditCategoryScreen extends StatelessWidget {
  CategoryModel category;
  EditCategoryScreen({super.key, required this.category})
    : _formKey = GlobalKey<FormState>(),
      _categoryNameController = TextEditingController(text: category.name);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _categoryNameController;
  bool updatecategory = true;

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(
      CategoryEvent.getCategories(),
    );
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Edit Category',
        context: context,
        centerTitle: true,
      ),
      body: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            failure: (message) {
              LoadingOverlay.hide();
              if (message.contains('not-found')) {
                CostumWidget.showCustomSnackbar(
                  context: context,
                  message: 'Brand not found. It may have been deleted.',
                  backgroundColor: Colors.red,
                );
              } else {
                CostumWidget.showCustomSnackbar(
                  context: context,
                  message: message,
                  backgroundColor: Colors.red,
                );
              }
            },
            success: () {
              LoadingOverlay.hide();
              CostumWidget.showCustomSnackbar(
                context: context,
                message: 'Category updated successfully',
              );
              context.read<CategoryBloc>().add(
                const CategoryEvent.getCategories(),
              );
            },
            loading: () {
              LoadingOverlay.show(context, 'Loading...');
              // Logger().d('Updating...');
            },
          );
        },
        builder: (context, state) {
          final Uint8List? currentImage = state.maybeWhen(
            orElse: () => null,
            imagesUpdated: (images) => images,
          );

          // if (state.maybeWhen(orElse: () => false, loading: () => true)) {
          //   return const Center(
          //     child: CircularProgressIndicator(color: Colors.blue),
          //   );
          // }

          return Center(
            child: SizedBox(
              width: screenWidth / 2,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CostumWidget.labelText(context, 'Category Name'),
                      const SizedBox(height: 20),
                      CostumWidget.costumTextformField(
                        controller: _categoryNameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty || category.name.isEmpty) {
                            return 'Please enter a category name';
                          } else if (value.length < 2) {
                            return 'Category name must be at least 2 characters long';
                          } else if (value.length > 50) {
                            return 'Category name must be less than 50 characters long';
                          }
                          return null;
                        },
                        hintText: 'Name',
                        width: screenWidth / 2,
                      ),
                      const SizedBox(height: 10),

                      CostumImageUploader(
                        updateimage: updatecategory,
                        singleMode: true,
                        image: currentImage ?? category.image,
                        onImageSelected: (changedImages) {
                          // Logger().d('Image selected');
                          context.read<CategoryBloc>().add(
                            CategoryEvent.imagesUpdated(images: changedImages),
                          );
                        },
                        onSingleImageRemoved: () {
                          context.read<CategoryBloc>().add(
                            const CategoryEvent.clearImage(),
                          );
                          updatecategory = false;
                          category = category.copyWith(image: null);
                          // category. = null;
                          // Logger().d('Image removed');
                        },
                      ),
                      const SizedBox(height: 50),

                      SizedBox(
                        width: screenWidth / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CostumWidget.costumElevatedButton(
                              ontap: () async {
                                final Uint8List? imageCandidate = state
                                    .maybeWhen(
                                      orElse: () => null,
                                      imagesUpdated: (images) => images,
                                    );
                                final bool namechanged =
                                    category.name !=
                                    _categoryNameController.text.trim();
                                final bool imageChanged =
                                    (imageCandidate != null &&
                                        imageCandidate.isNotEmpty) ||
                                    (updatecategory == false &&
                                        category.image == null);

                                if (!namechanged && !imageChanged) {
                                  context.read<CategoryBloc>().add(
                                    CategoryEvent.updateCategory(
                                      category: category,
                                    ),
                                  );
                                  clearField(context);
                                  // Logger().d('No changes made');
                                  return;
                                }
                                if (imageCandidate == null &&
                                    (updatecategory == true &&
                                        category.image == null)) {
                                  CostumWidget.showCustomSnackbar(
                                    context: context,
                                    message: 'Please select an image',
                                    backgroundColor: Colors.red,
                                  );
                                  return;
                                }

                                String? cloudImage = category.image;
                                if (imageCandidate != null) {
                                  cloudImage = await CloudinaryServices()
                                      .uploadSingleImage(imageCandidate);
                                }
                                Commonfunction.validateAndSubmitForm(
                                  context: context,
                                  formKey: _formKey,
                                );

                                final updated = CategoryModel(
                                  id: category.id,
                                  name: _categoryNameController.text.trim(),
                                  image: cloudImage,
                                );

                                context.read<CategoryBloc>().add(
                                  CategoryEvent.updateCategory(
                                    category: updated,
                                  ),
                                );
                                clearField(context);
                                // Logger().d('Updated Brand: $updated');
                              },
                              context: context,
                              title: 'Update Category',
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              width: screenWidth / 7,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  clearField(BuildContext context) {
    context.read<CategoryBloc>().add(const CategoryEvent.clearImage());
    _categoryNameController.clear();
    updatecategory = true;
    category = category.copyWith(image: null);
    category = category.copyWith(name: '');
    // Logger().d('Fields cleared');
  }
}
