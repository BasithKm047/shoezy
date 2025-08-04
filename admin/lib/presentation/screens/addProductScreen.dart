import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/data/model/brandModel.dart';
import 'package:shoezy_admin/data/model/category_model.dart';
import 'package:shoezy_admin/presentation/bloc/addProducts/add_product_bloc_bloc.dart';
import 'package:shoezy_admin/presentation/widgets/costumWidget.dart';
import 'package:shoezy_admin/presentation/widgets/imageUploader.dart';

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
    final stockControllers = <String, TextEditingController>{};
    //    String? selectedBrand;
    // String? selectedCategory;
    // String? selectedColor;
    // List<String> selectedSizes = [];
    // Map<String, int?> sizeStockMap = {};
    // List<String> colorOptions = ['Red', 'Blue', 'Green', 'Black'];
    // List<String> sizeOptions = ['6', '7', '8', '9', '10'];
    // List<Uint8List> shoeImages = [];
    // Map<String, TextEditingController> stockControllers = {};

    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Add Product',
        context: context,
        centerTitle: true,
      ),
      body: BlocConsumer<AddProductBlocBloc, AddProductBlocState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            CostumWidget.showCustomSnackbar(
              context: context,
              message: state.errorMessage!,
              backgroundColor: Colors.red,
            );
          }
          if (state.isSuccess) {
            CostumWidget.showCustomSnackbar(
              context: context,
              message: 'Product added successfully',
              backgroundColor: Colors.green,
            );
            // Clear the form fields
            context.read<AddProductBlocBloc>().add(
              const AddProductBlocEvent.reset(),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
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
                              }
                              return null;
                            },

                            hintText: 'Shoe Name',
                            width: screenWidth / 2,
                            onChanged: (value) {
                              if (value != null) {
                                context.read<AddProductBlocBloc>().add(
                                  AddProductBlocEvent.nameChanged(value),
                                );
                                print('Shoe Name Changed: $value');
                              } else {
                                print('Shoe Name is null or empty');
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          CostumWidget.labelText(context, 'Select Brand'),
                          SizedBox(height: 10),
                          CostumWidget.costumDropdown(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a brand';
                              }
                              return null;
                            },
                            items: state.availableBrands
                                .map((b) => b.name)
                                .toList(),
                            selectedValue: state.selectedBrand?.name,
                            hintText: 'Brands',
                            onChanged: (value) {
                              final brandId = state.availableBrands
                                  .firstWhere(
                                    (b) => b.name == value,
                                    orElse: () => Brandmodel(
                                      id: '',
                                      name: value!,
                                      imageUrl: '',
                                      colors: [],
                                    ),
                                  )
                                  .id;
                              context.read<AddProductBlocBloc>().add(
                                AddProductBlocEvent.brandChanged(brandId),
                              );
                            },
                            // backgroundColor: Colors.white,
                            width: screenWidth / 2,
                            borderRaduis: 10,
                          ),
                          SizedBox(height: 10),
                          CostumWidget.labelText(context, 'Select Category'),
                          SizedBox(height: 10),
                          CostumWidget.costumDropdown(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a category';
                              }
                              return null;
                            },
                            items: state.availableCategories
                                .map((c) => c.name)
                                .toList(),
                            selectedValue: state.selectedCategory?.name,
                            hintText: 'Category',
                            onChanged: (value) {
                              final catogeryId = state.availableCategories
                                  .firstWhere(
                                    (c) => c.name == value,
                                    orElse: () => CategoryModel(
                                      id: '',
                                      name: '',
                                      sizes: [],
                                    ),
                                  )
                                  .id;
                              context.read<AddProductBlocBloc>().add(
                                AddProductBlocEvent.categorySelected(
                                  catogeryId,
                                ),
                              );
                            },
                            borderRaduis: 10,
                            width: screenWidth / 2,
                          ),
                          SizedBox(height: 10),
                          CostumWidget.labelText(context, 'Select Color'),
                          SizedBox(height: 10),
                          FormField<String>(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a color';
                              }
                              return null;
                            },
                            builder: (FormFieldState<String> feild) {
                              return CostumWidget.costumSelector(
                                items: state.availableColors,
                                selectedItems: state.selectedColor.isNotEmpty
                                    ? [state.selectedColor]
                                    : [],
                                onchanged: (value, isSelected) {
                                  context.read<AddProductBlocBloc>().add(
                                    AddProductBlocEvent.colorChanged(
                                      isSelected ? value : '',
                                    ),
                                  );
                                },
                                width: screenWidth / 2,
                                textColor: Colors.black,
                                selectedColor: Colors.blue,
                                unselectedColor: Colors.white,
                              );
                            },
                          ),
                          if (state.selectedColor.isNotEmpty) ...[
                            SizedBox(height: 10),
                            CostumWidget.labelText(context, 'Select Sizes'),
                            SizedBox(height: 10),
                            FormField<List<String>>(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select at least one size';
                                }
                                return null;
                              },
                              builder: (FormFieldState<List<String>> feild) {
                                return CostumWidget.costumSelector(
                                  items: state.availableSize,
                                  selectedItems: state.selectedSizes,
                                  onchanged: (size, isSelected) {
                                    context.read<AddProductBlocBloc>().add(
                                      AddProductBlocEvent.sizeSelected(
                                        size,
                                        isSelected,
                                      ),
                                    );
                                  },
                                  width: screenWidth / 2,
                                  textColor: Colors.black,
                                  selectedColor: Colors.blue,
                                  // unselectedColor: CostumColors().textFormFieldBackgroundColor,
                                );
                              },
                            ),
                            if (state.selectedSizes.isNotEmpty) ...[
                              SizedBox(height: 10),
                              CostumWidget.labelText(
                                context,
                                'Stock for Selected Sizes',
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: screenWidth / 2,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.selectedSizes.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 10),
                                  itemBuilder: (context, index) {
                                    final size = state.selectedSizes[index];
                                    stockControllers[size] ??=
                                        TextEditingController(
                                          text:
                                              state.sizeStockMap[size]
                                                  ?.toString() ??
                                              '',
                                        );
                                    return Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Text(
                                            size,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        SizedBox(
                                          width: screenWidth / 5,
                                          child: CostumWidget.costumTextformField(
                                            hintText: 'Stock for size $size',
                                            controller: stockControllers[size],
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter stock for $size';
                                              } else if (!RegExp(
                                                r'^\d+(\.\d{1,2})?$',
                                              ).hasMatch(value)) {
                                                return 'Enter a valid number';
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              if (value != null) {
                                                context
                                                    .read<AddProductBlocBloc>()
                                                    .add(
                                                      AddProductBlocEvent.stockUpdated(
                                                        size,
                                                        value,
                                                      ),
                                                    );
                                              } else {
                                                print(
                                                  'Stock for $size is null or empty',
                                                );
                                              }
                                            },
                                            // width: screenWidth / 1.2,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ],
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
                              if (value != null) {
                                context.read<AddProductBlocBloc>().add(
                                  AddProductBlocEvent.priceChanged(value),
                                );
                                print('Price Changed: $value');
                              } else {
                                print(' Price is null or empty');
                              }
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
                            onChanged: (value) {
                              if (value != null) {
                                context.read<AddProductBlocBloc>().add(
                                  AddProductBlocEvent.descriptionChanged(value),
                                );
                                print('Description Changed: $value');
                              } else {
                                print('Description is null or empty');
                              }
                            },
                          ),
                          SizedBox(height: 30),
                          CostumImageUploader(
                            images: state.productImage,
                            onImagesChanged: (changed) {
                              // final currentImages = state.productImage;

                              context.read<AddProductBlocBloc>().add(
                                AddProductBlocEvent.imagesUpdated(changed),
                              );
                              print('Images Updated: ${changed.length}');
                            },
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CostumWidget.costumElevatedButton(
                                context: context,
                                title: 'Add Product',
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                ontap: () {
                                  state.isSubmitting
                                      ? null
                                      : () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            context.read<AddProductBlocBloc>().add(
                                              const AddProductBlocEvent.submit(),
                                            );
                                          }
                                        };
                                },
                                width: screenWidth / 7,
                                height: 40,
                                child: state.isSubmitting
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Add Product',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
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
          );
        },
      ),
    );
  }
}
