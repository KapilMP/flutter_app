import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showFlutter = false;

  void _hideFlutter() {
    setState(() {
      _showFlutter = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.notification_add, color: Colors.red),
          onPressed: () {
            print('flutter');
            setState(() {
              _showFlutter = true;
            });
          },
        ),
      ),
      body: Stack(
        children: [
          // Background image covering entire screen
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback if image doesn't load
                return Container(color: Colors.black);
              },
            ),
          ),
          // Red ListTile at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.red,
              child: ListTile(
                leading: Icon(Icons.join_full),
                title: Text('Data'),
                trailing: Text('ERP'),
                onTap: () {
                  print('flutter');
                  setState(() {
                    _showFlutter = true;
                  });
                },
              ),
            ),
          ),
          // "Flutter" text in center when shown
          if (_showFlutter)
            Center(
              child: Text(
                'Flutter',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _hideFlutter,
        tooltip: 'Press to make the text disappear',
        child: const Icon(
          Icons.remove,
        ), // Changed from Icons.add to Icons.remove
      ),
    );
  }
}
