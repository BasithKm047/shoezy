
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/data/model/vareintModel/size_stock_model.dart/size_stock_model.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';



// ignore: must_be_immutable
class AddvariantScreen extends StatelessWidget {
  AddvariantScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController colorController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (Firebase.apps.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('Firebase is not initialized')),
      );
    }
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Add Variants',
        context: context,
        centerTitle: true,
      ),

      body: BlocConsumer<VariantsBloc, VariantsState>(
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
                        controller: colorController,
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
                          context.read<VariantsBloc>().add(
                            VariantsEvent.imageUpload(addedImage),
                          );
                        },
                        onImageRemoved: (removedImage) {
                          context.read<VariantsBloc>().add(
                            VariantsEvent.imageRemoved(removedImage),
                          );
                        },
                      ),
                      SizedBox(height: 20),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CostumWidget.costumTextformField(
                            controller: sizeController,
                            validator: (value) =>
                                Commonfunction.commonValidator(value, 'Size'),
                            hintText: 'Size',
                            width: screenWidth / 6,
                          ),
                          SizedBox(width: 50),
                          CostumWidget.costumTextformField(
                            controller: stockController,
                            validator: (value) =>
                                Commonfunction.commonValidator(value, 'Stock'),
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
                            CostumWidget.costumElevatedButton(
                              ontap: () async{
                                final List<Uint8List> images = state.maybeWhen(
                                  orElse: () => [],
                                  imageAddedState: (images) => images,
                                );
                                if (!Commonfunction.imageValidator(
                                  images,
                                  context,
                                )) {
                                  return;
                                }
                                CloudinaryServices cloudinaryServices = CloudinaryServices();
                                  final cloudImages=await cloudinaryServices.uploadMultipleImages(images);

                                Commonfunction.validateAndSubmitForm(
                                  context: context,
                                  formKey: _formKey,
                                  successMessage: 'Varaint Added Succesfull',
                                  errorMessage: 'Variant Adding Failed',
                                );

                                final variants = Variantsmodel(
                                  color: colorController.text.split(','),
                                  images: cloudImages,
                                  // stock: int.parse(stockController.text),
                                  // size: sizeController.text.split(',') 
                                  sizeStock:  sizeController.text.split(',').map((s) {
                                    final stock = int.tryParse(stockController.text) ?? 0;
                                    return {
                                      'size': s,
                                      'stock': stock,
                                    };
                                  }).toList(),

                                );

                                // context.read<VariantsBloc>().add(
                                //   // VariantsEvent.addVariants(variants),
                                // );
                                clearfield(context);

                                // log('Varient added succesfully');
                                // print('variant added succesfully');
                              },
                              context: context,
                              title: 'Add Variants',
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

  clearfield(BuildContext context) {
    sizeController.clear();
    colorController.clear();
    stockController.clear();
    context.read<VariantsBloc>().add(VariantsEvent.resetImgae());
  }
}
