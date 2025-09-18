import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';

import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/loading_overlay.dart';
import 'package:shoezy_admin/widgets/variant_adding_feilds.dart';

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
                  VariantAddingFeilds.variantColorField(
                    context: context,
                    colorController: colorController,
                  ),
                  SizedBox(height: 20),
                  CostumWidget.labelText(context, 'Sizes and Stocks'),
                  SizedBox(height: 10),
                  VariantAddingFeilds.varaint_sizeStockAddingField(
                    context: context,
                    formKey: formKey,
                    sizeController: sizeController,
                    stockController: stockController,
                  ),
                  SizedBox(height: 10),
                  VariantAddingFeilds.varaint_sizestock_listview(),
                  SizedBox(height: 10),

                  VariantAddingFeilds.varaintImageField(),

                  SizedBox(height: 10),
                  VariantAddingFeilds.variantAddingButton(
                    colorController: colorController,
                    formKey: formKey,
                    sizeController: sizeController,
                    screenWidth: screenWidth,
                    stockController: stockController,
                  ),
                  SizedBox(height: 20),
                  BlocListener<VariantsBloc, VariantsState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        data: (images, sizeStock, variants, showFields) {
                          LoadingOverlay.hide();
                        },
                        failure: (_) {
                          LoadingOverlay.hide();
                        },
                        orElse: () {},
                      );
                    },
                    child: VariantAddingFeilds.varaintListView(),
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
