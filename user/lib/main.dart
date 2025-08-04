import 'package:flutter/material.dart';
import 'package:shoezy/presentation/screens/splash_screen.dart';
import 'package:shoezy/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: Apptheme.lightTheme,
      darkTheme: Apptheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
     home: SplashScreen(),
    );
  }
}