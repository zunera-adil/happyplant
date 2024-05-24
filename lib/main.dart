import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const HappyPlant());
}

class HappyPlant extends StatelessWidget {
  const HappyPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Moisture Detector',
      home: const HomeScreen(),
    );
  }
}
