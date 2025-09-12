

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loginpage/data/repositories/brand_services.dart';
import 'package:loginpage/data/repositories/category_services.dart';
import 'package:loginpage/data/repositories/product_services.dart';
import 'package:loginpage/data/repositories/variants_services.dart';
import 'package:loginpage/fetures/utils/const/routes.dart';
import 'package:loginpage/fetures/utils/theme/theme.dart';
import 'package:loginpage/presentation/bloc/addProducts/bloc/product_bloc.dart';
import 'package:loginpage/presentation/bloc/adminProfile/bloc/admin_profile_bloc.dart';
import 'package:loginpage/presentation/bloc/admin_details_bloc/cubit/admin_login_cubit.dart';
import 'package:loginpage/presentation/bloc/brand/bloc/brand_bloc.dart';
import 'package:loginpage/presentation/bloc/category_bloc/bloc/category_bloc.dart';
import 'package:loginpage/presentation/bloc/dashBoard_bloc/bloc/dashboard_bloc_bloc.dart';
import 'package:loginpage/presentation/bloc/orderSelection_cubit/cubit/order_selection_cubit.dart';
import 'package:loginpage/presentation/bloc/varients_bloc/bloc/varients_bloc.dart';
import 'package:loginpage/presentation/screens/addBrand_screen.dart';
import 'package:loginpage/presentation/screens/addCategory_screen.dart';
import 'package:loginpage/presentation/screens/addProductScreen.dart';
import 'package:loginpage/presentation/screens/adduserScreen.dart';
import 'package:loginpage/presentation/screens/brandScreen.dart';
import 'package:loginpage/presentation/screens/catogeryScreen.dart';
import 'package:loginpage/presentation/screens/dashboard.dart';
import 'package:loginpage/presentation/screens/loginscreen.dart';
import 'package:loginpage/presentation/screens/order_detail_screen.dart';
import 'package:loginpage/presentation/screens/orderlistScreen.dart';
import 'package:loginpage/presentation/screens/productScreen.dart';
import 'package:loginpage/presentation/screens/settingsScreen.dart';
import 'package:loginpage/presentation/screens/usersList.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // usePathUrlStrategy();


 try{
  log( 'Initializing Firebase...');
    await Firebase.initializeApp(

    );
    log('Firebase initialized successfully');
 }catch(e, stack){
    print('Firebase initialization error: $e');
    print('Stack trace: $stack');
  // Create bloc providers only after firebase init attempt (some repos may rely on Firebase)
 }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AdminLoginCubit()),
        BlocProvider(create: (_) => DashboardBlocBloc()),
        BlocProvider(create: (_) => BrandBloc(BrandServices())),
        BlocProvider(create: (_) => AdminProfileBloc()),
        BlocProvider(create: (_) => OrderSelectionCubit()),
        BlocProvider(create: (_) => VariantsBloc(VariantsServices())),
        BlocProvider(create: (_) => CategoryBloc(CategoryServices())),
        BlocProvider(create: (_) => ProductBloc(ProductServices())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
