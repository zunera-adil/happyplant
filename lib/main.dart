import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happyplant/welcomescreen.dart';

void main() {
  runApp(const HappyPlant());
}

class HappyPlant extends StatelessWidget {
  const HappyPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(390, 844),
      child: MaterialApp(
        home: WelcomePageView(),
      ),
    );
  }
}
