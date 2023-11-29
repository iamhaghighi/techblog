import 'package:flutter/material.dart';
import 'package:techblog/components/colors.dart';

class AppTextStyle {
  static TextStyle title({
    Color color = AppColors.defaultColorWhite,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle subTitle({
    Color color = AppColors.defaultColorWhite,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle heading1({
    Color color = AppColors.defaultColorWhite,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static heading2({
    Color color = AppColors.defaultColorWhite,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w300,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
