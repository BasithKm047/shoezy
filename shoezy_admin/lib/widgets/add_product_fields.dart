import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/product/product_model.dart';
import 'package:shoezy_admin/data/model/vareintModel/varientsModel.dart';
import 'package:shoezy_admin/presentation/bloc/addProducts/bloc/product_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/category_bloc/bloc/category_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';

class AddProductFields {
  static Widget descriptionFeild(
    TextEditingController shoeDescriptionController,
    double screenWidth,
  ) {
    return CostumWidget.costumTextformField(
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
    );
  }

  static Widget namingFeild(
    TextEditingController nameController,
    double screenWidth,
  ) {
    return CostumWidget.costumTextformField(
      controller: nameController,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter the shoe name';
        } else if (value.length < 3) {
          return 'Shoe name must be at least 3 characters long';
        } else if (!RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(value)) {
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
    );
  }

  static Widget priceField(
    TextEditingController priceController,
    double screenWidth,
  ) {
    return CostumWidget.costumTextformField(
      controller: priceController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Price is required';
        } else if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
          return 'Enter a valid number';
        }
        return null;
      },
      hintText: 'Price',
      width: screenWidth / 2,
      onChanged: (value) {},
    );
  }

  static BlocBuilder<CategoryBloc, CategoryState> categorySelectField(
    double screenWidth,
  ) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (categories, selectedCategory) {
            final items = categories.map((c) => c.name).toSet().toList();
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
                  CategoryEvent.selectedCategory(value.toString()),
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
    );
  }

  static BlocBuilder<BrandBloc, BrandState> brandSelectField(
    double screenWidth,
  ) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (brands, selectedBrand) {
            return CostumWidget.costumDropdown(
              items: brands.map((b) => b.name).toList(),
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
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
    );
  }

  static Row addProductButton(
    TextEditingController shoeNameController,
    TextEditingController priceController,
    TextEditingController shoeDescriptionController,
    Null Function(BuildContext context) clearField,
    double screenWidth,
  ) {
    return Row(
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
                return CircularProgressIndicator(color: Colors.blue);
              },
            );
            return CostumWidget.costumElevatedButton(
              context: context,
              title: state.maybeWhen(
                orElse: () => 'Add Product',
                loading: () => 'Adding Product...',
              ),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              ontap: () async {
                final selectedBrand = context.read<BrandBloc>().state.maybeWhen(
                  orElse: () => null,
                  loaded: (brands, selectedBrandName) => brands.firstWhere(
                    (b) => b.name == selectedBrandName,
                    orElse: () => brands.first,
                  ),
                );
                final selectedCategory = context
                    .read<CategoryBloc>()
                    .state
                    .maybeWhen(
                      orElse: () => null,
                      loaded: (categories, selectedCategoryName) =>
                          categories.firstWhere(
                            (c) => c.name == selectedCategoryName,
                            orElse: () => categories.first,
                          ),
                    );
                if (selectedBrand == null || selectedCategory == null) {
                  CostumWidget.showCustomSnackbar(
                    context: context,
                    message: 'Please select a brand and category',
                    backgroundColor: Colors.red,
                  );
                  return;
                }
                List<Variantsmodel> variants = context
                    .read<VariantsBloc>()
                    .state
                    .maybeWhen(
                      orElse: () => [],
                      data: (images, sizeStock, variants, showFields) =>
                          variants,
                    );
                Logger().i('Current variants count: ${variants.length}');

                if (variants.isEmpty) {
                  CostumWidget.showCustomSnackbar(
                    context: context,
                    message: 'Please add at least one variant',
                    backgroundColor: Colors.red,
                  );
                  return;
                }

                final products = ProductModel(
                  productName: shoeNameController.text.trim(),
                  brandName: selectedBrand.name,
                  categoryName: selectedCategory.name,
                  price: priceController.text,
                  description: shoeDescriptionController.text.trim(),
                  variants: variants.map((v) => v.toJson()).toList(),
                  createdAt: DateTime.now(),
                );
                print(products);
                context.read<ProductBloc>().add(
                  ProductEvent.addProduct(product: products),
                );

                clearField(context);
              },

              width: screenWidth / 7,
              height: 40,
            );
          },
        ),
      ],
    );
  }
}
