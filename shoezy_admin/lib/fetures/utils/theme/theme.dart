import 'package:flutter/material.dart';

import 'package:shoezy_admin/fetures/utils/theme/appbarTheme.dart';
import 'package:shoezy_admin/fetures/utils/theme/bottomsheetTheme.dart';
import 'package:shoezy_admin/fetures/utils/theme/elevated_button_theme.dart';
import 'package:shoezy_admin/fetures/utils/theme/text_theme.dart';
// import 'package:google_fonts/google_fonts.dart';

class Apptheme {
  Apptheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TTextTheme.lightTextTheme,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppbartheme.lightAppbarTheme(isTitleCenter: true),
    bottomSheetTheme: TBottomSheetThemeData.lightBottomsheetThemeData,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: TTextTheme.darkTextTheme,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppbartheme.darkAppbarTheme,
    bottomSheetTheme: TBottomSheetThemeData.darkBottomSheetThemeData,
  );
}
