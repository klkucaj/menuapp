import 'package:flutter/material.dart';
import 'package:menu_app/style/colors/dark_colors.dart' as dark;
import 'package:menu_app/style/colors/light_colors.dart' as light;
import 'package:menu_app/style/theme/app_bar_theme.dart';
import 'package:menu_app/style/theme/button_theme.dart';
import 'package:menu_app/style/theme/check_box_theme.dart';
import 'package:menu_app/style/theme/icon_theme.dart';
import 'package:menu_app/style/theme/text_theme.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: light.swatchColor,
  primaryColor: light.primaryColor,
  colorScheme: const ColorScheme.light(
    primary: light.primaryColor,
    secondary: light.secondaryColor,
    outline: light.borderColor,
    tertiary: light.tertiaryColor,
//ignore: avoid_redundant_argument_values
    background: light.backgroundColor,
// ignore: avoid_redundant_argument_values
    surface: light.surfaceColor,
  ),
  appBarTheme: lightAppBarTheme,
  textTheme: lightTextTheme,
  buttonTheme: lightButtonThemeData,
  elevatedButtonTheme: lightEButtonThemeData,
  checkboxTheme: lightCheckboxTheme,
  floatingActionButtonTheme: lightFButtonThemeData,
  iconTheme: lightIconTheme,
  scaffoldBackgroundColor: light.backgroundColor,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: dark.swatchColor,
  primaryColor: dark.primaryColor,
  colorScheme: const ColorScheme.dark(
    primary: dark.primaryColor,
    secondary: dark.secondaryColor,
    background: dark.backgroundColor,
    surface: dark.surfaceColor,
  ),
  appBarTheme: darkAppBarTheme,
  textTheme: darkTextTheme,
  buttonTheme: darkButtonThemeData,
  elevatedButtonTheme: darkEButtonThemeData,
  checkboxTheme: darkCheckboxTheme,
  floatingActionButtonTheme: darkFButtonThemeData,
  iconTheme: darkIconTheme,
  scaffoldBackgroundColor: dark.backgroundColor,
);
