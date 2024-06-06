import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color.dart';

class custom_container extends StatelessWidget {
  final double height;
  final double width;
  final Widget text;
  const custom_container({

    super.key, required this.height, required this.width, required this.text,


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.r),
        color: darkGreen.withOpacity(0.5),
        border: Border.all(
          color: kShadowBlackColor.withOpacity(0.1),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: kShadowBlackColor.withOpacity(0.5), // Shadow color with opacity
            blurRadius: 1.0, // Blur radius of the shadow
            spreadRadius: 1.0, // How much the shadow expands from the container
          ),
        ],

      ),
      child: text,
    );
  }
}
