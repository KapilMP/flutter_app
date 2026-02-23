import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/code_page.dart';
import 'package:flutter_app/views/pages/home_page.dart';
import 'package:flutter_app/views/pages/profile_page.dart';
import 'package:flutter_app/views/widgets/navbar_widget.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  static const List<NavItem> _navItems = [
    NavItem(icon: Icons.home, label: 'Home'),
    NavItem(icon: Icons.code, label: 'Code'),
    NavItem(icon: Icons.person, label: 'Profile'),
  ];

  static const List<Widget> _pages = [HomePage(), CodePage(), WidgetPage()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedIndex, child) {
        final currentTitle = _navItems[selectedIndex].label;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(currentTitle),
            actions: [
              ValueListenableBuilder<ThemeMode>(
                valueListenable: themeModeNotifier,
                builder: (context, themeMode, child) {
                  final isDarkMode = themeMode == ThemeMode.dark;

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
                      Switch(
                        value: isDarkMode,
                        onChanged: (_) => toggleThemeMode(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          body: _pages[selectedIndex],
          bottomNavigationBar: NavbarWidget(
            items: _navItems,
            selectedIndex: selectedIndex,
            onItemSelected: (index) {
              selectedPageNotifier.value = index;
            },
          ),
        );
      },
    );
  }
}
