import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/code_page.dart';
import 'package:flutter_app/views/pages/home_page.dart';
import 'package:flutter_app/views/pages/widget_page.dart';
import 'package:flutter_app/widgets/navbar_widget.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  static const List<NavItem> _navItems = [
    NavItem(icon: Icons.home, label: "Home"),
    NavItem(icon: Icons.code, label: "Code"),
    NavItem(icon: Icons.widgets, label: "Widget"),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentText = _navItems[_selectedIndex].label;
    final pages = const [
      HomePage(),
      CodePage(),
      WidgetPage(),
    ];

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(currentText)),
      body: pages[_selectedIndex],
      bottomNavigationBar: NavbarWidget(
        items: _navItems,
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
