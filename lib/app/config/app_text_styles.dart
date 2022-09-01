import 'package:flutter/material.dart';
import 'package:flutter_web/app/config/app_colors.dart';

/// AppTextStyle format as follows:
/// [fontWeight][fontSize][colorName][opacity]
/// Example: bold18White05
///
class AppTextStyles {
  static TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle header1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.gray700,
  );

  static TextStyle header2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.gray700,
  );

  static TextStyle header3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.gray700,
  );

  static TextStyle header4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.gray700,
  );

  static TextStyle header5 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.gray700,
  );

  static TextStyle body1 = TextStyle(
    fontSize: 16,
    color: AppColors.gray700,
  );

  static TextStyle body2 = TextStyle(
    fontSize: 14,
    color: AppColors.gray700,
  );

  static TextStyle body3 = TextStyle(
    fontSize: 12,
    color: AppColors.gray700,
  );

  static TextStyle body4 = TextStyle(
    fontSize: 10,
    color: AppColors.gray700,
  );
}
