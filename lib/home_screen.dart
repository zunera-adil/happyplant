import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happyplant/color.dart';
import 'package:happyplant/components/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _moistureLevel = 0.0;

  void _refreshMoistureLevel() {
    setState(() {
      // Simulate getting the moisture level
      _moistureLevel =
          (50 + (50 * (DateTime.now().millisecondsSinceEpoch % 10) / 10));
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshMoistureLevel();
  }

  @override
  Widget build(BuildContext context) {
    bool isHappy = _moistureLevel > 50.0;
    String imagePath =
        isHappy ? 'asset/images/happyplant.png' : 'asset/images/sadplant.jpg';

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.w),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/images/homescreenbg.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: 20.h),
            Text(
              'Is My Plant Happy?',
              style: TextStyle(
                fontSize: 30.sp,
                color: kShadowBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'Current Moisture Level:',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: darkGreen),
            ),
            SizedBox(height: 5.h),
            Text(
              '${_moistureLevel.toStringAsFixed(2)}%',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: darkGreen), // Adjust font size dynamically
            ),
            //SizedBox(height: 15.h),
            // Container(
            //   width: 200.w,
            //   height: 100.h,
            //   color: Colors.red, // Set container color
            // ),
            // SizedBox(height: 15.h),

            Image.asset(imagePath,
                height: 160.h, width: 70.w // Adjust image size dynamically
                ),
            SizedBox(height: 20.h),
            CustomPrimaryButton(
              onTap: _refreshMoistureLevel,
              text: 'Refresh',
              height: 40.h,
              width: 70.w,
            )
          ],
        ),
      ),
    );
  }
}
