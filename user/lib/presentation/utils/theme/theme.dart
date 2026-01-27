import 'package:flutter/material.dart';
import 'package:shoezy/utils/theme/appbar_theme.dart';
import 'package:shoezy/utils/theme/bottomSheet_theme.dart';
import 'package:shoezy/utils/theme/elevatedbutton_theme.dart';
import 'package:shoezy/utils/theme/text_theme.dart';

class Apptheme {
  Apptheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TTextTheme.lightTextTheme,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor:Colors.white,
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

