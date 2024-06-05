import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happyplant/add_plant_screen.dart';
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
        padding: EdgeInsets.all(5.w),
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
                fontSize: 18.sp,
                color: kShadowBlackColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              width: double.infinity,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: darkGreen.withOpacity(0.5),
                border: Border.all(
                  color: kShadowBlackColor.withOpacity(0.1),
                  width: 1.w,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Current Moisture Level:',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: kShadowBlackColor),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '${_moistureLevel.toStringAsFixed(2)}%',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: kShadowBlackColor), // Adjust font size dynamically
                  ),
                ],
              ),
            ),

            SizedBox(height: 15.h),
            // Container(
            //   width: 200.w,
            //   height: 100.h,
            //   color: Colors.red, // Set container color
            // ),
            // SizedBox(height: 15.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Plant name: \n rose',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: kShadowBlackColor.withOpacity(0.8)),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  width: 90.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: kShadowBlackColor.withOpacity(0.5),
                      width: 1.w,
                    ),
                  ),
                  child:  Image.asset(imagePath,
                         // height: 160.h, width: 70.w
                       fit: BoxFit.fill,
                          ),
                  ),
              ],
            ),
            SizedBox(height: 10.h),
            CustomPrimaryButton(
              onTap: _refreshMoistureLevel,
              text: 'Refresh',
              height: 40.h,
              width: 70.w,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.end ,
              children: [
                FloatingActionButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPlantScreen()));
                },
                child:  Icon(Icons.add,),
                  backgroundColor: darkGreen.withOpacity(0.5),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
