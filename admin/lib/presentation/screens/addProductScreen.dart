import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/product/product_model.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/fetures/utils/const/routes.dart';
import 'package:shoezy_admin/presentation/bloc/addProducts/bloc/product_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/category_bloc/bloc/category_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/imageUploader.dart';

class Addproductscreen extends StatelessWidget {
  const Addproductscreen({super.key});

  // Controllers and variables for the form
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // ignore: no_leading_underscores_for_local_identifiers
    final formKey = GlobalKey<FormState>();
    final shoeNameController = TextEditingController();
    final shoeDescriptionController = TextEditingController();
    final priceController = TextEditingController();
    // final stockControllers = <String, TextEditingController>{};
    //  String? selectedBrand;
    // String? selectedCategory;
    // String? selectedColor;
    // List<String> selectedSizes = [];
    // Map<String, int?> sizeStockMap = {};
    // List<String> colorOptions = ['Red', 'Blue', 'Green', 'Black'];
    // List<String> sizeOptions = ['6', '7', '8', '9', '10'];
    // List<Uint8List> shoeImages = [];
    // Map<String, TextEditingController> stockControllers = {};
    context.read<BrandBloc>().add(FetchBrands());
    context.read<CategoryBloc>().add((GetCategories()));
    clearField(BuildContext context) {
      shoeNameController.clear();
      priceController.clear();
      shoeDescriptionController.clear();
      // context.read<BrandBloc>().add(const BrandEvent.reset());
      // context.read<CategoryBloc>().add(const CategoryEvent.reset());

    }

    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Add Product',
        context: context,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CostumWidget.costumCard(
                  padding: 30,
                  width: screenWidth / 1.1,
                  borderRaduis: 15,
                  elevetion: 4,
                  color: Colors.white,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CostumWidget.labelText(context, 'Shoe Name'),
                      SizedBox(height: 10),
                      CostumWidget.costumTextformField(
                        controller: shoeNameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the shoe name';
                          } else if (value.length < 3) {
                            return 'Shoe name must be at least 3 characters long';
                          } else if (!RegExp(
                            r'^[a-zA-Z0-9\s]+$',
                          ).hasMatch(value)) {
                            return 'Shoe name can only contain letters, numbers, and spaces';
                          }
                          return null;
                        },

