import 'package:flutter/material.dart';

class NavigationItemView extends StatelessWidget {
  final int index;
  final IconData icon;
  final bool isActive;

  const NavigationItemView({
    super.key,
    required this.index,
    required this.icon,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: isActive ? 32 : 26,
      ),
    );
  }
}
