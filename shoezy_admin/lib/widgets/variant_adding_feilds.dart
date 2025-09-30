import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';
import 'package:uuid/uuid.dart';

class VariantAddingFeilds {
  static Widget variantColorField({
    required BuildContext context,
    required TextEditingController colorController,
  }) {
    return CostumWidget.costumTextformField(
      hintText: 'Color',
      width: MediaQuery.of(context).size.width / 2,
      controller: colorController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a color';
        }
        return null;
      },
    );
  }

  static BlocConsumer<VariantsBloc, VariantsState> varaintImageField() {
    return BlocConsumer<VariantsBloc, VariantsState>(
      listener: (context, state) {
        state.maybeWhen(orElse: () => false, loading: () => true);
      },

      builder: (context, state) {
        final currentImages = state.maybeWhen(
          data: (images, variants, showFields) => images,
          imageAddedState: (images) => images,
          imageRemovedState: (images) => images,
          orElse: () => <Uint8List>[],
        );

        state.maybeWhen(
          orElse: () {},
          loading: () {
            return Center(child: CircularProgressIndicator(color: Colors.blue));
          },
        );

        return CostumImageUploader(
          images: currentImages,
          onImagesChanged: (changedImages) {
            context.read<VariantsBloc>().add(
              VariantsEvent.imageUpload(changedImages as List<Uint8List>),
            );
            Logger().i('Images updated:  images selected');
          },
          onImageRemoved: (index) {
            final List<Uint8List> imagetoCheck = state.maybeWhen(
              data: (images, variants, showFields) => images,
              imageAddedState: (images) => images,
              imageRemovedState: (removedimage) => removedimage,
              orElse: () => <Uint8List>[],
            );
            if (index >= 0 && index < imagetoCheck.length) {
              context.read<VariantsBloc>().add(
                VariantsEvent.imageRemoved(index),
              );
              Logger().i('Image removal requested at index: $index');
            } else {
              Logger().w('Invalid index for image removal: $index');
            }
          },
        );
      },
    );
  }

  static SizedBox varaintListView() {
    return SizedBox(
      height: 250,
      child: BlocConsumer<VariantsBloc, VariantsState>(
        listener: (context, state) {
          state.maybeWhen(
            data: (images, variants, showFields) => LoadingOverlay.hide(),
            failure: (_) => LoadingOverlay.hide(),
            orElse: () {},
          );
        },
        builder: (context, state) {
          // Handle loading state
          Logger().i('Current state: $state');
          return state.maybeWhen(
            loading: () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitFadingCube(color: Colors.blue, size: 50.0),
                  SizedBox(height: 16),
                  Text(
                    'Adding variant...',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            data: (images, variants, showFields) {
              Logger().i('Variants in data state: $variants'); // Log variants
              if (variants.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 50,
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No Variants Added Yet',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: variants.length,
                itemBuilder: (context, index) {
                  final variant =
                      variants[index]; // Directly use variants from data state
                  return Card(
                    color: Colors.white,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image container
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                            child: variant.images.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      variant.images.first,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Icon(
                                              Icons.image_not_supported,
                                              size: 40,
                                              color: Colors.grey[400],
                                            );
                                          },
                                    ),
                                  )
                                : Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                    color: Colors.grey[400],
                                  ),
                          ),
                          SizedBox(width: 16),
                          // Details section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Variant ${index + 1}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: 'Color: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: variant.color.join(", ")),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4),
                              ],
                            ),
                          ),
                          CostumWidget.costumElevatedIconButton(
                          backgroundColor: Colors.red, // Red to indicate deletion
                          context: context,
                          // text: '',
                          icon: Icons.delete, // Add delete icon
                          ontap: () {
                            CostumWidget.showCustomAlertDialog(
                              confirmButtonColor: Colors.red,
                              confirmButtonText: 'Delete',
                              cancelButtonText: 'Cancel',
                              context: context,
                              title: 'Confirm Deletion',
                              content: 'Are you sure you want to delete this variant?',
                              onConfirm: () { 
                                // Navigator.of(context).pop(); //
                                Logger().i('Delete confirmed for variant: $variant');
                                context.read<VariantsBloc>().add(
                                  VariantsEvent.removeVariants(variant),
                                );  
                                 Logger().i('Variant removed: $variant');
                              },
                            );
                          },
                          foregroundColor: Colors.white,
                        ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            orElse: () {
              Logger().i(
                'orElse state triggered',
              ); // Log when orElse is triggered
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 50,
                      color: Colors.grey[400],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'No Variants Added Yet',
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  static Row variantAddingButton({
    required double screenWidth,
    required GlobalKey<FormState> formKey,
    required TextEditingController colorController,
    required TextEditingController sizeController,
    required TextEditingController stockController,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<VariantsBloc, VariantsState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            );
            return CostumWidget.costumElevatedButton(
              context: context,
              title: isLoading ? 'Adding...' : 'Add Variants',
              backgroundColor: isLoading ? Colors.grey : Colors.blue,
              foregroundColor: Colors.white,
              ontap: isLoading
                  ? null
                  : () async {
                    Logger().i('Add Variants button pressed');
                      final images = state.maybeWhen(
                        orElse: () {},
                        data: (images, variants, showFields) => images,
                        imageAddedState: (images) => images,
                        imageRemovedState: (image) => image,
                      );
                      Logger().i('Images to validate: $images');
                      if (!Commonfunction.imageValidator(images! , context)) {
                      Logger().i('Image validation failed');
                      LoadingOverlay.hide();
                      return;
                    }
                    if (!formKey.currentState!.validate()) {
                      Logger().i('Form validation failed');
                      LoadingOverlay.hide();
                      return;
                    }
                    
                      Logger().i('Form validated, submitting...');
                      Commonfunction.validateAndSubmitForm(
                        context: context,
                        formKey: formKey,
                      );
                      LoadingOverlay.show(context, 'Variant');
                      try{
                      final cloudImages = await CloudinaryServices()
                          .uploadMultipleImages(images);
                          String id=Uuid().v4();
                      final variants = [
                        Variantsmodel(
                          id: id,
                          color: [colorController.text],
                          images: cloudImages,
                        ),
                      ];
                      Logger().i('Adding variants: $variants');
                      context.read<VariantsBloc>().add(
                        VariantsEvent.addVariants(variants),
                      );
                      colorController.clear();
                      sizeController.clear();
                      stockController.clear();
                      Logger().i('Clearing form and resetting images');
                      context.read<VariantsBloc>().add(
                        VariantsEvent.resetImgae(),
                      );
                    }
                    catch(e){
                      Logger().e('Error during variant addition: $e');
                      LoadingOverlay.hide();
                      CostumWidget.showCustomSnackbar(
                        context: context,
                        message: 'Failed to add variant. Please try again.',
                      );
                    }
                  },
              width: screenWidth / 7,
              height: 40,
            );
          },
        ),
      ],
    );
  }
}
