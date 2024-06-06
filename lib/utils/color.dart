import 'package:flutter/material.dart';

//background gradient colors
Color darkGreen = const Color(0xff3A7659);
Color lightGreen = const Color(0xff85B370);
Color dullGreen = const Color(0xffBDC763);

//Button Gradient  Colors
Color skyBlueColor = const Color(0xff00B4D8);
Color lightSkyColor = const Color(0xff90E0EF);
Color dullSkyColor = const Color(0xffCBEFF8);

Color kShadowBlackColor = const Color(0xff000000);

///background Gradient Color
Gradient kBackgroundGradient = LinearGradient(
  colors: [darkGreen, lightGreen, dullGreen],
  stops: const [0.4, 0.8, 1.0],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

///Primary Button Gradient Color
Gradient kPrimaryButtonGradient = LinearGradient(
  colors: [skyBlueColor, lightSkyColor, dullSkyColor],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
