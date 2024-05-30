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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;

    // bool isHappy = _moistureLevel > 50.0;
    // String imagePath = isHappy ? 'assets/happy_plant.png' : 'assets/sad_plant.png';

    return Scaffold(
      // appBar: AppBar(
      //   title: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
      //     child: Text('Plant Moisture Detector',
      //         style: TextStyle(
      //           fontSize: blockSizeHorizontal * 5.5,
      //           color: Colors.green,
      //           fontWeight: FontWeight.bold,
      //         )),
      //   ),
      // ),
      body: Container(
        padding: EdgeInsets.all(blockSizeHorizontal * 4),
        decoration: BoxDecoration(
          gradient: kBackgroundGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Plant Moisture Detector',
              style: TextStyle(
                  fontSize: blockSizeHorizontal * 6,
                  color: Colors.white), // Adjust font size dynamically
            ),
            SizedBox(height: blockSizeVertical * 2),
            Text(
              'Current Moisture Level:',
              style: TextStyle(
                  fontSize: blockSizeHorizontal * 6,
                  color: Colors.white), // Adjust font size dynamically
            ),
            SizedBox(
                height: blockSizeVertical * 2), // Adjust spacing dynamically
            Text(
              '${_moistureLevel.toStringAsFixed(2)}%',
              style: TextStyle(
                  fontSize: blockSizeHorizontal * 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white), // Adjust font size dynamically
            ),
            SizedBox(height: blockSizeVertical * 2),
            Container(
              width: 200,
              height: 100,
              color: Colors.red, // Set container color
            ),
            SizedBox(height: blockSizeVertical * 2),

            // Image.asset(
            //   imagePath,
            //   height: blockSizeVertical * 30, // Adjust image size dynamically
            // ),
            // SizedBox(height: blockSizeVertical * 4),

            CustomPrimaryButton(
              onTap: _refreshMoistureLevel,
              text: 'Refresh',
              height: 10,
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
