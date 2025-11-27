import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoezy/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shoezy/presentation/bloc/brand_bloc/brand_bloc.dart';
import 'package:shoezy/presentation/bloc/category/bloc/category_bloc.dart';
import 'package:shoezy/presentation/bloc/favourite/cubit/favourie_cubit.dart';
import 'package:shoezy/presentation/bloc/navigation_bar/cubit/bottom_navigation_bar_cubit.dart';
import 'package:shoezy/presentation/bloc/productFilter/cubit/product_filter_cubit.dart';
import 'package:shoezy/presentation/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/data/auth/auth_services.dart';
import 'package:shoezy/data/repositories/category_repository.dart';
import 'package:shoezy/data/repositories/favourite_repository.dart';
import 'package:shoezy/data/repositories/product_repository.dart';
import 'package:shoezy/presentation/bloc/product_sort/cubit/product_sort_cubit.dart';
import 'package:shoezy/presentation/screens/splash_screen.dart';
import 'package:shoezy/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shoezy/bloc/subject_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final favoritesRepository = FavoritesRepository(userId: 'currentUserId');

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationBarCubit()),
        BlocProvider(
          create: (context) => AuthBloc(authServices: AuthServices()),
        ),
        BlocProvider(
          create: (context) => BrandBloc()
            ..add(LoadBrandEvent())
            ..add(LoadBrandEvent()),
        ),

        BlocProvider(create: (context) => ProductBloc(ProductRepository())),
        BlocProvider(
          create: (context) => FavoritesCubit(repository: favoritesRepository),
        ),
        BlocProvider(create: (context) => CategoryBloc(CategoryRepository())),
        BlocProvider(create: (context) => ProductFilterCubit()),
        BlocProvider<ProductSortCubit>(create: (_) => ProductSortCubit()),
      ],
      child: MaterialApp(
        theme: Apptheme.lightTheme,
        darkTheme: Apptheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
