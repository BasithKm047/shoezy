import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loginpage/fetures/utils/const/routes.dart';
import 'package:loginpage/widgets/costumWidget.dart';

class VarientsScreen extends StatelessWidget {
  const VarientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 50.0, top: 50),
      child: Scaffold(
        appBar: CostumWidget.appBar(
          title: 'Variant Options',
          context: context,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),

              child: SizedBox(
                width: screenWidth / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 15),
                    CostumWidget.costumElevatedButton(
                      ontap: () {
                        context.go(Routes.addvarientsScreen);
                      },
                      width: screenWidth / 7,
                      context: context,
                      title: 'Add Variants',
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            CostumWidget.costumCard(
              elevetion: 4,
              height: 500,
              width: screenWidth / 1.1,
              borderRaduis: 10,
              widget: Column(
                children: [
                  CostumWidget.costumHeader(
                    height: 40,
                    width: screenWidth / 1.1,
                    child: header(context: context),
                  ),

                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        // final listofCategory = ['Sneakers', 'Casual', 'Sports'];
                        return _widget(
                          context: context,
                          image: 'image',
                          name: 'Red',
                          size: 10,
                          stock: 200,
                          // product: products[index],
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _widget({
  required BuildContext context,
  required String name,
  required String image,
  required int size,
  required int stock,
  // bool? isFeild,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: CostumWidget.labelText(
            context,
            image,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),

        Expanded(
          flex: 2,
          child: CostumWidget.labelText(
            context,
            name,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),

        // Expanded(
        //   flex: 2,
        //   child: Center(
        //     child: CostumWidget.labelText(
        //       context,
        //        size.toString(),
        //       fontSize: 15,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
         Expanded(
          flex: 2,
          child: Center(
            child: CostumWidget.labelText(
              context,
               stock.toString(),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit, color: Colors.blue),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget header({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: CostumWidget.labelText(
            context,
            'Shoe Image',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          flex: 2,
          child: CostumWidget.labelText(
            context,
            'Color',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Expanded(
        //   flex: 2,
        //   child: Center(
        //     child: CostumWidget.labelText(
        //       context,
        //       'Size',
        //       fontSize: 15,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
          Expanded(
          flex: 2,
          child: Center(
            child: CostumWidget.labelText(
              context,
              'Stock',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CostumWidget.labelText(
                context,
                'Action',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
