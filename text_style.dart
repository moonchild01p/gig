import 'package:flutter/material.dart';
import 'package:my_app/theme/app_color.dart';

class AppTextStyles {
  static const TextStyle statusBarText = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 17,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 17,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle bodyText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle coverageTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 17,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle coverageText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );
}