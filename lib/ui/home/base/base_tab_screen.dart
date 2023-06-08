import 'package:flutter/material.dart';
import 'package:menu_app/ui/home/navigation/uiitem/navigation_uiitem.dart';

abstract class BaseTabScreen extends StatelessWidget {
  const BaseTabScreen({
    super.key,
  });

  NavigationUiItem buildNavItem();
}
