import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/brand/brand_model.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';

// ignore: must_be_immutable
class EditBrandScreen extends StatelessWidget {
  BrandModel brand;
  EditBrandScreen({super.key, required this.brand})
    : _formKey = GlobalKey<FormState>(),
      _brandNameController = TextEditingController(text: brand.name);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _brandNameController;

  bool updatBrand = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Edit Brand',
        context: context,
        centerTitle: true,
      ),
      body: BlocConsumer<BrandBloc, BrandState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: () {
              LoadingOverlay.hide();
              CostumWidget.showCustomSnackbar(
                context: context,
                message: 'Brand updated successfully',
              );
              context.read<BrandBloc>().add(const BrandEvent.fetchBrands());
            },
            loading: () {
              LoadingOverlay.show(context, 'Loading...');
              Logger().d('Loading...');
            },
            error: (message) {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: message,
                backgroundColor: Colors.red,
              );
            },
          );
        },
        builder: (context, state) {
          final Uint8List? selectedImage = state.maybeWhen(
            orElse: () => null,
            imagesUpdated: (imageBytes) => imageBytes,
          );

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
                      CostumWidget.labelText(context, 'Brand Name'),
                      const SizedBox(height: 10),
                      CostumWidget.costumTextformField(
                        controller: _brandNameController,
                        hintText: 'Enter brand name',
                        width: screenWidth / 2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a brand name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      CostumImageUploader(
                        updateimage: updatBrand,
                        singleMode: true,
                        image: selectedImage ?? brand.imageUrl,
                        onImageSelected: (img) {
                          Logger().d('Image selected');

                          context.read<BrandBloc>().add(
                            BrandEvent.imageUploaded(img),
                          );
                        },
                        onSingleImageRemoved: () {
                          context.read<BrandBloc>().add(
                            const BrandEvent.clearImage(),
                          );
                          updatBrand = false;
                          brand = brand.copyWith(imageUrl: null);
                          Logger().d('Image removed');
                        },
                      ),

                      const SizedBox(height: 30),
                      Center(
                        child: CostumWidget.costumElevatedButton(
                          width: screenWidth / 6,
                          context: context,
                          title: 'Update Brand',
                          ontap: () async {
                            if (brand.id == null || brand.id!.isEmpty) {
                              CostumWidget.showCustomSnackbar(
                                context: context,
                                message:
                                    'Invalid brand ID. Cannot update brand.',
                                backgroundColor: Colors.red,
                              );
                              return;
                            }
                            final finalImageUrl = state.maybeWhen(
                              orElse: () => null,
                              imagesUpdated: (imageBytes) => imageBytes,
                            );
                            final bool namechanged =
                                _brandNameController.text.trim() != brand.name;
                            final bool imageChanged =
                                (finalImageUrl != null &&
                                    finalImageUrl.isNotEmpty) ||
                                (updatBrand == false && brand.imageUrl == null);

                            if (!namechanged && !imageChanged) {
                              context.read<BrandBloc>().add(
                                BrandEvent.updateBrand(brand),
                              );
                              clearfield(context);
                              Logger().d('No changes made');

                              return;
                            }
                            if (brand.imageUrl == null &&
                                finalImageUrl == null) {
                              CostumWidget.showCustomSnackbar(
                                context: context,
                                message: 'Please select an image',
                                backgroundColor: Colors.red,
                              );
                              return;
                            }

                            String? cloudImage = brand.imageUrl;
                            if (finalImageUrl != null) {
                              cloudImage = await CloudinaryServices()
                                  .uploadSingleImage(finalImageUrl);
                            }
                            Commonfunction.validateAndSubmitForm(
                              context: context,
                              formKey: _formKey,
                            );

                            final updated = BrandModel(
                              id: brand.id,
                              name: _brandNameController.text.trim(),
                              imageUrl: cloudImage,
                            );

                            context.read<BrandBloc>().add(
                              BrandEvent.updateBrand(updated),
                            );
                            clearfield(context);

                            Logger().d('Updated Brand: $updated');
                          },
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

  clearfield(BuildContext context) {
    _brandNameController.clear();
    context.read<BrandBloc>().add(const BrandEvent.clearImage());
    updatBrand = true;
    brand = brand.copyWith(name: '');
    brand = brand.copyWith(imageUrl: null);
    Logger().d('Fields cleared');
  }
}
