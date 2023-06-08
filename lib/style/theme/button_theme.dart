import 'package:flutter/material.dart';
import 'package:menu_app/style/colors/dark_colors.dart' as dark;
import 'package:menu_app/style/colors/light_colors.dart' as light;

ButtonThemeData lightButtonThemeData = const ButtonThemeData(
  buttonColor: light.buttonColor,
  colorScheme: ColorScheme.light(
    primary: light.buttonColor,
    background: light.buttonColor,
  ),
);

ElevatedButtonThemeData lightEButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: light.backgroundColor,
    backgroundColor: light.buttonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);

FloatingActionButtonThemeData lightFButtonThemeData =
    const FloatingActionButtonThemeData(
  foregroundColor: light.backgroundColor,
  backgroundColor: light.buttonColor,
);

FloatingActionButtonThemeData darkFButtonThemeData =
    const FloatingActionButtonThemeData(
  backgroundColor: dark.buttonColor,
  foregroundColor: dark.backgroundColor,
);

ButtonThemeData darkButtonThemeData = const ButtonThemeData(
  buttonColor: dark.buttonColor,
  colorScheme: ColorScheme.dark(
    primary: dark.buttonColor,
    background: light.buttonColor,
  ),
);

ElevatedButtonThemeData darkEButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: dark.backgroundColor,
    backgroundColor: dark.buttonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);
