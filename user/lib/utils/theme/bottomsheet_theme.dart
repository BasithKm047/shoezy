
import 'package:flutter/material.dart';

class TBottomSheetThemeData{
  TBottomSheetThemeData._();

  static final lightBottomsheetThemeData=BottomSheetThemeData(
   showDragHandle: true,
   backgroundColor: Colors.white,
   modalBackgroundColor: Colors.white,
   constraints: BoxConstraints(minWidth: double.infinity),
   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

  );

  static final darkBottomSheetThemeData=BottomSheetThemeData(
      showDragHandle: true,
   backgroundColor: Colors.black,
   modalBackgroundColor: Colors.black,
   constraints: BoxConstraints(minWidth: double.infinity),
   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
   
  );

}