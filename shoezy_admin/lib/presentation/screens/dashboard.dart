import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoezy_admin/widgets/costumWidget.dart';
import 'package:shoezy_admin/widgets/costumresponsiveAppbar.dart';
import 'package:shoezy_admin/widgets/drawer.dart';
import 'package:shoezy_admin/widgets/revenueChart.dart';


// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
 const  DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Costumresponsiveappbar(
        title: 'Dashboard',
        onDraweerTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      drawer: Drawers(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  bool isSmallScreen = constraints.maxWidth < 700;
                  return isSmallScreen
                      ? Row(
                          children: [
                            _buildExpandedCard(
                              isSmallScreen: true,
                              fontSize2: 15,
                              fontSize: 25,
                              iconSize: 40,
                              // height: 100,
                              // width: 100,
                              context: context,
                              title: 'Total Users',
                              count: 100,
                              icon: Icons.people,
                              color: const Color.fromARGB(255, 106, 115, 190),
                            ),
                            SizedBox(width: 16),
                            _buildExpandedCard(
                              fontSize2: 15,
                              fontSize: 25,
                              iconSize: 40,
                              // height: 100,
                              // width: 100,
                              isSmallScreen: true,
                              context: context,
                              title: 'Total Sales',
                              count: 2000,
                              icon: CupertinoIcons.graph_circle,
                              color: const Color.fromARGB(255, 130, 237, 186),
                            ),
                            SizedBox(width: 16),
                            _buildExpandedCard(
                              fontSize2: 15,
                              fontSize: 25,
                              iconSize: 40,
                              // height: 100,
                              // width: 100,
                              isSmallScreen: true,
                              context: context,
                              title: 'Total Pending',
                              count: 20,
                              icon: CupertinoIcons.timer,
                              color: const Color.fromARGB(255, 228, 142, 142),
                            ),
                            SizedBox(width: 16),
                            _buildExpandedCard(
                              fontSize2: 15,
                              fontSize: 25,
                              iconSize: 40,
                              // height: 100,
                              // width: 100,
                              isSmallScreen: true,
                              context: context,
                              title: 'Total Orders',
                              count: 1000,
                              icon: Icons.dashboard,
                              color: const Color.fromARGB(255, 245, 183, 90),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            _buildExpandedCard(
                              context: context,
                              title: 'Total Users',
                              count: 100,
                              icon: Icons.people,
                              color: const Color.fromARGB(255, 106, 115, 190),
                            ),
                            SizedBox(width: 16),
                            _buildExpandedCard(
                              context: context,
                              title: 'Total Sales',
                              count: 2000,
                              icon: CupertinoIcons.graph_circle,
                              color: const Color.fromARGB(255, 130, 237, 186),
                            ),
                            SizedBox(width: 16),
                            _buildExpandedCard(
                              context: context,
                              title: 'Total Pending',
                              count: 20,
                              icon: CupertinoIcons.timer,
                              color: const Color.fromARGB(255, 228, 142, 142),
                            ),
                            SizedBox(width: 16),
                            _buildExpandedCard(
                              context: context,
                              title: 'Total Orders',
                              count: 1000,
                              icon: Icons.dashboard,
                              color: const Color.fromARGB(255, 245, 183, 90),
                            ),
                          ],
                        );
                },
              ),

              SizedBox(height: 30),

              // Revenue Chart
              SizedBox(height: 10),
              RevenueChart(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedCard({
    required BuildContext context,
    required String title,
    required int count,
    required IconData icon,
    required Color color,
    double height = 180,
    double? width,
    double? fontSize,
    double? iconSize,
    double? fontSize2,
    Widget? widget,
    bool? isSmallScreen,
  }) {
    return Expanded(
      child: SizedBox(
        width: width,
        height: height,
        child: CostumWidget.dashboardCard(
          isSmallScreen: isSmallScreen,
          widget: widget,
          fontSize: fontSize,
          fontSize2: fontSize2,
          iconSize: iconSize,
          context: context,
          title: title,
          count: count,
          icon: icon,
          iconColor: color,
        ),
      ),
    );
  }
}
