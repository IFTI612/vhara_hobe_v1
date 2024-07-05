import 'package:flutter/material.dart';
import 'package:vhara_hobe_v1/src/utils/theme/appbar_theme.dart';
import 'package:vhara_hobe_v1/src/utils/theme/bottom_sheet_theme.dart';
import 'package:vhara_hobe_v1/src/utils/theme/text_theme/text_theme.dart';
import 'elevated_button_theme.dart';

class AppTheme{

  AppTheme._();
  static ThemeData lightTheme=  ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor:Colors.white ,
    elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppbarTheme.lightAppbarTheme,
    bottomSheetTheme: BottomSheetTheme.lightBottomSheetTheme,
  );
  static ThemeData darkTheme=  ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor:Colors.black ,
    elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: AppbarTheme.darkAppbarTheme,
    bottomSheetTheme: BottomSheetTheme.darkBottomSheetTheme,
  );

}