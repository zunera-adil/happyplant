import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happyplant/view/add_plant_screen.dart';
import 'package:happyplant/utils/color.dart';
import 'package:happyplant/components/button.dart';

import '../components/custom_cointainer.dart';

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
        isHappy ? 'asset/images/happy_plant.jpeg' : 'asset/images/sad_plant.jpeg';

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5.w),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/images/home_screenbg.jpg'),
                fit: BoxFit.cover)
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: 20.h),
            custom_container(height: 70.h, width: double.infinity,
                text: Text(
              'Is My Plant Happy?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w800,
              ),
            ),),
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
                ),boxShadow: [
                BoxShadow(
                  color: kShadowBlackColor.withOpacity(0.5), // Shadow color with opacity
                  blurRadius: 1.0, // Blur radius of the shadow
                  spreadRadius: 1.0, // How much the shadow expands from the container
                ),
              ],

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Current Moisture Level:',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '${_moistureLevel.toStringAsFixed(2)}%',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white), // Adjust font size dynamically
                  ),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Plant name: \n sun flower',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.8)),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  width: 90.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    border: Border.all(
                      color: kShadowBlackColor.withOpacity(0.5),
                      width: 2.w,
                    ),
                  ),
                  child:  Image.asset(imagePath,
                       fit: BoxFit.cover,
                          ),
                  ),
              ],
            ),
            SizedBox(height: 20.h),
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
                  backgroundColor: lightGreen.withOpacity(0.7),
                child:   Icon(Icons.add,
                color: kShadowBlackColor,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

