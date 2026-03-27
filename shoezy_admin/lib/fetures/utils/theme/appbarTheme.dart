import 'package:flutter/material.dart';

class TAppbartheme {
 TAppbartheme._();
  
  static AppBarTheme lightAppbarTheme ({required bool isTitleCenter}){
  return  AppBarTheme(
    elevation: 0,
    centerTitle: isTitleCenter,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(),
    actionsIconTheme: IconThemeData(),
    titleTextStyle: TextStyle(),
  

  );
  }
 

  static final darkAppbarTheme=AppBarTheme(
    elevation: 0,
     centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(),
    actionsIconTheme: IconThemeData(),
    titleTextStyle: TextStyle(),

    
  );

}