import 'package:flutter/material.dart';

class AppColors {
  static const Color bg = Color(0xFFF0F0F0);

  static const Color primaryColor = Color(0XFF426BD9);
  static const Color secondaryColor = Color(0XFFF58525);
  static const Color tertiaryColor = Color(0xFF120A4E);
  static const Color quaternaryColor = Color(0XFF3259BA);
  static const Color quinaryColor = Color(0xFF0B111F);

  static const Color defaultColorWhite = Colors.white;
  static const Color defaultColorBlack = Colors.black;
  static const Color navBottomShadow = Color(0xA73259BA);
  static const Color warningColor = Color(0XFFFF264B);
  static const Color profileSettingBoxShadow = Color.fromARGB(15, 0, 0, 0);
  static const Color divider = Color.fromARGB(100, 172, 169, 191);
}

class AppGradient {
  static const List<Color> primaryGradient = [
    Color(0xCA264DAF),
    Colors.transparent,
  ];

  static const List<Color> contentGradient = [
    Color(0xE0000000),
    Colors.transparent,
  ];

  static const List<Color> profileScreenBorderGradient = [
    Color(0XFF22387A),
    Color.fromARGB(0, 255, 255, 255),
  ];
}
