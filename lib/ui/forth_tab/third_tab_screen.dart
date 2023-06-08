import 'package:flutter/material.dart';
import 'package:menu_app/ui/home/base/base_tab_screen.dart';
import 'package:menu_app/ui/home/navigation/uiitem/navigation_uiitem.dart';

class SecondTabScreen extends BaseTabScreen {
  const SecondTabScreen({super.key});

  @override
  NavigationUiItem buildNavItem() => NavigationUiItem(
        index: 2,
        icon: Icons.message,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SecondTabScreen Title",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
      body: Center(
        child: Text(
          "SecondTabScreen Body",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }
}
