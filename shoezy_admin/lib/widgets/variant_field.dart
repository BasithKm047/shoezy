import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/vareintModel/size_stock_model.dart/size_stock_model.dart';

import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';

// ignore: must_be_immutable
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CostumWidget.labelText(context, 'Color'),
                  SizedBox(height: 10),
                  CostumWidget.costumTextformField(
                    hintText: 'Color',
                    width: MediaQuery.of(context).size.width / 2,
                    controller: colorController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a color';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CostumWidget.labelText(context, 'Sizes and Stocks'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: CostumWidget.costumTextformField(
                          hintText: 'Size',
                          width: MediaQuery.of(context).size.width / 2,
                          controller: sizeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter sizes';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CostumWidget.costumTextformField(
                          hintText: 'Stock',
                          width: MediaQuery.of(context).size.width / 2,
                          controller: stockController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter stock';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      CostumWidget.costumElevatedIconButton(
                        backgroundColor: Colors.blue,
                        context: context,
                        text: 'Add Size',
                        ontap: () {
                          Logger().i('Add Size button tapped');
                          if (formKey.currentState!.validate()) {
                            context.read<VariantsBloc>().add(
                              VariantsEvent.addSizeStock(
                                SizeStockModel(
                                  size: sizeController.text,
                                  stock: int.parse(stockController.text),
                                ),
                              ),
                            );
                            Logger().i(
                              'SizeStockModel added: Size=${sizeController.text}, Stock=${stockController.text}',
                            );
                            sizeController.clear();
                            stockController.clear();
                          } else {
                            CostumWidget.showCustomSnackbar(
                              context: context,
                              message:
                                  'Please enter valid size and stock values',
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<VariantsBloc, VariantsState>(
                    builder: (context, state) {
                      List<SizeStockModel> sizeStockList = state.maybeWhen(
                        orElse: () => [],
                        data: (images, sizeStock, variants, showFields) =>
                            sizeStock,
                      );
                      return sizeStockList.isEmpty
                          ? Text('No sizes added yet.')
                          : Column(
                              children: [
                                if (sizeStockList.isNotEmpty)
                                  SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                      itemCount: sizeStockList.length,
                                      itemBuilder: (context, index) {
                                        final sizeStock = sizeStockList[index];
                                        return ListTile(
                                          title: Text(
                                            'Size: ${sizeStock.size}',
                                          ),
                                          subtitle: Text(
                                            'Stock: ${sizeStock.stock}',
                                          ),
                                          trailing: IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () {
                                              context.read<VariantsBloc>().add(
                                                VariantsEvent.removeSizeStock(
                                                  index,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                else
                                  const Text('No sizes added yet'),
                              ],
                            );
                    },
                  ),
                  SizedBox(height: 10),

                  BlocBuilder<VariantsBloc, VariantsState>(
                    builder: (context, state) {
                      return CostumImageUploader(
                        images: state.maybeWhen(
                          orElse: () => <Uint8List>[],
                          //
                          data: (images, sizeStock, variants, showFields) =>
                              images,
                        ),
                        onImagesChanged: (changedImages) {
                          context.read<VariantsBloc>().add(
                            VariantsEvent.imageUpload(changedImages),
                          );
                          Logger().i(
                            'Images updated: ${changedImages.length} images selected',
                          );
                        },
                        onImageRemoved: (index) {
                          final currentImages = state.maybeWhen(
                            data: (images, sizeStock, variants, showFields) =>
                                images,
                            orElse: () => <Uint8List>[],
                          );
                          if (index >= 0 && index < currentImages.length) {
                            context.read<VariantsBloc>().add(
                              VariantsEvent.imageRemoved(currentImages[index]),
                            );
                          }
                          Logger().i('Image removed at index: $index');
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
                                data:
                                    (images, sizeStock, variants, showFields) =>
                                        images,
                              );
                              Commonfunction.imageValidator(images!, context);
                              Commonfunction.validateAndSubmitForm(
                                context: context,
                                formKey: formKey,
                              );
                              List<SizeStockModel> sizeStock = state.maybeWhen(
                                orElse: () => [],
                                data:
                                    (images, sizeStock, variants, showFields) =>
                                        sizeStock,
                              );
                              if (sizeStock.isEmpty) {
                                CostumWidget.showCustomSnackbar(
                                  context: context,
                                  message:
                                      'Please add at least one size and stock',
                                );

                                return;
                              }
                              final cloudImages = await CloudinaryServices()
                                  .uploadMultipleImages(images);
                              final variants = [
                                Variantsmodel(
                                  color: [colorController.text],
                                  images: cloudImages,
                                  sizeStock: sizeStock.map((s) => s.toJson()).toList(),
                                ),
                              ];
                              context.read<VariantsBloc>().add(
                                VariantsEvent.addVariants(variants),
                              );
                              colorController.clear();
                              sizeController.clear();
                              stockController.clear();
                              context.read<VariantsBloc>().add(
                                VariantsEvent.resetImgae(),
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
                    child: BlocBuilder<VariantsBloc, VariantsState>(
                      builder: (context, state) {
                        Logger().i('Rebuilding variants list view');
                        List<Variantsmodel> variants = state.maybeWhen(
                          orElse: () => [],
                          data: (images, sizeStock, variants, showFields) =>
                              variants,
                        );
                        Logger().i(
                          'Current variants count: ${variants.length}',
                        );

                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: variants[index].images.isNotEmpty
                                  ? Image.network(
                                      variants[index].images.first,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(Icons.image_not_supported),
                              title: Text('Variant ${index + 1}'),
                              subtitle: Text(
                                'Color: ${variants[index].color.join(", ")} | Sizes: ${variants[index].sizeStock.map((s) => s['size']).join(", ")} | Stocks: ${variants[index].sizeStock.map((s) => s['stock']).join(", ")}',
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: variants.length,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
