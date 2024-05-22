import 'package:flutter/material.dart';

Color darkGreen = const Color(0xff3A7659);
Color lightGreen = const Color(0xff85B370);
Color dullGreen = const Color(0xffBDC763);

///background Gradient Color
Gradient kBackgroundGradient = LinearGradient(
  colors: [darkGreen, lightGreen, dullGreen],
  stops: const [0.4, 0.8, 1.0],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
