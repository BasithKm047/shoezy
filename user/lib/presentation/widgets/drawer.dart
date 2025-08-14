import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoezy/application/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:shoezy/presentation/screens/cart_screen.dart';
import 'package:shoezy/presentation/screens/favourote_screen.dart';
import 'package:shoezy/presentation/screens/notification_screen.dart';
import 'package:shoezy/presentation/screens/orders_screen.dart';
import 'package:shoezy/presentation/screens/profile_screen.dart';
import 'package:shoezy/presentation/screens/settings_screen.dart';
import 'package:shoezy/presentation/screens/signin_screen.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';
import 'package:shoezy/utils/const/colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),

          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'User Name',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
            ),
          ),
          SizedBox(height: 20),
          buttons(
            context: context,
            ontap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            icon: Icons.account_circle_outlined,
            title: 'Profile',
          ),
          SizedBox(height: 20),

          buttons(
            context: context,
            ontap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            icon: Icons.settings,
            title: 'Settings',
          ),
          SizedBox(height: 20),
          buttons(
            ontap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
            context: context,
            icon: Icons.shopping_cart_outlined,
            title: 'Cart',
          ),
          SizedBox(height: 20),
          buttons(
            ontap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FavouroteScreen()),
              );
            },
            icon: Icons.favorite_border,
            title: 'Favourite',
            context: context,
          ),
          SizedBox(height: 20),
          buttons(
            ontap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => OrdersScreen()));
            },
            icon: Icons.local_shipping_sharp,
            title: 'Orders',
            context: context,
          ),
          SizedBox(height: 20),
          buttons(
            ontap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
            icon: Icons.notifications_none_outlined,
            title: 'Notifications',
            context: context,
          ),
          // SizedBox(height: 60),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: 200,
              child: Divider(thickness: 2, color: Colors.grey),
            ),
          ),

          Spacer(),

          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLogOUt) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SigninScreen()),
                  ((Route route) => false),
                );
              }

              if (state is AuthFailure) {
                CostumWidget.showCustomSnackbar(
                  context: context,
                  message: state.message,
                  backgroundColor: AppColors.red,
                );
              }
            },

            child: buttons(
              ontap: () {
                context.read<AuthBloc>().add(LogoutEvent());
              },
              icon: Icons.logout,
              size: 25,
              title: 'Logout',
              context: context,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

Widget buttons({
  required IconData icon,
  required String title,
  VoidCallback? ontap,
  required BuildContext context,
  double? size,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.white, size: size ?? 20),
          SizedBox(width: 25.0),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
