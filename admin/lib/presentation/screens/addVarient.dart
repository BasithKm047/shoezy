import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
// import 'package:shoezy_admin/presentation/screens/widgets/imageUploader.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';

class AddvarientScreen extends StatelessWidget {
  AddvarientScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Add Varients',
        context: context,
        centerTitle: true,
      ),

      body: BlocConsumer<VarientsBloc, VarientsState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () {
              CircularProgressIndicator();
            },
            failure: (message) {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: message,
              );
            },
            imageAddedState: (images) {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: 'Image added succesFully',
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // CostumWidget.labelText(context, 'Category Type'),
                          // SizedBox(width: screenWidth / 4.3),
                          CostumWidget.labelText(context, 'Color'),
                          // SizedBox(width: 20,),
                        ],
                      ),
                      SizedBox(height: 20),
                      CostumWidget.costumTextformField(
                        // controller: ,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a color';
                          }
                          return null;
                        },
                        hintText: 'color',
                        width: screenWidth / 2,
                      ),
                      SizedBox(height: 20),
                      CostumImageUploader(
                        images: state.maybeWhen(
                          imageAddedState: (images) => images,
                          imageRemovedState: (image) => image,
                          orElse: () => [],
                        ),
                        onImagesChanged: (addedImage) {
                          context.read<VarientsBloc>().add(
                            VarientsEvent.imageUpload(addedImage),
                          );
                        },
                        onImageRemoved: (removedImage){
                          context.read<VarientsBloc>().add(VarientsEvent.imageRemoved(removedImage));
                        },
                      ),
                      SizedBox(height: 20,),
                  
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CostumWidget.costumTextformField(
                            hintText: 'Size',
                            width: screenWidth / 6,
                          ),
                          SizedBox(width: 50),
                          CostumWidget.costumTextformField(
                            hintText: 'Stock',
                            width: screenWidth / 6,
                          ),
                        ],
                      ),
                  
                      SizedBox(height: 50),
                      SizedBox(
                        width: screenWidth / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(width: 10,),
                            CostumWidget.costumElevatedButton(
                              // ontap: () {
                              //   Commonfunction.validateAndSubmitForm(
                              //     context: context,
                              //     formKey: _formKey,
                              //     successMessage: 'Category added successfully',
                              //     errorMessage: 'Failed to add category',
                              //     onSuccess: () {
                              //       print(
                              //         'Category added: ${_categoryNameController.text}',
                              //       );
                              //       _categoryNameController.clear();
                              // selectedCategory.value=null;
                              //     },
                              //   );
                              //   // Handle form submission
                              //   String categoryName = _categoryNameController.text;
                              //   print('Category Name: $categoryName');
                              // },
                              context: context,
                              title: 'Add Varients',
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              width: screenWidth / 7,
                            ),
                          ],
                        ),
                      ),
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
}
