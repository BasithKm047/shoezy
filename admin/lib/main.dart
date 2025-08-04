import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoezy_admin/fetures/utils/const/routes.dart';
import 'package:shoezy_admin/fetures/utils/theme/theme.dart';
import 'package:shoezy_admin/presentation/bloc/adminProfile/bloc/admin_profile_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/admin_details_bloc/cubit/admin_login_cubit.dart';
import 'package:shoezy_admin/presentation/bloc/addProducts/add_product_bloc_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/brand/bloc/brand_bloc_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/dashBoard_bloc/bloc/dashboard_bloc_bloc.dart';
import 'package:shoezy_admin/presentation/bloc/orderSelection_cubit/cubit/order_selection_cubit.dart';
// import 'package:shoezy_admin/presentation/bloc/dashBoard_bloc/bloc/dashboard_bloc.dart';
import 'package:shoezy_admin/presentation/screens/addBrand_screen.dart';
import 'package:shoezy_admin/presentation/screens/addCategory_screen.dart';
import 'package:shoezy_admin/presentation/screens/addProductScreen.dart';
import 'package:shoezy_admin/presentation/screens/adduserScreen.dart';
import 'package:shoezy_admin/presentation/screens/brandScreen.dart';
import 'package:shoezy_admin/presentation/screens/catogeryScreen.dart';
import 'package:shoezy_admin/presentation/screens/dashboard.dart';
import 'package:shoezy_admin/presentation/screens/loginscreen.dart';
import 'package:shoezy_admin/presentation/screens/order_detail_screen.dart';
import 'package:shoezy_admin/presentation/screens/orderlistScreen.dart';
import 'package:shoezy_admin/presentation/screens/productScreen.dart';
import 'package:shoezy_admin/presentation/screens/settingsScreen.dart';
import 'package:shoezy_admin/presentation/screens/usersList.dart';
import 'firebase_options.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AdminLoginCubit()),
        BlocProvider(create: (context) => DashboardBlocBloc()),
        BlocProvider(create: (context) => AddProductBlocBloc()),
        BlocProvider(create: (context) => BrandBlocBloc()),
        BlocProvider(create: (context)=>AdminProfileBloc()),
        BlocProvider(create: (context) => OrderSelectionCubit(),),
      ],
      child: MyApp(),
    ),
  );
}

final GoRouter router = GoRouter(
  initialLocation: Routes.login,

  routes: [
    GoRoute(path: Routes.login, builder: (context, state) => Loginscreen()),
    GoRoute(
      path: Routes.dashboard,
      builder: (context, state) => DashboardScreen(),
    ),
    GoRoute(path: Routes.users, builder: (context, state) => Userslist()),
    GoRoute(path: Routes.brand, builder: (context, state) => Brandscreen()),
    GoRoute(
      path: Routes.category,
      builder: (context, state) => Catogeryscreen(),
    ),
    GoRoute(
      path: Routes.orderList,
      builder: (context, state) => OrderlistScreen(),
    ),
    GoRoute(
      path: Routes.setting,
      builder: (context, state) => Settingsscreen(),
    ),
    GoRoute(
      path: Routes.addUserScreen,
      builder: (context, state) => Adduserscreen(),
    ),
    GoRoute(
      path: Routes.products,
      builder: (context, state) => Productscreen(),
    ),
    GoRoute(
      path: Routes.addproductscreen,
      builder: (context, state) => Addproductscreen(),
    ),
    GoRoute(
      path: Routes.orderDetailScreen,
      builder: (context, state) => OrderDetailScreen(),
    ),
    GoRoute(
      path: Routes.addCategoryScreen,
      builder: (context, state) => AddcategoryScreen(),
    ),
    GoRoute(
      path: Routes.addBrandScreen,
      builder: (context, state) => AddbrandScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shoezy',
      themeMode: ThemeMode.system,
      theme: Apptheme.lightTheme,
      darkTheme: Apptheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
