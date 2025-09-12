import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/product/product_model.dart';
import 'package:shoezy_admin/data/repositories/cloudinary_services.dart';
import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
import 'package:shoezy_admin/presentation/bloc/addProducts/bloc/product_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/category_bloc/bloc/category_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/variant_field.dart';

class Addproductscreen extends StatelessWidget {
  const Addproductscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    final formKey = GlobalKey<FormState>();
    final shoeNameController = TextEditingController();
    final shoeDescriptionController = TextEditingController();
    final priceController = TextEditingController();
    context.read<BrandBloc>().add(FetchBrands());
    context.read<CategoryBloc>().add((GetCategories()));
    clearField(BuildContext context) {
      shoeNameController.clear();
      priceController.clear();
      shoeDescriptionController.clear();
      context.read<BrandBloc>().add(const BrandEvent.clearSelection());
      context.read<CategoryBloc>().add(const CategoryEvent.clearSelection());
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

                      BlocBuilder<VariantsBloc, VariantsState>(
                        builder: (context, state) {
                          final isExpanded = state.maybeWhen(
                            orElse: () => false,
                            showFieldsState: () => true,
                          );
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<VariantsBloc>().add(
                                    VariantsEvent.toggleFields(),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Variant',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              isExpanded ? VariantField() : Container(),
                              // VariantField()
                            ],
                          );
                        },
                      ),

                      SizedBox(height: 10),

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
                              );
                            },
                            builder: (context, state) {
                              state.maybeWhen(
                                orElse: () => null,
                                loading: () {
                                  return CircularProgressIndicator(
                                    color: Colors.blue,
                                  );
                                },
                              );
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
                                    colorCode: '',
                                    colorName: '',
                                    productName: shoeNameController.text.trim(),
                                    brandName: selectedBrand!.name,
                                    categoryName: selectedCategory!.name,
                                    price: priceController.text,
                                    description: shoeDescriptionController.text
                                        .trim(),
                                    variants: [],

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
