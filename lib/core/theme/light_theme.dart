import 'package:flutter/material.dart';

import 'package:home_shopping/utils/color/app_colors.dart';
import 'package:home_shopping/utils/config/app_config.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  fontFamily: AppConfig.questrial,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    foregroundColor: AppColors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.white),
    titleTextStyle: TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),

  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent, // override later
      shadowColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      textStyle: TextStyle(
        fontFamily: AppConfig.questrial,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white, // text color
      ),
    ),
  ),


  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.brandHoverColor, width: 1.5),
      foregroundColor: Colors.black,
      minimumSize: const Size(186, 48),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(
        fontFamily: AppConfig.questrial,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryText,
      textStyle: const TextStyle(
        fontFamily: AppConfig.questrial,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        decoration: TextDecoration.underline,
      ),
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.brandHoverColor),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.backgroundColor,
    iconColor: AppColors.brandHoverColor,
    prefixIconColor: AppColors.brandHoverColor,
    suffixIconColor: AppColors.brandHoverColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.inputBorderColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.errorColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.inputBorderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.inputBorderColor),
    ),

    hintStyle: TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.hintColor,
    ),

    errorStyle: const TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.errorColor,
    ),
  ),


  textTheme: const TextTheme(

    titleLarge:TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.titleLargeColor,
    ),

    titleSmall: TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.greyTextColor,
    ),





    bodyLarge: TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.greyTextColor,
    ),
    bodyMedium:TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),

    bodySmall: TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.greyTextColor,
    ),












    // headlineLarge: TextStyle(
    //   fontFamily: AppConfig.questrial,
    //   fontSize: 32,
    //   fontWeight: FontWeight.w600,
    //   color: AppColors.primaryText,
    // ),
    // headlineMedium: TextStyle(
    //   fontFamily: AppConfig.questrial,
    //   fontSize: 28,
    //   fontWeight: FontWeight.w600,
    //   color: AppColors.primaryText,
    // ),
    headlineSmall: TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.titleLargeColor,
    ),

    titleMedium: TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),




    labelLarge: TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    ),
    labelMedium: TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    ),
    labelSmall: TextStyle(
      fontFamily: AppConfig.questrial,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    ),
  ),
);
