import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme=GoogleFonts.latoTextTheme(
 ThemeData.light().textTheme,
  
  );
  static TextTheme darkTextTheme=GoogleFonts.interTextTheme(
    ThemeData.dark().textTheme,
  );
}