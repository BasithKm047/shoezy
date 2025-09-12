import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:loginpage/fetures/utils/const/routes.dart';
import 'package:loginpage/presentation/bloc/orderSelection_cubit/cubit/order_selection_cubit.dart';
import 'package:loginpage/widgets/costumWidget.dart';
import 'package:loginpage/widgets/orderDetilsFilteration.dart';

class OrderlistScreen extends StatefulWidget {
  const OrderlistScreen({super.key});

  @override
  State<OrderlistScreen> createState() => _OrderlistScreenState();
}

class _OrderlistScreenState extends State<OrderlistScreen> {
  void showCalendarPicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Center(
          child: Container(
            width: 450,
            height: 400,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Colors.deepPurple,
                    onPrimary: Colors.white,
                    onSurface: Colors.black,
                  ),
                  dialogBackgroundColor: Colors.transparent,
                ),
                child: child!,
              ),
            ),
          ),
        );
      },
    );

    if (pickedDate != null) {
      context.read<OrderSelectionCubit>().selectedDate(pickedDate);
    }
  }

  void showOrderTypeDialog() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return BlocBuilder<OrderSelectionCubit, OrderSelectionState>(
          builder: (context, state) {
            String selected = state is OrderSelectionUpdated
                ? state.orderselection.selectedOrderType
                : '';
            if (state is OrderSelectionUpdated) {
              selected = state.orderselection.selectedOrderType;
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Order Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CostumWidget.costumSelector(
                    textColor: Colors.black,
                    direction: Axis.horizontal,
                    items: ['Card payment', 'Cash on delivery', 'online'],
                    selectedItems: [selected],
                    onchanged: (item, isSelected) {
                      context.read<OrderSelectionCubit>().selectOrderType(item);
                    },
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 20),
              ],
            );
          },
        );
      },
    );
  }

  void showOrderStatusDialog() {
    // final cubit = context.read<OrderSelectionCubit>();
    // final state = cubit.state;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BlocBuilder<OrderSelectionCubit, OrderSelectionState>(
          builder: (context, state) {
            String selected = state is OrderSelectionUpdated
                ? state.orderselection.selectedorderStatus
                : '';
            if (state is OrderSelectionUpdated) {
              selected = state.orderselection.selectedorderStatus;
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Order Status',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CostumWidget.costumSelector(
                    textColor: Colors.black,
                    // selectedColor: Color,
                    direction: Axis.horizontal,
                    items: ['Ordered', 'Pending', 'Delivered'],
                    selectedItems: [selected],
                    onchanged: (item, isSelected) {
                      context.read<OrderSelectionCubit>().selectedOrederStatus(
                        item,
                      );
                    },
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 20),
              ],
            );
          },
        );
      },
    );
  }

  void resetFilter() {
    context.read<OrderSelectionCubit>().resetSelection();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Order List',
        context: context,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CostumWidget.costumCard(
                width: screenWidth / 1.1,
                borderRaduis: 15,
                widget: CostumWidget.costumHeader(
                  height: 50,
                  width: screenWidth / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.filter_alt_outlined),
                          Text('Filter By'),
                        ],
                      ),
                      BlocBuilder<OrderSelectionCubit, OrderSelectionState>(
                        builder: (context, state) {
                          final selectedDate = state is OrderSelectionUpdated
                              ? state.selectedDate
                              : null;
                          return FilterDropdownButton(
                            label: selectedDate != null
                                ? DateFormat('dd MMM').format(selectedDate)
                                : 'Date',
                            icon: Icons.keyboard_arrow_down,
                            onTap: showCalendarPicker,
                          );
                        },
                      ),
                      BlocBuilder<OrderSelectionCubit, OrderSelectionState>(
                        builder: (context, state) {
                          final selectedType = state is OrderSelectionUpdated
                              ? state.orderselection.selectedOrderType
                              : '';
                          return FilterDropdownButton(
                            label: selectedType.isNotEmpty
                                ? selectedType
                                : 'Order Type',
                            icon: Icons.keyboard_arrow_down,
                            onTap: showOrderTypeDialog,
                          );
                        },
                      ),
                      BlocBuilder<OrderSelectionCubit, OrderSelectionState>(
                        builder: (context, state) {
                          final selectedStatus = state is OrderSelectionUpdated
                              ? state.orderselection.selectedorderStatus
                              : '';

                          return FilterDropdownButton(
                            label: selectedStatus.isNotEmpty
                                ? selectedStatus
                                : 'Order Status',
                            icon: Icons.keyboard_arrow_down,
                            onTap: showOrderStatusDialog,
                          );
                        },
                      ),
                      InkWell(
                        onTap: resetFilter,
                        child: const Row(
                          children: [
                            Icon(Icons.refresh, color: Colors.red),
                            SizedBox(width: 5),
                            Text(
                              'Reset Filter',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              CostumWidget.costumCard(
                width: screenWidth / 1.1,
                borderRaduis: 15,
                height: screenHeight / 1.4,
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      CostumWidget.costumHeader(
                        height: 40,
                        width: screenWidth / 1.1,
                        borderColor: Colors.grey,
                        borderWidth: 1,
                        child: widgets(
                          context: context,
                          isFeild: false,
                          isIcon: false,
                          title: ['ID', 'Name', 'Date', 'Brand', 'Status'],
                        ),
                      ),
                      SizedBox(height: 10),
                      // Sample data for demonstration
                      Column(
                        children: List.generate(
                          10, // Replace with actual data length
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: widgets(
                              context: context,
                              isFeild: true,
                              isIcon: true,
                              title: [
                                '${index + 1}',
                                'Basith',
                                '04-10-2025',
                                'Nike',
                                'Completed',
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget widgets({
  required BuildContext context,
  bool? isIcon,
  List<String>? title,
  bool? isFeild,
  bool? isSmall,
  String? status,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        flex: 1,
        child: Text(
          title![0],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15),
        ),
      ),
      Expanded(
        flex: 2,
        child: Text(
          title[1],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15),
        ),
      ),
      Expanded(
        flex: 4,
        child: Text(
          title[2],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15),
        ),
      ),
      Expanded(
        flex: 7,
        child: Text(
          title[3],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15),
        ),
      ),
      isFeild!
          ? Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(right: 100),
                child: CostumWidget.costumElevatedButton(
                  context: context,
                  backgroundColor: const Color.fromARGB(255, 134, 207, 137),
                  title: title[4], // Use title[4] for status
                  foregroundColor: Colors.white,
                ),
              ),
            )
          : Expanded(
              flex: 2,
              child: Text(
                title[4],
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 15),
              ),
            ),
      isFeild
          ? Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: CostumWidget.costumElevatedButton(
                  ontap: () {
                    context.go(Routes.orderDetailScreen);
                  },
                  width: 50,
                  context: context,
                  title: 'View',
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            )
          : Expanded(flex: 4, child: SizedBox()),
    ],
  );
}
