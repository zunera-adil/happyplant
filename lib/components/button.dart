import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: kPrimaryButtonGradient,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            text,
            style: theme.textTheme.labelSmall?.copyWith(
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
