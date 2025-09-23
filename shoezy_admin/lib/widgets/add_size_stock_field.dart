import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shoezy_admin/data/model/size_stock_model.dart/size_stock_model.dart';
import 'package:shoezy_admin/presentation/bloc/size_stock/bloc/size_stock_bloc.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';

class AddSizeStockField {
  static labelText(BuildContext context) =>
      CostumWidget.labelText(context, 'Sizes and Stocks');

  static BlocBuilder<SizeStockBloc, SizeStockState>
  varaint_sizestock_listview() {
    return BlocBuilder<SizeStockBloc, SizeStockState>(
      builder: (context, state) {
        List<SizeStockModel> sizeStockList = state.maybeWhen(
          orElse: () => [],
          loaded: (sizeStock) => sizeStock,
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
                                CostumWidget.showCustomAlertDialog(
                                  confirmButtonColor: Colors.red,
                                  confirmButtonText: 'Delete',
                                  context: context,
                                  title: 'Confirm Deletion',

                                  content:
                                      'Are you sure you want to delete size ${sizeStock.size}?',
                                  onConfirm: () {
                                    Logger().i(
                                      'Removing SizeStockModel: Size=${sizeStock.size}, Stock=${sizeStock.stock}',
                                    );

                                    context.read<SizeStockBloc>().add(
                                      SizeStockEvent.removedSizeStock(
                                        sizeStock,
                                      ),
                                    );
                                    // Navigator.of(context).pop();
                                  },
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

  static Row sizeStockAddingField({
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
              final List<SizeStockModel> sizeStock = [
                SizeStockModel(
                  size: sizeController.text,
                  stock: int.parse(stockController.text),
                ),
              ];
              context.read<SizeStockBloc>().add(
                SizeStockEvent.addedSizeStock(sizeStock),
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
}
