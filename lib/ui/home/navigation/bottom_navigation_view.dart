import 'package:flutter/material.dart';
import 'package:menu_app/ui/home/base/base_tab_screen.dart';
import 'package:menu_app/ui/home/navigation/uiitem/navigation_uiitem.dart';
import 'package:menu_app/ui/home/navigation/view/navigation_item_view.dart';

class BottomNavigationView extends StatelessWidget {
  final int currentTabIndex;
  final void Function({
    required int index,
  }) onTabClick;
  final List<BaseTabScreen> items;
  final Widget? middleButton;

  const BottomNavigationView({
    super.key,
    required this.currentTabIndex,
    required this.onTabClick,
    required this.items,
    this.middleButton,
  });

  int get _getMiddle {
    if (items.length.isEven) return items.length ~/ 2;
    return ((items.length / 2) + .5).toInt();
  }

  List<BaseTabScreen> get _firstHalf => items.sublist(0, _getMiddle);

  List<BaseTabScreen> get _secondHalf =>
      items.sublist(_getMiddle, items.length);

  Widget _itemView({
    required NavigationUiItem item,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabClick(index: item.index),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: NavigationItemView(
            index: item.index,
            icon: item.icon,
            isActive: currentTabIndex == item.index,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            ..._firstHalf.map((e) => _itemView(item: e.buildNavItem())),
            if (middleButton != null) Expanded(child: middleButton!),
            ..._secondHalf.map((e) => _itemView(item: e.buildNavItem())),
          ],
        ),
      ),
    );
  }
}
