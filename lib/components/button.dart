import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happyplant/color.dart';

class CustomPrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double height;
  final double width;

  const CustomPrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: kPrimaryButtonGradient,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 9.sp,
              //fontWeight: FontWeight.bold,
              color: kShadowBlackColor,
              shadows: [
                Shadow(
                  color: kShadowBlackColor.withOpacity(0.3),
                  offset: const Offset(-0.1, 1.9),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
