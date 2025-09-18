import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/vareintModel/size_stock_model.dart/size_stock_model.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';

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

  static BlocBuilder<VariantsBloc, VariantsState> varaint_sizestock_listview() {
    return BlocBuilder<VariantsBloc, VariantsState>(
      builder: (context, state) {
        List<SizeStockModel> sizeStockList = state.maybeWhen(
          orElse: () => [],
          data: (images, sizeStock, variants, showFields) => sizeStock,
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
                            title: Text('Size: ${sizeStock.size}'),
                            subtitle: Text('Stock: ${sizeStock.stock}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context.read<VariantsBloc>().add(
                                  VariantsEvent.removeSizeStock(index),
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
    );
  }

  static Row varaint_sizeStockAddingField({
    required BuildContext context,
    required TextEditingController sizeController,
    required TextEditingController stockController,
    required GlobalKey<FormState> formKey,
  }) {
    return Row(
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
                message: 'Please enter valid size and stock values',
              );
            }
          },
        ),
      ],
    );
  }

  static BlocConsumer<VariantsBloc, VariantsState> varaintImageField() {
    return BlocConsumer<VariantsBloc, VariantsState>(
      listener: (context, state) {
        state.maybeWhen(orElse: () => false, loading: () => true);
      },

      builder: (context, state) {
        final currentImages = state.maybeWhen(
          data: (images, sizeStock, variants, showFields) => images,
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
              VariantsEvent.imageUpload(changedImages),
            );
            Logger().i('Images updated:  images selected');
          },
          onImageRemoved: (index) {
            final List<Uint8List> imagetoCheck = state.maybeWhen(
              data: (images, sizeStock, variants, showFields) => images,
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
      child: BlocBuilder<VariantsBloc, VariantsState>(
        builder: (context, state) {
          // Handle loading state
          return state.maybeWhen(
            loading: () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitFadingCube(color: Colors.blue, size: 50.0),
                  // or SpinKitWave, SpinKitRipple, SpinKitDoubleBounce, etc.
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
            orElse: () {
              Logger().i('Rebuilding variants list view');
              List<Variantsmodel> variants = state.maybeWhen(
                orElse: () => [],
                data: (images, sizeStock, variants, showFields) => variants,
              );
              Logger().i('Current variants count: ${variants.length}');

              return variants.isEmpty
                  ? Center(
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
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: variants.length,
                      itemBuilder: (context, index) {
                        final variant = variants[index];
                        return Card(
                          color: Colors.white,
                          elevation: 4,
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
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
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: variant.images.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.network(
                                            variant.images.first,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                            loadingBuilder: (context, child, loadingProgress) {
                                              if (loadingProgress == null)
                                                // ignore: curly_braces_in_flow_control_structures
                                                return child;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            TextSpan(
                                              text: variant.color.join(", "),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Sizes & Stocks:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: variant.sizeStock.map((
                                          stock,
                                        ) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2.0,
                                            ),
                                            child: Text(
                                              '• Size: ${stock['size']} | Stock: ${stock['stock']}',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
                      final images = state.maybeWhen(
                        orElse: () {},
                        data: (images, sizeStock, variants, showFields) =>
                            images,
                        imageAddedState: (images) => images,
                        imageRemovedState: (image) => image,
                      );
                      Commonfunction.imageValidator(images!, context);
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      List<SizeStockModel> sizeStock = state.maybeWhen(
                        orElse: () => [],
                        data: (images, sizeStock, variants, showFields) =>
                            sizeStock,
                      );
                      if (sizeStock.isEmpty) {
                        CostumWidget.showCustomSnackbar(
                          context: context,
                          message: 'Please add at least one size and stock',
                        );

                        return;
                      }
                      Commonfunction.validateAndSubmitForm(
                        context: context,
                        formKey: formKey,
                      );
                      LoadingOverlay.show(context);
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
              // child: AnimatedSwitcher(
              //   duration: Duration(milliseconds: 200),
              //   transitionBuilder: (child, animation) {
              //     return ScaleTransition(scale: animation, child: child);
              //   },
              //   child: isLoading
              //       ? SizedBox(
              //           key: ValueKey('loading'),
              //           width: 20,
              //           height: 20,
              //           child: CircularProgressIndicator(
              //             strokeWidth: 2,
              //             color: Colors.white,
              //           ),
              //         )
              //       : Text(
              //           'Add Variants',
              //           key: ValueKey('text'),
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              // ),

              width: screenWidth / 7,
              height: 40,
            );
          },
        ),
      ],
    );
  }
}
