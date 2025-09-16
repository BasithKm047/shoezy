import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoezy_admin/fetures/utils/const/colors.dart';
import 'package:shoezy_admin/fetures/utils/const/routes.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';

class Productscreen extends StatelessWidget {
  const Productscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CostumWidget.appBar(
        title: 'Products',
        context: context,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildTopBar(context, screenWidth),
              const SizedBox(height: 20),
              _buildProductTable(context, screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, double screenWidth) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 850;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: isSmallScreen
              ? Column(
                  children: [
                    CostumWidget.costumSearchBar(
                      width: screenWidth / 1.3,
                      hintText: 'Search Products',
                      borderRadius: 10,
                      icon: Icons.search,
                      ontap: () {},
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: screenWidth / 1.3,
                      child: CostumWidget.costumElevatedIconButton(
                        fontsize: 15,
                        context: context,
                        text: 'Add Products',
                        backgroundColor: Colors.blue,
                        borderRadius: 10,
                        foregroundColor: Colors.white,
                        ontap: () {
                          context.go(Routes.addproductscreen);
                        },
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  width: screenWidth / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CostumWidget.costumSearchBar(
                        width: screenWidth / 3,
                        hintText: 'Search Products',
                        borderRadius: 10,
                        icon: Icons.search,
                        ontap: () {},
                      ),
                      CostumWidget.costumElevatedIconButton(
                        fontsize: 15,
                        context: context,
                        text: 'Add Products',
                        backgroundColor: Colors.blue,
                        borderRadius: 10,
                        foregroundColor: Colors.white,
                        ontap: () {
                          context.go(Routes.addproductscreen);
                        },
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildProductTable(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    final isSmallScreen = screenWidth < 700;

    return CostumWidget.costumCard(
      height: screenHeight,
      width: isSmallScreen ? screenWidth / 1.05 : screenWidth / 1.2,
      borderRaduis: 15,
      elevetion: 4,
      shadowColor: CostumColors.scaffoldBackroundColor,
      widget: Column(
        children: [
          _buildTableHeader(context, isSmallScreen),
          SizedBox(
            height: 10,
          ),
        
            
            Expanded(
              child: ListView.builder(
                itemCount: 5,                itemBuilder: (context, index) {
                  return _buildProductRow(
                    context,
                    index: index+1,
                    name: 'Nike Shoe',
                    category: 'Men',
                    brand: 'Nike',
                    stock: 100,
                    price: 1999,
                    isSmall: isSmallScreen,
                  );
                },
              ),
            ),
          
        ],
      ),
    );
  }

  Widget _buildTableHeader(BuildContext context, bool isSmall) {
    return CostumWidget.costumHeader(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: isSmall ? 3 : 2,
            child: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('S.No'),
            ),
          ),
          Expanded(flex: 5, child: Text('Name')),
          Expanded(flex: 4, child: Text('Category')),
          Expanded(flex: 4, child: Text('Brand')),
          Expanded(flex: 4, child: Text('Stock')),
          Expanded(flex: 4, child: Text('Price')),
          Expanded(flex: 4, child: Text('Actions')),
        ],
      ),
    );
  }

  Widget _buildProductRow(
    BuildContext context, {
    required int index,
    required String name,
    required String category,
    required String brand,
    required int stock,
    required int price,
    required bool isSmall,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('$index')),
          Expanded(flex: 5, child: Text(name)),
          Expanded(flex: 4, child: Text(category)),
          Expanded(flex: 4, child: Text(brand)),
          Expanded(flex: 4, child: Text('$stock')),
          Expanded(flex: 4, child: Text('₹$price')),
          Expanded(
            flex: isSmall ? 6 : 4,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
