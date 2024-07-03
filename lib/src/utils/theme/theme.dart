import 'package:flutter/material.dart';
import 'package:vhara_hobe_v1/src/utils/theme/text_theme/text_theme.dart';

class AppTheme{

  static ThemeData lightTheme=  ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme:
    ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );
  static ThemeData darkTheme=  ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme:
    ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );

}