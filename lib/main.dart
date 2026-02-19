import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/widget_tree.dart';

// stateful widget can be refreshed and updated, stateless widget
// cannot be updated once built

//? stateless widget can not be refreshed or updated,
//? it is immutable and can only be built once.
//? It does not have any internal state that can change over time.
//? Once a stateless widget is built, it cannot be modified or updated.
//? If you want to update the UI based on user interactions or changes in data,
//? you would need to use a stateful widget instead.

//! setState is a method used in stateful widgets to trigger
//! a rebuild of the widget tree.
//! When you call setState, it tells Flutter that the state of the widget has
//! changed and that it needs to rebuild the UI to reflect those changes.
//! The setState method takes a callback function as an argument,
//! and any changes to the state should be made within that callback.

// Materail App (Stateful)
// Scaffold
// App Title
// Bottom navigation bar setState

void main() {
  runApp(
    DevicePreview(enabled: !kIsWeb, builder: (context) => const MyHomePage()),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: WidgetTree(),
    );
  }
}
