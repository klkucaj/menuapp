import 'package:flutter/material.dart';
import 'package:menu_app/style/colors/dark_colors.dart' as dark;
import 'package:menu_app/style/colors/light_colors.dart' as light;

AppBarTheme lightAppBarTheme = const AppBarTheme(
  elevation: 0,
  backgroundColor: light.backgroundColor,
  foregroundColor: light.primaryColor,
);

AppBarTheme darkAppBarTheme = const AppBarTheme(
  elevation: 0,
  backgroundColor: dark.backgroundColor,
  foregroundColor: light.primaryColor,
);
