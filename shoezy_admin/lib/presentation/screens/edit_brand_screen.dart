import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/data/model/brand/brand_model.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';
import 'package:shoezy_admin/widgets/log_image_picker.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BrandBloc>().add(StartEditing(brand));
    });

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
              // Logger().d('Loading...');
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
          Uint8List? selectedLogoImage;
          Uint8List? selectedBrandImage;
          BrandModel? editingBrand;

          state.maybeWhen(
            editing: (b, newLogo, newBrand) {
              editingBrand = b;
              selectedLogoImage = newLogo;
              selectedBrandImage = newBrand;
            },
            orElse: () {
              editingBrand = brand;
            },
          );

          final currentBrand = editingBrand ?? brand;

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
                          if (value == null ||
                              value.isEmpty ||
                              brand.name.isEmpty) {
                            return 'Please enter a brand name';
                          } else if (value.length < 2) {
                            return 'Brand name must be at least 2 characters long';
                          } else if (value.length > 50) {
                            return 'Brand name must be less than 50 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      LogoPicker(
                        logo: selectedLogoImage ?? currentBrand.logoImage,
                        onLogoSelected: (img) {
                          context.read<BrandBloc>().add(UpdateLogoImage(img));
                        },
                        onLogoRemoved: () {
                          context.read<BrandBloc>().add(ClearLogoImage());
                        },
                      ),
                      SizedBox(height: 10),

                      CostumImageUploader(
                        updateimage: updatBrand,
                        singleMode: true,
                        image: selectedBrandImage ?? currentBrand.imageUrl,
                        onImageSelected: (img) {
                          // Logger().d('Image selected');

                          context.read<BrandBloc>().add(
                            BrandEvent.updateBrandImage(img),
                          );
                        },
                        onSingleImageRemoved: () {
                          context.read<BrandBloc>().add(
                            const BrandEvent.clearImage(),
                          );
                          updatBrand = false;
                          brand = brand.copyWith(imageUrl: null);
                          // Logger().d('Image removed');
                        },
                      ),

                      const SizedBox(height: 30),
                      Center(
                        child: CostumWidget.costumElevatedButton(
                          width: screenWidth / 6,
                          context: context,
                          title: 'Update Brand',
                          ontap: () async {
                            final bool nameChanged =
                                _brandNameController.text.trim() != brand.name;
                            final bool imageChanged =
                                selectedBrandImage != null ||
                                selectedLogoImage != null ||
                                (!updatBrand && brand.imageUrl == null);

                            if (!nameChanged && !imageChanged) {
                              context.read<BrandBloc>().add(
                                BrandEvent.updateBrand(brand),
                              );
                              clearfield(context);
                              return;
                            }

                            // Validate form
                            Commonfunction.validateAndSubmitForm(
                              context: context,
                              formKey: _formKey,
                            );

                            // Upload new images if selected
                            String? cloudBrand = currentBrand.imageUrl;
                            String? cloudLogo = currentBrand.logoImage;

                            if (selectedBrandImage != null) {
                              cloudBrand = await CloudinaryServices()
                                  .uploadSingleImage(selectedBrandImage!);
                            }
                            if (selectedLogoImage != null) {
                              cloudLogo = await CloudinaryServices()
                                  .uploadSingleImage(selectedLogoImage!);
                            }

                            // Create updated BrandModel
                            final updated = BrandModel(
                              id: brand.id,
                              name: _brandNameController.text.trim(),
                              imageUrl: cloudBrand,
                              logoImage: cloudLogo,
                            );

                            // Dispatch update event
                            context.read<BrandBloc>().add(
                              BrandEvent.updateBrand(updated),
                            );
                            clearfield(context);
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
    context.read<BrandBloc>().add(ClearImage());
    context.read<BrandBloc>().add(ClearLogoImage());
    updatBrand = true;
    brand = brand.copyWith(name: '');
    brand = brand.copyWith(imageUrl: null);
    brand = brand.copyWith(logoImage: null);
    // Logger().d('Fields cleared');
  }
}
