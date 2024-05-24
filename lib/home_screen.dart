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
      _moistureLevel = (50 + (50 * (DateTime.now().millisecondsSinceEpoch % 10) / 10));
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
      appBar: AppBar(
        title: const Text('Plant Moisture Detector'),
      ),
      body: Padding(
        padding: EdgeInsets.all(blockSizeHorizontal * 4), // Adjust padding dynamically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Moisture Level:',
              style: TextStyle(fontSize: blockSizeHorizontal * 6), // Adjust font size dynamically
            ),
            SizedBox(height: blockSizeVertical * 2), // Adjust spacing dynamically
            Text(
              '${_moistureLevel.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: blockSizeHorizontal * 12, fontWeight: FontWeight.bold), // Adjust font size dynamically
            ),
            SizedBox(height: blockSizeVertical * 2),
            // Image.asset(
            //   imagePath,
            //   height: blockSizeVertical * 30, // Adjust image size dynamically
            // ),
            // SizedBox(height: blockSizeVertical * 4),
            ElevatedButton(
              onPressed: _refreshMoistureLevel,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: blockSizeHorizontal * 8, // Adjust padding dynamically
                  vertical: blockSizeVertical * 2, // Adjust padding dynamically
                ),
                textStyle: TextStyle(fontSize: blockSizeHorizontal * 4.5), // Adjust font size dynamically
              ),
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
