import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';

// ignore: must_be_immutable
class AddbrandScreen extends StatelessWidget {
  AddbrandScreen({super.key});

  // Uint8List? _imageBytes;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _brandNameController = TextEditingController();

  // Future<void> _pickImage() async {
  void _submitForm(BuildContext context, Uint8List? imageBytes) {
    if (_formKey.currentState!.validate() && imageBytes != null) {
      context.read<BrandBlocBloc>().add(
        SubmitFormEvent(brandName: _brandNameController.text, logo: imageBytes),
      );
    } else {
      CostumWidget.showCustomSnackbar(
        context: context,
        message: 'Please fill in all fields',
        backgroundColor: Colors.red,
        borderColor: Colors.white,
      );
    }
  }

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
        child: BlocConsumer<BrandBlocBloc, BrandBlocState>(
          listener: (context, state) {
            if (state is BrandFormSuccess) {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: 'Brand added successfully',
                backgroundColor: Colors.blue,
              );
              _brandNameController.clear();
            } else if (state is BrandFormFailure) {
              CostumWidget.showCustomSnackbar(
                context: context,
                message: state.error,
                backgroundColor: Colors.red,
              );
            }
          },
          builder: (context, state) {
            Uint8List? imageBytes;
            if (state is ImagePickedState) {
              imageBytes = state.imagePath;
            }
            return SizedBox(
              width: screenWidth / 2,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    CostumWidget.labelText(context, 'Brand Name'),
                    const SizedBox(height: 10),
                    CostumWidget.costumTextformField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a brand name';
                        }
                        return null;
                      },
                      controller: _brandNameController,
                      hintText: 'Enter brand name',
                      width: screenWidth / 2,
                    ),
                    const SizedBox(height: 30),
                    CostumWidget.labelText(context, 'Logo'),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: screenWidth / 5,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                       context.read<BrandBlocBloc>().add(PicImageEvent(imageBytes));
                        },
                        icon: const Icon(Icons.image),
                        label: const Text("Pick Logo Image"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (imageBytes != null)
                      Center(
                        child: Column(
                          children: [
                            const Text('Selected Logo Preview:'),
                            const SizedBox(height: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.memory(
                                imageBytes,
                                height: 200,
                                width: screenWidth / 5,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 40),
                    Center(
                      child: CostumWidget.costumElevatedButton(
                        context: context,
                        title: state is BrandFormSubmitting
                            ? 'Submitting...'
                            : 'Add Brand',
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        width: screenWidth / 7,
                        ontap:
                            state is BrandFormSubmitting || imageBytes == null
                            ? null
                            : () => _submitForm(context, imageBytes),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