                        hintText: 'Shoe Name',
                        width: screenWidth / 2,
                        onChanged: (value) {
                          if (value != null) {
                            print('Shoe Name Changed: $value');
                          } else {
                            print('Shoe Name is null or empty');
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      CostumWidget.labelText(context, 'Select Brand'),
                      SizedBox(height: 10),
                      BlocBuilder<BrandBloc, BrandState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loaded: (brands, selectedBrand) {
                              return CostumWidget.costumDropdown(
                                items: brands.map((b) => b.name).toList(),
                                validator: (value) {
                                  if (value == null ||
                                      value.toString().isEmpty) {
                                    return 'Please select a brand';
                                  }
                                  return null;
                                },
                                selectedValue: selectedBrand,
                                hintText: 'Brands',
                                onChanged: (value) {
                                  context.read<BrandBloc>().add(
                                    BrandEvent.selectedBrand(value.toString()),
                                  );
                                },
                                backgroundColor: Colors.white,
                                width: screenWidth / 2,
                                borderRaduis: 10,
                              );
                            },
                            orElse: () => CostumWidget.costumDropdown(
                              items: ['No Brands Available'],
                              selectedValue: null,
                              hintText: 'Brands',
                              onChanged: (_) {},
                              backgroundColor: Colors.white,
                              width: screenWidth / 2,
                              borderRaduis: 10,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      CostumWidget.labelText(context, 'Select Category'),
                      SizedBox(height: 10),

                      BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loaded: (categories, selectedCategory) {
                              final items = categories
                                  .map((c) => c.name)
                                  .toSet()
                                  .toList();
                              return CostumWidget.costumDropdown(
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please select a category';
                                  }
                                  return null;
                                },
                                items: items,
                                selectedValue: selectedCategory,
                                hintText: 'Category',
                                onChanged: (value) {
                                  context.read<CategoryBloc>().add(
                                    CategoryEvent.selectedCategory(
                                      value.toString(),
                                    ),
                                  );
                                },
                                borderRaduis: 10,
                                width: screenWidth / 2,
                              );
                            },
                            orElse: () {
                              return CostumWidget.costumDropdown(
                                items: ['No Categories Available'],
                                selectedValue: null,
                                hintText: 'Category',
                                onChanged: (_) {},
                                borderRaduis: 10,
                                width: screenWidth / 2,
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10),

                      SizedBox(height: 10),
                      // FormField<String>(
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please select a color';
                      //     }
                      //     return null;
                      //   },
                      //   builder: (FormFieldState<String> feild) {
                      //     return
                      //   },
                      // ),
                      // if (state.selectedColor.isNotEmpty) ...[
                      //   SizedBox(height: 10),
                      //   CostumWidget.labelText(context, 'Select Sizes'),
                      //   SizedBox(height: 10),
                      //   FormField<List<String>>(
                      //     validator: (value) {
                      //       if (value == null || value.isEmpty) {
                      //         return 'Please select at least one size';
                      //       }
                      //       return null;
                      //     },
                      //     builder: (FormFieldState<List<String>> feild) {
                      //       return CostumWidget.costumSelector(
                      //         items: state.availableSize,
                      //         selectedItems: state.selectedSizes,
                      //         onchanged: (size, isSelected) {
                      //           context.read<AddProductBlocBloc>().add(
                      //             AddProductBlocEvent.sizeSelected(
                      //               size,
                      //               isSelected,
                      //             ),
                      //           );
                      //         },
                      //         width: screenWidth / 2,
                      //         textColor: Colors.black,
                      //         selectedColor: Colors.blue,
                      //         // unselectedColor: CostumColors().textFormFieldBackgroundColor,
                      //       );
                      //     },
                      //   ),
                      //   if (state.selectedSizes.isNotEmpty) ...[
                      //     SizedBox(height: 10),
                      //     CostumWidget.labelText(
                      //       context,
                      //       'Stock for Selected Sizes',
                      //     ),
                      //     SizedBox(height: 10),
                      //     SizedBox(
                      //       width: screenWidth / 2,
                      //       child: ListView.separated(
                      //         shrinkWrap: true,
                      //         physics: NeverScrollableScrollPhysics(),
                      //         itemCount: state.selectedSizes.length,
                      //         separatorBuilder: (context, index) =>
                      //             SizedBox(height: 10),
                      //         itemBuilder: (context, index) {
                      //           final size = state.selectedSizes[index];
                      //           stockControllers[size] ??=
                      //               TextEditingController(
                      //                 text:
                      //                     state.sizeStockMap[size]
                      // ?.toString() ??
                      //                     '',
                      //               );
                      //           return Row(
                      //             children: [
                      //               Container(
                      //                 padding: EdgeInsets.symmetric(
                      //                   horizontal: 20,
                      //                   vertical: 12,
                      //                 ),
                      //                 decoration: BoxDecoration(
                      //                   color: Colors.blue,
                      //                   borderRadius: BorderRadius.circular(
                      //                     10,
                      //                   ),
                      //                 ),
                      //                 child: Text(
                      //                   size,
                      //                   style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontWeight: FontWeight.w500,
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(width: 10),
                      //               SizedBox(
                      //                 width: screenWidth / 5,
                      //                 child: CostumWidget.costumTextformField(
                      //                   hintText: 'Stock for size $size',
                      //                   controller: stockControllers[size],
                      //                   keyboardType: TextInputType.number,
                      //                   validator: (value) {
                      //                     if (value == null ||
                      //                         value.isEmpty) {
                      //                       return 'Please enter stock for $size';
                      //                     } else if (!RegExp(
                      //                       r'^\d+(\.\d{1,2})?$',
                      //                     ).hasMatch(value)) {
                      //                       return 'Enter a valid number';
                      //                     }
                      //                     return null;
                      //                   },
                      //                   onChanged: (value) {
                      //                     // if (value != null) {
                      //                     //   context
                      //                     //       .read<AddProductBlocBloc>()
                      //                     //       .add(
                      //                     //         AddProductBlocEvent.stockUpdated(
                      //                     //           size,
                      //                     //           value,
                      //                     //         ),
                      //                     //       );
                      //                     // } else {
                      //                     //   print(
                      //                     //     'Stock for $size is null or empty',
                      //                     //   );
                      //                     // }
                      //                   },
                      //                   // width: screenWidth / 1.2,
                      //                 ),
                      //               ),
                      //             ],
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ],
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
                            onImageRemoved: (removedImage) {
                              context.read<ProductBloc>().add(
                                ProductEvent.removeImage(removedImage),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      CostumWidget.labelText(context, 'Price'),
                      SizedBox(height: 10),
                      CostumWidget.costumTextformField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Price is required';
                          } else if (!RegExp(
                            r'^\d+(\.\d{1,2})?$',
                          ).hasMatch(value)) {
                            return 'Enter a valid number';
                          }
                          return null;
                        },
                        hintText: 'Price',
                        width: screenWidth / 2,
                        onChanged: (value) {
                          // if (value != null) {
                          //   context.read<AddProductBlocBloc>().add(
                          //     AddProductBlocEvent.priceChanged(value),
                          //   );
                          //   print('Price Changed: $value');
                          // } else {
                          //   print(' Price is null or empty');
                          // }
                        },
                      ),
                      SizedBox(height: 10),
                      CostumWidget.labelText(context, 'Description'),
                      SizedBox(height: 10),
                      CostumWidget.costumTextformField(
                        controller: shoeDescriptionController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                        hintText: 'Description',
                        width: screenWidth / 2,
                        minLines: 4,
                      ),
                      SizedBox(height: 30),

                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlocConsumer<ProductBloc, ProductState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                orElse: () {},
                                success: () {
                                  CostumWidget.showCustomSnackbar(
                                    context: context,
                                    message: 'Product Added Successfully',
                                    backgroundColor: Colors.blue,
                                  );
                                  Logger().d('Product Added Successfully');
                                },
                                error: (error) {
                                  CostumWidget.showCustomSnackbar(
                                    context: context,
                                    message: 'Error Adding Product: $error',
                                    backgroundColor: Colors.red,
                                  );
                                  Logger().e('Error Adding Product: $error');
                                },
                                loading: () {
                                  CircularProgressIndicator(color: Colors.blue,);
                                  Logger().d('Adding Product...');
                                },
                              );
                            },
                            builder: (context, state) {
                              return CostumWidget.costumElevatedButton(
                                context: context,
                                title: 'Add Product',
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                ontap: () async {
                                  final List<Uint8List> images = state
                                      .maybeWhen(
                                        orElse: () => [],
                                        imagesUpdated: (images) => images,
                                        imageRemoved: (removedImage) =>
                                            removedImage,
                                      );
                                  Logger().d('messages: ${images.length}');
                                  if (!Commonfunction.imageValidator(
                                    images,
                                    context,
                                  )) {
                                    return;
                                  }
                                  CloudinaryServices cloudinaryServices =
                                      CloudinaryServices();
                                  final cloudImage = await cloudinaryServices
                                      .uploadMultipleImages(images);
                                  Commonfunction.validateAndSubmitForm(
                                    context: context,
                                    formKey: formKey,
                                  );

                                  final selectedBrand = context
                                      .read<BrandBloc>()
                                      .state
                                      .maybeWhen(
                                        orElse: () => null,
                                        loaded: (brands, selectedBrandName) =>
                                            brands.firstWhere(
                                              (b) =>
                                                  b.name == selectedBrandName,
                                              orElse: () => brands.first,
                                            ),
                                      );
                                  final selectedCategory = context
                                      .read<CategoryBloc>()
                                      .state
                                      .maybeWhen(
                                        orElse: () => null,
                                        loaded:
                                            (
                                              categories,
                                              selectedCategoryName,
                                            ) => categories.firstWhere(
                                              (c) =>
                                                  c.name ==
                                                  selectedCategoryName,
                                              orElse: () => categories.first,
                                            ),
                                      );
                                  final products = ProductModel(
                                    productName: shoeNameController.text.trim(),
                                    brandId: selectedBrand!.id!,
                                    categoryId: selectedCategory!.id!,
                                    price: priceController.text,
                                    description: shoeDescriptionController.text
                                        .trim(),
                                    variants: [],
                                    stock: [],
                                    images: cloudImage,
                                  );
                                  context.read<ProductBloc>().add(
                                    ProductEvent.addProduct(products),
                                  );

                                  clearField(context);
                                },

                                width: screenWidth / 7,
                                height: 40,
                                // child:
                                // state.isSubmitting
                                //     ? CircularProgressIndicator()
                                //     : Text(
                                //         'Add Product',
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .bodyLarge
                                //             ?.copyWith(
                                //               fontSize: 15,
                                //               fontWeight: FontWeight.bold,
                                //             ),
                                //       ),
                              );
                            },
                          ),
                        ],
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
  }
}
