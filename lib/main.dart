// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  int counter = 0;

  static const List<String> labels = ['Home', 'Search', 'Settings', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter View'),
            centerTitle: true,
            // leading: Icon(Icons.menu),
            // actions: [Text('Login'), Icon(Icons.login)],
            backgroundColor: Colors.teal,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                // DrawerHeader(child: Text('Drawer Header')),
                ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                ),
                ListTile(title: Text('Logout'), leading: Icon(Icons.logout)),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Counter: $counter',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Selected: ${labels[selectedIndex]} (index: $selectedIndex)',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    counter += 1;
                  });
                },
                child: const Icon(Icons.add),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    counter -= 1;
                  });
                },
                child: const Icon(Icons.remove),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                },
                child: const Icon(Icons.refresh),
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: selectedIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
            onDestinationSelected: (int value) {
              setState(() {
                selectedIndex = value;
              });
              // debug print kept for quick verification
              print(value);
            },
          ),
        ),
      ),
    );
  }
}
