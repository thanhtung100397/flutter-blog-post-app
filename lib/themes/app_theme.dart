
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData data = ThemeData(
    primaryColor: AppColor.appPrimary,
    primaryColorLight: AppColor.appPrimaryLight,
    primaryColorDark: AppColor.appPrimaryDark,
  );
}

class AppColor {
  static Color appPrimary = Colors.blue[500]!;
  static Color appPrimaryLight = Colors.blue[300]!;
  static Color appPrimaryDark = Colors.blue[700]!;
  static Color appSecondary = Colors.white;
  static Color appMainBackground = Colors.white;
  static Color appTextAccent = Colors.white;
  static Color disabled = Colors.grey[400]!;
}