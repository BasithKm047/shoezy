import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/bloc/addProducts/bloc/product_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';

class VariantField extends StatelessWidget {
  VariantField({super.key});
  TextEditingController stockController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 700,
          decoration: BoxDecoration(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CostumWidget.labelText(context, 'Color'),
                SizedBox(height: 10),
                CostumWidget.costumTextformField(
                  hintText: 'Color',
                  width: MediaQuery.of(context).size.width / 2,
                  controller: colorController,
                ),
                SizedBox(height: 10),
                CostumWidget.labelText(context, 'Size'),
                SizedBox(height: 10),
                Row(
                  children: [
                    CostumWidget.costumTextformField(
                      hintText: 'Size',
                      width: MediaQuery.of(context).size.width / 5,
                      controller: sizeController,
                    ),
                    SizedBox(width: 20),
                    CostumWidget.costumTextformField(
                      hintText: 'Stock',
                      width: MediaQuery.of(context).size.width / 5,
                      controller: stockController,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    return CostumImageUploader(
                      images: state.maybeWhen(
                        orElse: () => [],
                        //  inintial: () => [],
                        imageRemoved: (removedImage) => removedImage,
                        imagesUpdated: (images) => images,
                      ),
                      onImagesChanged: (changedImage) {
                        context.read<ProductBloc>().add(
                          ProductEvent.uploadImage(changedImage),
                        );
                      },
                      onImageRemoved: (index) {
                        context.read<ProductBloc>().add(
                          ProductEvent.removeImage(index),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<VariantsBloc, VariantsState>(
                      builder: (context, state) {
                        return CostumWidget.costumElevatedButton(
                          context: context,
                          title: 'Add Variants',
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          ontap: () async {
                            final images = state.maybeWhen(
                              orElse: () {},

                              imageAddedState: (images) => images,
                              imageRemovedState: (removedImage) => removedImage,
                            );
                            Commonfunction.imageValidator(images!, context);
                            Commonfunction.validateAndSubmitForm(
                              context: context,
                              formKey: formKey,
                            );
                            final cloudImages = await CloudinaryServices()
                                .uploadMultipleImages(images);
                            final variants = [
                              Variantsmodel(
                                color: [colorController.text],
                                images: cloudImages,
                                stock: int.parse(stockController.text),
                                size: sizeController.text.split(','),
                              ),
                            ];
                            context.read<VariantsBloc>().add(
                              VariantsEvent.addVariants(variants),
                            );
                          },

                          width: screenWidth / 7,
                          height: 40,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Variant ${index + 1}'),
                        subtitle: Text('Details for variant ${index + 1}'),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: 5,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
