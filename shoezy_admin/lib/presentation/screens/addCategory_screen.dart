import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';
import 'package:shoezy_admin/data/model/categoryModel/category_model.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/fetures/utils/const/static_things.dart';
import 'package:shoezy_admin/presentation/bloc/category_bloc/bloc/category_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';

class AddcategoryScreen extends StatelessWidget {
  AddcategoryScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _categoryNameController = TextEditingController();
  final categories = StaticThings.categoryTypes;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Add Category',
        context: context,
        centerTitle: true,
      ),

      body: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            failure: (message) {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: message,
                backgroundColor: Colors.red,
              );
            },
            success: () {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: 'Category added successfully',
              );
            },
            loading: () {
              Logger().d('Loading...');
            },
          );
        },
        builder: (context, state) {
          Logger().d('Current state: $state');
          // ignore: unnecessary_type_check
          if (state is CategoryState &&
              state.maybeWhen(orElse: () => false, loading: () => true)) {
            return Center(child: CircularProgressIndicator(color: Colors.blue,));
          }
          return Center(
            child: SizedBox(
              width: screenWidth / 2,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CostumWidget.labelText(context, 'Category Name'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CostumWidget.costumTextformField(
                            controller: _categoryNameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a category name';
                              }
                              return null;
                            },
                            hintText: 'Name',
                            width: screenWidth / 2,
                          ),

                          CostumImageUploader(
                            images: state.maybeWhen(
                              orElse: () => [],
                              imagesUpdated: (images) => images,
                              imageRemoved: (image) => image,
                            ),
                            onImagesChanged: (changedImages) {
                              context.read<CategoryBloc>().add(
                                CategoryEvent.imagesUpdated(
                                  images: changedImages,
                                ),
                              );
                            },
                            onImageRemoved: (index) {
                              context.read<CategoryBloc>().add(
                                CategoryEvent.imageRemoved(index: index),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      SizedBox(
                        width: screenWidth / 2,
                        child: addCategoryButton(state, context, screenWidth),
                      ),
                      SizedBox(height: 20),
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



  Row addCategoryButton(
    CategoryState state,
    BuildContext context,
    double screenWidth,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CostumWidget.costumElevatedButton(
          ontap: () async {
            final List<Uint8List> images = state.maybeWhen(
              orElse: () => [],
              imagesUpdated: (images) => images,
              imageRemoved: (image) => image,
            );
            Logger().d('messages: ${images.length}');
            if (!Commonfunction.imageValidator(images, context)) {
              return;
            }
            CloudinaryServices cloudinaryServices = CloudinaryServices();
            final cloudImage = await cloudinaryServices.uploadMultipleImages(
              images,
            );
            Commonfunction.validateAndSubmitForm(
              context: context,
              formKey: _formKey,

              onSuccess: () {
                Logger().d('Category added: ${_categoryNameController.text}');
              },
            );
            Logger().d('Cloudinary Image: $cloudImage');
            final categories = CategoryModel(
              name: _categoryNameController.text.trim(),
              image: cloudImage,
            );
            context.read<CategoryBloc>().add(
              CategoryEvent.addCategory(category: categories),
            );
            
            clearfield(context);
          },
          context: context,
          title: 'Add Category',
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          width: screenWidth / 7,
        ),
      ],
    );
  }

  clearfield(BuildContext context) {
    _categoryNameController.clear();

    context.read<CategoryBloc>().add(CategoryEvent.resetImage());
  }
}
