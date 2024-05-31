// import 'package:flutter/material.dart';
// import 'color.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         //padding: EdgeInsets.symmetric(horizontal: 18.0.w),
//         decoration: BoxDecoration(
//           gradient: kBackgroundGradient,
//         ),
//         child:const Column(
//           children: [
//             Center(
//               child: Text(
//                 "Plant Moisture Status",
//                 style: TextStyle(
//                  // fontSize: 10.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
    // bool isHappy = _moistureLevel > 50.0;
    // String imagePath = isHappy ? 'assets/happy_plant.png' : 'assets/sad_plant.png';

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
            SizedBox(height: 20.h),
            Text(
              'Is My Plant Happy?',
              style: TextStyle(
                fontSize: 40.sp,
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
                  color: lightGreen), // Adjust font size dynamically
            ),
            SizedBox(height: 15.h), // Adjust spacing dynamically
            Text(
              '${_moistureLevel.toStringAsFixed(2)}%',
              style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: darkGreen), // Adjust font size dynamically
            ),
            SizedBox(height: 15.h),
            Container(
              width: 200.w,
              height: 100.h,
              color: Colors.red, // Set container color
            ),
            SizedBox(height: 15.h),

            // Image.asset(
            //   imagePath,
            //   height: blockSizeVertical * 30, // Adjust image size dynamically
            // ),
            // SizedBox(height: blockSizeVertical * 4),

            CustomPrimaryButton(
              onTap: _refreshMoistureLevel,
              text: 'Refresh',
              height: 10.h,
              width: 30.w,
            )
          ],
        ),
      ),
    );
  }
}
