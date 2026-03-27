import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoezy/data/datasources/location_local_data_source.dart';
import 'package:shoezy/data/repositories/cart_repository.dart';
import 'package:shoezy/data/repositories/favourite_repository.dart';
import 'package:shoezy/data/repositories/location_repository_impl.dart';
import 'package:shoezy/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shoezy/presentation/bloc/brand_bloc/brand_bloc.dart';
import 'package:shoezy/presentation/bloc/category/category_bloc.dart';
import 'package:shoezy/data/auth/auth_services.dart';
import 'package:shoezy/data/repositories/category_repository.dart';
import 'package:shoezy/data/repositories/product_repository.dart';
import 'package:shoezy/presentation/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:shoezy/presentation/cubit/favourite/favourie_cubit.dart';
import 'package:shoezy/presentation/cubit/location/Location_cubit.dart';
import 'package:shoezy/presentation/cubit/navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:shoezy/presentation/cubit/payment_screen_cubit/payment_screen_cubit.dart';
import 'package:shoezy/presentation/cubit/productFilter/cubit/product_filter_cubit.dart';
import 'package:shoezy/presentation/cubit/product_cart/cubit/product_cart_cubit.dart';
import 'package:shoezy/presentation/cubit/product_sort/product_sort_cubit.dart';
import 'package:shoezy/presentation/screens/splash_screen.dart';
// import 'package:shoezy/utils/const/new.dart';
import 'package:shoezy/core/utils/theme/theme.dart';
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

  await Hive.initFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          create: (context) => FavoritesCubit(FavouriteRepository()),
        ),
        BlocProvider(create: (context) => CategoryBloc(CategoryRepository())),
        BlocProvider(create: (context) => ProductFilterCubit()),
        BlocProvider<ProductSortCubit>(create: (_) => ProductSortCubit()),
        BlocProvider(
          create: (context) =>
              ProductCartCubit(repository: CartRepository()),
        ),
        BlocProvider(create: (context) => PaymentScreenCubit(AuthServices())),
        BlocProvider(create: (context) => LocationCubit(repository: LocationRepositoryImpl(localDataSource: LocationLocalDataSourceImpl()))),
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
