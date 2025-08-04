import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoezy/application/bloc/auth_cubit/cubit/auth_cubit_cubit.dart';
import 'package:shoezy/data/auth/auth_services.dart';
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubitCubit(authServices: AuthServices())..checkUser() ),
      //   BlocProvider(create: (context) => SubjectBloc()),
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
