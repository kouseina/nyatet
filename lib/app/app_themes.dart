import 'package:flutter/material.dart';
import 'package:nyatet/app/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 21,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    ),
    hintColor: Colors.grey.shade400,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.white,
        fontSize: 57,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        color: AppColors.white,
        fontSize: 45,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        color: AppColors.white,
        fontSize: 36,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        color: AppColors.white,
        fontSize: 32,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: AppColors.white,
        fontSize: 28,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: AppColors.white,
        fontSize: 24,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 22,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        wordSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: AppColors.white,
        fontSize: 11,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
