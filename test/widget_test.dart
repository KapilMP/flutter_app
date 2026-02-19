// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/main.dart';

void main() {
  testWidgets('Updates app bar title when bottom nav item is tapped', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyHomePage());

    expect(
      find.descendant(of: find.byType(AppBar), matching: find.text('Home')),
      findsOneWidget,
    );
    expect(find.text('This is the Home Page'), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    await tester.tap(find.byIcon(Icons.code));
    await tester.pump();

    expect(
      find.descendant(of: find.byType(AppBar), matching: find.text('Code')),
      findsOneWidget,
    );
    expect(find.text('This is the Code Page'), findsOneWidget);
  });
}
