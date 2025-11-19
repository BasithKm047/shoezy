import 'package:flutter/material.dart';

import 'package:shoezy_admin/widgets/costumWidget.dart';
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
                  VariantAddingFeilds.varaintListView(),
             
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
