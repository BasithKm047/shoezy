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
class AddbrandScreen extends StatelessWidget {
  AddbrandScreen({super.key});

  // Uint8List? _imageBytes;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _brandNameController = TextEditingController();

  // Future<void> _pickImage() async {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Add Brand',
        context: context,
        centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<BrandBloc, BrandState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () => [],
              success: () {
                CostumWidget.showCustomSnackbar(
                  context: context,
                  message: 'Brand added successfully',
                  backgroundColor: Colors.blue,
                );
                _brandNameController.clear();
              },
              error: (message) {
                CostumWidget.showCustomSnackbar(
                  context: context,
                  message: message,
                  backgroundColor: Colors.red,
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
            if (state is BrandState &&
                state.maybeWhen(orElse: () => false, loading: () => true)) {
              return Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            }
            return SizedBox(
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
                      brandNamingField(screenWidth),
                      const SizedBox(height: 30),
                      CostumWidget.labelText(context, 'Logo'),
                      const SizedBox(height: 10),
                      imageField(state, context),
                      const SizedBox(height: 40),
                      addBrandButton(screenWidth, context, state),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }



  Widget brandNamingField(double screenWidth) {
    return CostumWidget.costumTextformField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a brand name';
        }
        return null;
      },
      controller: _brandNameController,
      hintText: 'Enter brand name',
      width: screenWidth / 2,
    );
  }

  CostumImageUploader imageField(BrandState state, BuildContext context) {
    return CostumImageUploader(
      singleMode: true,
      image: state.maybeWhen(
        
        orElse: () => null,
        imagesUpdated: (images) => images,
        // removedImageState: (index) => index,
      ),

      onImageSelected: (image) {
        context.read<BrandBloc>().add(ImageUploaded(image));
      },
      onSingleImageRemoved: () {
        context.read<BrandBloc>().add(RemovedImage());
      },
    );
  }

  Center addBrandButton(
    double screenWidth,
    BuildContext context,
    BrandState state,
  ) {
    return Center(
      child: CostumWidget.costumElevatedButton(
        width: screenWidth / 6,
        context: context,
        title: 'Add Brand',
        ontap: () async {
          final   images = state.maybeWhen(
            orElse: () => null,
            imagesUpdated: (images) => images,
            // removedImageState: (removedImage) => removedImage,
          );
          if (!Commonfunction.singleImageValidator(images, context)) {
            return;
          }

          CloudinaryServices cloudinaryServices = CloudinaryServices();
          final cloudImage = await cloudinaryServices.uploadSingleImage(
            images!,
          );
          Commonfunction.validateAndSubmitForm(
            context: context,
            formKey: _formKey,
            // successMessage: 'Brand added successfully',
            // errorMessage: 'Failed to add brand',
          );
          Logger().d('Cloudinary Image: $cloudImage');
          final brands = BrandModel(
            name: _brandNameController.text,
            imageUrl: cloudImage,
          );
          // ignore: use_build_context_synchronously
          context.read<BrandBloc>().add(AddBrand(brands));
          clearfield(context);
          LoadingOverlay.show(context,'Brand');

          await Future.delayed(Duration(seconds: 1));
          LoadingOverlay.hide();
        },
      ),
    );
  }

  clearfield(BuildContext context) {
    _brandNameController.clear();

    context.read<BrandBloc>().add(BrandEvent.clearImage());
  }
}
