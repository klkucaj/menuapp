import 'package:flutter/material.dart';
import 'package:menu_app/ui/common/button/swipe_up/swipe_up_button.dart';
import 'package:menu_app/ui/fifth_tab/forth_tab_screen.dart';
import 'package:menu_app/ui/first_tab/first_tab_screen.dart';
import 'package:menu_app/ui/forth_tab/third_tab_screen.dart';
import 'package:menu_app/ui/home/base/base_tab_screen.dart';
import 'package:menu_app/ui/home/navigation/bottom_navigation_view.dart';
import 'package:menu_app/ui/second_tab/second_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BaseTabScreen> _screens = [
    const FirstTabScreen(),
    const SecondTabScreen(),
    const ThirdTabScreen(),
    const ForthTabScreen(),
  ];
  int _currentTabIndex = 0;

  void _onTabChange({
    required int index,
  }) {
    if (index < 0 || index >= _screens.length) return;
    if (_currentTabIndex == index) return;
    setState(() => _currentTabIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentTabIndex],
      bottomNavigationBar: BottomNavigationView(
        currentTabIndex: _currentTabIndex,
        onTabClick: _onTabChange,
        items: _screens,
        middleButton: SwipeUpButton(
          options: [
            Text(
              "Option 1",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              "Option 2",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              "Option 3",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              "Option 4",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),const SizedBox(height: 20),
            Text(
              "Option 4",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
