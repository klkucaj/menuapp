import 'package:flutter/material.dart';
import 'package:menu_app/ui/home/base/base_tab_screen.dart';
import 'package:menu_app/ui/home/navigation/uiitem/navigation_uiitem.dart';

class FirstTabScreen extends BaseTabScreen {
  const FirstTabScreen({super.key});

  @override
  NavigationUiItem buildNavItem() => NavigationUiItem(
        index: 0,
        icon: Icons.star,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FirstTabScreen Title",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
      body: Center(
        child: Text(
          "FirstTabScreen Body",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }
}
