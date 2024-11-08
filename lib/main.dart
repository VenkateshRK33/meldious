import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'resources_screen.dart';

void main() {
  runApp(DisasterResponseApp());
}

class DisasterResponseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disaster Response System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/resources': (context) => ResourcesScreen(),
      },
    );
  }
}
