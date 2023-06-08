import 'package:flutter/material.dart';
import 'package:menu_app/style/theme/app_theme.dart';
import 'package:menu_app/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      theme: theme,
      darkTheme: darkTheme,
      home: const HomeScreen(),
    );
  }
}
