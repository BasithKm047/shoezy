import 'package:flutter/material.dart';

class AppColors {
  static const Color blue = Colors.blue;
  static  const Color scaffoldBackroundColor = Color(0xFFF6F2F2);
  static const Color splashScreenBackroundColor = Color(0xFF656FF2);
  static const Color white = Colors.white;
  static const Color lightGrey = Color.fromARGB(255, 240, 240, 240);
  static const Color grey = Colors.grey;
  static const Color black = Colors.black;
  static const Color drawerColor =  Color.fromARGB(173, 56, 56, 57);
  static const Color green = Colors.green;
  static const Color yellow = Colors.yellow;
  static const Color pink = Colors.pink;
  static const Color purple = Colors.purple;
  static const Color dotColor = Colors.white70;

  static const Color red = Colors.red;
  static const Color orange = Colors.orange;
  static  Color filterNavdividerColor=  Colors.grey.shade400;
  static const Color moreDarker= Color.fromARGB(172, 42, 42, 43);
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
