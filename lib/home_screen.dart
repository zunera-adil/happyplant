// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
        decoration: BoxDecoration(
          gradient: kBackgroundGradient,
        ),
        child: Column(children: [
          Text(
            "Plant Moisture Status",
            style: TextStyle(),
          ),
        ]),
      ),
    );
  }
}
