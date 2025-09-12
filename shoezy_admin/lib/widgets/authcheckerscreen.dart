import 'package:flutter/material.dart';
import 'package:loginpage/presentation/screens/dashboard.dart';
import 'package:loginpage/presentation/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authcheckerscreen extends StatelessWidget {
  const Authcheckerscreen({super.key});
  Future<bool> isAdminLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
   bool isLoggedIn=prefs.getBool('isLoggedIn')?? false;
    print('Login status: $isLoggedIn');
    return isLoggedIn;
   
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isAdminLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          final isLoggedin = snapshot.data ?? false;
          return isLoggedin ? DashboardScreen() : Loginscreen();
        }
      },
    );
  }
}
