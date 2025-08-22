import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoezy_admin/fetures/utils/const/colors.dart';
import 'package:shoezy_admin/fetures/utils/const/routes.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';

class Userslist extends StatelessWidget {
  const Userslist({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: ,
      appBar: CostumWidget.appBar(
        title: 'User List',
        context: context,
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  bool isSmallScreen = constraints.maxWidth < 700;
                  return isSmallScreen
                      ? Column(
                          children: [
                            CostumWidget.costumSearchBar(
                              width: screenWidth / 2,
                              hintText: 'Search Users',
                              borderRadius: 10,
                              icon: Icons.search,
                              // controller: searchController,
                              ontap: () {
                                context.go(Routes.dashboard);
                              },
                            ),
                            SizedBox(height: 10),
                             SizedBox(
                                width: screenWidth / 2,
                                child: CostumWidget.costumElevatedIconButton(
                                  fontsize: 15,
                                  context: context,
                                  text: 'Add User',
                                  backgroundColor: Colors.blue,
                                  borderRadius: 10,
                                  foregroundColor: Colors.white,
                                  ontap: () {
                                    context.go(Routes.addUserScreen);
                                  },
                                ),
                              ),
                          ],
                        )
                      : SizedBox(
                        width: screenWidth/1.2,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CostumWidget.costumSearchBar(
                                width: screenWidth / 4,
                                hintText: 'Search Users',
                                borderRadius: 10,
                                icon: Icons.search,
                                ontap: () {
                                  // context.go(Routes.dashboard);
                                },
                              ),
                        
                           
                              SizedBox(
                                width: screenWidth / 8,
                                child: CostumWidget.costumElevatedIconButton(
                                  fontsize: 15,
                                  context: context,
                                  text: 'Add User',
                                  backgroundColor: Colors.blue,
                                  borderRadius: 10,
                                  foregroundColor: Colors.white,
                                  ontap: () {
                                    context.go(Routes.addUserScreen);
                                  },
                                ),
                              ),
                        
                              // SizedBox(width: 5),
                            ],
                          ),
                      );
                },
              ),

              // SizedBox(height: 10),
              CostumWidget.costumCard(
                height: screenHeight,
                width: screenWidth / 1.2,
                widget: Column(
                  children: [
                    CostumWidget.costumHeader(
                      height: 40,
                      width: screenWidth / 1.2,
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'S.No',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          SizedBox(width: 10),

                          Expanded(
                            flex: 4,
                            child: Text(
                              'User name',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              'Email',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Action',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: CostumWidget.costumListviewBuilder(
                        child: CostumWidget.userdetailsLitview(context: context, widgets: widgets(context, screenWidth),),
                      ),
                    ),
                  ],
                ),
                borderRaduis: 15,
                elevetion: 4,
                shadowColor: CostumColors.scaffoldBackroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget widgets(BuildContext context, double screenWidth) {
  return Row(
    children: [
  Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                '1',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 10),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Basith',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontSize: 15),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              'basith @ gmail.com',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontSize: 15),
            ),
          ),
          
          Expanded(
            flex: 1,
            child: SizedBox(
              width: screenWidth / 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {},
                child: Text(
                  'Block',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
    ],
  );
}