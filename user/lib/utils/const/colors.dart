import 'package:flutter/material.dart';

class AppColors {
  static Color blue = Colors.blue;
  static Color scaffoldBackroundColor = Color(0xFFF6F2F2);
  static Color splashScreenBackroundColor = Color(0xFF656FF2);
  static Color white = Colors.white;
  static Color grey = Colors.grey;
  static Color black = Colors.black;
  static Color drawerColor = const Color.fromARGB(173, 56, 56, 57);
  static Color green = Colors.green;
  static Color yellow = Colors.yellow;
  static Color pink = Colors.pink;
  static Color purple = Colors.purple;
  static Color dotColor = Colors.white70;

  static Color red = Colors.red;
  static Color orange = Colors.orange;
  static Color filterNavdividerColor=Colors.grey.shade400;
}

Color getColorFromName(String colorName) {
  switch (colorName.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;

    case 'cyan':
      return Colors.cyan;
    case 'teal':
      return Colors.teal;
    case 'indigo':
      return Colors.indigo;
    case 'brown':
      return Colors.brown;
    case 'yellow':
      return Colors.yellow;
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    case 'orange':
      return Colors.orange;
    case 'purple':
      return Colors.purple;
    case 'pink':
      return Colors.pink;

    case 'grey':
      return Colors.grey;

    default:
      return Colors.transparent;
  }


}
