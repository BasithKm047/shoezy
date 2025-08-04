import 'package:flutter/material.dart';
import 'package:shoezy_admin/presentation/widgets/costumWidget.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final List<List<String>> orderItems = [
      ['RunningShoez', '9', '1', '1200', '1200'],
      ['CasualShoez', '10', '2', '1000', '2000'],
      ['FormalShoez', '8', '1', '1500', '1500'],
      ['FormalShoez', '8', '1', '1500', '1500'],
      ['FormalShoez', '8', '1', '1500', '1500'],
    ];

    return SafeArea(
      child: Scaffold(
        appBar: CostumWidget.appBar(
          title: 'Order#2122',
          context: context,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CostumWidget.labelText(
                  context,
                  'Order Date',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 15),

                CostumWidget.labelText(context, 'Customer Information'),
                SizedBox(height: 10),

                Row(
                  children: [
                    SizedBox(width: screenWidth / 7, child: Divider()),
                    SizedBox(width: 50),
                    SizedBox(width: screenWidth / 1.5, child: Divider())
                  ],
                ),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CostumWidget.labelText(
                          context,
                          'Name',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        CostumWidget.labelText(context, 'Basith'),
                      ],
                    ),
                    SizedBox(width: 70),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CostumWidget.labelText(
                          context,
                          'Email',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        CostumWidget.labelText(context, 'basi1234@gmail.com'),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10),
                SizedBox(width: screenWidth / 7, child: Divider()),
                SizedBox(height: 10),

                CostumWidget.labelText(
                  context,
                  'Phone',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                CostumWidget.labelText(context, '1278553'),

                SizedBox(height: 50),
                CostumWidget.labelText(context, 'Order Summary'),
                SizedBox(height: 20),

                CostumWidget.costumCard(
                  padding: 0,
                  width: screenWidth / 1.1,
                  borderRaduis: 10,
                  elevetion: 4,
                  widget: Column(
                    children: [
                      CostumWidget.costumHeader(
                        height: 50,
                        width: screenWidth / 1.1,
                        borderColor: const Color.fromARGB(255, 213, 210, 210),
                        child: widgets(
                          contex: context,
                          title: ['Product', 'Size', 'Quantity', 'Price', 'Total'],
                        ),
                      ),

                      ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: orderItems.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return widgets(
                            contex: context,
                            title: orderItems[index],
                            isFeild: true,
                          );
                        },
                      ),
                      SizedBox(height: 10,)
                    ],
                    
                  ),
                
                ),

                SizedBox(height: 30),

                Row(
                  children: [
                    Column(
                      children: [
                        CostumWidget.labelText(context, 'Subtotal',
                        
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                        CostumWidget.labelText(context, '1100'),

                      ],
                    ),

                    SizedBox(width: 150,),

                    Column(
                      children: [
                        CostumWidget.labelText(context, 'Shipping',
                        fontSize: 15,
                        fontWeight: FontWeight.normal),

                        CostumWidget.labelText(context, "100")
                      ],
                    )
                     


                  ], 
                ),
                SizedBox(height: 40,),

                SizedBox(
                  width: screenWidth/3,
                  child: Divider()),

                SizedBox(height: 20,),

                CostumWidget.labelText(context, 'Total',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                ),
                CostumWidget.labelText(context, '1200'),

                SizedBox(height: 30,),

                CostumWidget.labelText(context, 'Shipping Adress'),
                CostumWidget.labelText(context, '123 main street, anytown,676305',
                fontSize: 15,
                fontWeight: FontWeight.normal),
                 SizedBox(height: 20,),

                 CostumWidget.labelText(context, 'Payment Information'),

                 SizedBox(height: 20,),
                 SizedBox(
                  width: screenWidth/3,
                  child: Divider(),
                 ),
                 SizedBox(height: 20,),

                 Column(
                  children: [
                    CostumWidget.labelText(context, 'Payment Method',
                    fontSize: 15,
                    fontWeight: FontWeight.normal),

                    CostumWidget.labelText(context, 'Credit Card',
                    fontWeight: FontWeight.w500),


                  ],
                 ),
                 
                 SizedBox(height: 30,),

                 CostumWidget.labelText(context, 'Order Status',
                 fontSize: 15,
                 fontWeight: FontWeight.normal),


                //  SizedBox(height: 20,),
                 CostumWidget.labelText(context, 'Delivered'),
                 SizedBox(height: 50,),




              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ✅ Table Header/Row Widget
Widget widgets({
  required BuildContext contex,
  required List<String> title,
  bool? isFeild,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CostumWidget.labelText(contex, title[0], fontSize: 14),
          ),
        ),
        isFeild ?? false ? Expanded(flex: 1, child: SizedBox()) : SizedBox(),
        Expanded(
          flex: isFeild ?? false ? 3 : 4,
          child: CostumWidget.labelText(contex, title[1], fontSize: 14),
        ),
        isFeild ?? false ? Expanded(flex: 2, child: SizedBox()) : SizedBox(),
        Expanded(
          flex: isFeild ?? false ? 4 : 4,
          child: CostumWidget.labelText(contex, title[2], fontSize: 14),
        ),
        Expanded(
          flex: isFeild ?? false ? 4 : 4,
          child: CostumWidget.labelText(contex, title[3], fontSize: 14),
        ),
        Expanded(
          flex: isFeild ?? false ? 1 : 2,
          child: CostumWidget.labelText(contex, title[4], fontSize: 14),
        ),
        isFeild ?? false ? Expanded(flex: 2, child: SizedBox(width: 10)) : SizedBox(width: 10),
      ],
    ),
  );
}
