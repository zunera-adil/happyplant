import 'package:flutter/material.dart';
import 'package:happyplant/welcomescreen.dart';

void main() {
  runApp(const HappyPlant());
}

class HappyPlant extends StatelessWidget {
  const HappyPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomePageView(),
    );
  }
}
