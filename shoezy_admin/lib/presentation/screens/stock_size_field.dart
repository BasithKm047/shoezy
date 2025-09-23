import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/size_stock/bloc/size_stock_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/add_size_stock_field.dart';

// ignore: must_be_immutable
class SizeStockFieldWidget extends StatelessWidget {
  SizeStockFieldWidget({super.key});

  final TextEditingController sizeController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          decoration: const BoxDecoration(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddSizeStockField.labelText(context),
                const SizedBox(height: 10),

                // Size + Stock Adding Field
                AddSizeStockField.sizeStockAddingField(
                  context: context,
                  sizeController: sizeController,
                  stockController: stockController,
                  formKey: formKey,
                ),

                const SizedBox(height: 20),

                // Size + Stock List View
                BlocListener<SizeStockBloc, SizeStockState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: () {
                        // If you want to show a snackbar or hide loading overlay
                        CostumWidget.showCustomSnackbar(
                          context: context,
                          message: "Size/Stock updated successfully",
                        );
                      },
                      failure: (err) {
                        CostumWidget.showCustomSnackbar(
                          context: context,
                          message: "Error: $err",
                        );
                      },
                      orElse: () {},
                      loaded: (sizeStock) => sizeStock,
                    );
                  },
                  child: AddSizeStockField.varaint_sizestock_listview(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
