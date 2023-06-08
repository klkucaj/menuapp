import 'package:flutter/material.dart';
import 'package:menu_app/ui/home/base/base_tab_screen.dart';
import 'package:menu_app/ui/home/navigation/uiitem/navigation_uiitem.dart';

class ForthTabScreen extends BaseTabScreen {
  const ForthTabScreen({super.key});

  @override
  NavigationUiItem buildNavItem() => NavigationUiItem(
        index: 3,
        icon: Icons.account_circle,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ForthTabScreen Title",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
      body: Center(
        child: Text(
          "ForthTabScreen Body",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }
}
