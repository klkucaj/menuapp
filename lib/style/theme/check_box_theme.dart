import 'package:flutter/material.dart';
import 'package:menu_app/style/colors/dark_colors.dart' as dark;
import 'package:menu_app/style/colors/light_colors.dart' as light;

CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
  fillColor: MaterialStateProperty.all(
    light.primaryColor,
  ),
);

CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
  fillColor: MaterialStateProperty.all(
    dark.primaryColor,
  ),
);
