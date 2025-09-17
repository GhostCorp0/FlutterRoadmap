import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterRoadmapApp());
}

class FlutterRoadmapApp extends StatelessWidget {
  const FlutterRoadmapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Roadmap',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Roadmap')),
      body: const Center(
        child: Text('Hello, Flutter!'),
      ),
    );
  }
}