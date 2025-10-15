import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/category_bloc/bloc/category_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/gender/cubit/gender_cubit.dart';
import 'package:shoezy_admin/presentation/bloc/size_stock/bloc/size_stock_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/tag_bloc/bloc/tag_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
import 'package:shoezy_admin/presentation/screens/stock_size_field.dart';
import 'package:shoezy_admin/widgets/add_product_fields.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/presentation/screens/variant_field.dart';

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
    context.read<TagBloc>().add(const TagEvent.fetchTags());

    clearField(BuildContext context) {
      shoeNameController.clear();
      priceController.clear();
      shoeDescriptionController.clear();
      context.read<BrandBloc>().add(const BrandEvent.clearSelection());
      context.read<CategoryBloc>().add(const CategoryEvent.clearSelection());
      context.read<VariantsBloc>().add(const VariantsEvent.clearVariants());
      context.read<SizeStockBloc>().add(const SizeStockEvent.clearSizeStock());
      context.read<TagBloc>().add(const TagEvent.clearSelection());
      context.read<GenderCubit>().clearGender();
    }

    List<String> gender = ['Male', 'Female', 'Children'];

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
                      AddProductFields.namingFeild(
                        shoeNameController,
                        screenWidth,
                      ),
                      SizedBox(height: 10),
                      CostumWidget.labelText(context, 'Select Brand'),
                      SizedBox(height: 10),
                      AddProductFields.brandSelectField(screenWidth),
                      SizedBox(height: 10),
                      CostumWidget.labelText(context, 'Select Category'),

                      SizedBox(height: 10),

                      AddProductFields.categorySelectField(
                        screenWidth: screenWidth,
                      ),
                      SizedBox(height: 10),

                      CostumWidget.labelText(context, 'Add Tags'),
                      SizedBox(height: 10),
                      AddProductFields.tagSelectorField(screenWidth),
                      SizedBox(height: 10),
                      CostumWidget.labelText(context, 'Select Gender'),
                      SizedBox(height: 10),
                      AddProductFields.genderSelectorField(screenWidth, gender),
                      SizedBox(height: 10),

                      CostumWidget.labelText(context, 'Add Variants'),
                      SizedBox(height: 10),
                      VariantField(),
                      SizedBox(height: 10),
                      SizeStockFieldWidget(),
                      SizedBox(height: 10),

                      SizedBox(height: 10),
                      CostumWidget.labelText(context, 'Price'),
                      SizedBox(height: 10),
                      AddProductFields.priceField(priceController, screenWidth),

                      SizedBox(height: 10),
                      CostumWidget.labelText(context, 'Description'),
                      SizedBox(height: 10),
                      AddProductFields.descriptionFeild(
                        shoeDescriptionController,
                        screenWidth,
                      ),
                      SizedBox(height: 20),
                      AddProductFields.addProductButton(
                        shoeNameController,
                        priceController,
                        shoeDescriptionController,
                        clearField,
                        formKey,
                        screenWidth,
                      ),
                      SizedBox(height: 20),
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
