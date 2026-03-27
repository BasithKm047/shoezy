import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();
  // Costum Light Elevated Button
  static final lightElevatedButtonTheme=ElevatedButtonThemeData(
    style:  ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50.0))
      ),
    )
  );

  // Costum Dark Elevated Button
  static final darkElevatedButtonTheme=ElevatedButtonThemeData(
        style:  ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      side: BorderSide(),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(),
      shape: RoundedRectangleBorder(),
    )
  );

}