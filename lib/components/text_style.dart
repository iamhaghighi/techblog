import 'package:flutter/material.dart';
import 'package:techblog/components/colors.dart';

class AppTextStyle {
  static TextStyle title({
    Color color = AppColors.defaultColorWhite,
    double fontSize = 14
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle subTitle({
    Color color = AppColors.defaultColorWhite,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle heading1({
    Color color = AppColors.defaultColorWhite,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  static heading2({
    Color color = AppColors.defaultColorWhite,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w300,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}
