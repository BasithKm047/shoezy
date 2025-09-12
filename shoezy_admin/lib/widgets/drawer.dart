import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loginpage/fetures/utils/const/commonFunction.dart';
import 'package:loginpage/fetures/utils/const/routes.dart';
import 'package:loginpage/widgets/costumWidget.dart';
// import 'package:shoezy_admin/fetures/utils/const/commonFunction.dart';
// import 'package:shoezy_admin/fetures/utils/const/routes.dart';
// import 'package:shoezy_admin/widgets/costumWidget.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});
  

  @override
  Widget build(BuildContext context) {
    return   LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth=constraints.maxWidth;

        double drawerWidth= screenWidth< 600 ? 180 :screenWidth <1024 ?220 :260;
        return Container(
        width: drawerWidth,
        margin: EdgeInsets.only(top: 5, bottom: 5,left: 5),
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black,
          //     blurRadius: 3,
          //     offset: Offset(0.2, 0.5),
          //   )
          // ]
        ),
        
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                
                child: Center(
                  child: Text('Admin',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  
                            ),),
                )),
              buildDrawerButton(context: context, title: 'Dashboard', icon: Icons.dashboard, routeName: Routes.dashboard),
              buildDrawerButton(context: context, title: 'Users', icon: Icons.person, routeName: Routes.users),
              buildDrawerButton(context: context, title: 'Products', icon: Icons.shopping_bag, routeName: Routes.products),
              buildDrawerButton(context: context, title: 'Orders', icon: Icons.list_alt, routeName: Routes.orderList),
              buildDrawerButton(context: context, title: 'Category', icon: Icons.category, routeName: Routes.category),
              buildDrawerButton(context: context, title: 'Brand', icon: FontAwesomeIcons.brandsFontAwesome, routeName: Routes.brand),
              // buildDrawerButton(context: context, title: 'Varients', icon:Icons.style, routeName:Routes.varientsScreen ),
              buildDrawerButton(context: context, title: 'Settings', icon: Icons.settings, routeName: Routes.setting),
              const Spacer(), 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: CostumWidget.costumElevatedButton(
                    context: context,
                    title: 'Logout',
                    backgroundColor: Colors.red,
                    width: drawerWidth - 32, // Adjust width to fit drawer with padding
                    borderRadius: 8,
                    ontap: () {
                      CostumWidget.showCustomAlertDialog(
                        context: context,
                        title: 'Logout',
                        content: 'Are you sure you want to logout?',
                        confirmButtonText: 'Logout',
                        confirmButtonColor: Colors.red,
                        onConfirm: () {
                          Commonfunction.logout(context);
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      );
      },
       
    );
  }
}

Widget buildDrawerButton({required BuildContext context,required String title,required IconData icon,required String routeName}){
  return ListTile(
    leading: Icon(icon,color: Colors.black),
    title: Text(title),
    onTap: () {
      context.go(routeName);

    },
  );
}