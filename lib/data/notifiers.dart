// ValueNotifier: hold the data and notify listeners when data changes.
// ValueListenableBuilder: listen to ValueNotifier and rebuild widget
// without needing setState.
import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.dark);

void toggleThemeMode() {
  themeModeNotifier.value =
      themeModeNotifier.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
}
