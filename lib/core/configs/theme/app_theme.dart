import 'package:flutter/material.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';

class AppTheme{


  static final lightTheme = ThemeData(
    primaryColor:  AppColors.primary,
    fontFamily: 'Satoshi',
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(30),
        suffixIconColor: const Color(0xff8D8D8D),
        hintStyle: const TextStyle(
          color: Color(0xff383838),
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(
              width: 1, color: Colors.black.withOpacity(0.2)
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderSide:  BorderSide(
              width: 0.4, color: Colors.black.withOpacity(0.2)
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide:  BorderSide(
              width: 0.6, color: Colors.black.withOpacity(0.7)
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    scaffoldBackgroundColor: AppColors.lightBackground ,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      )
    ),
    )
  );

  static final darkTheme = ThemeData(
    primaryColor:  AppColors.primary,
    fontFamily: 'Satoshi',
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      suffixIconColor: const Color(0xff5b5b5b),
      hintStyle: const TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(30),
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(
            width: 0.4, color: Colors.white.withOpacity(0.2)
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          width: 0.4, color: Colors.white.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      border: OutlineInputBorder(
        borderSide:  BorderSide(
            width: 0.6, color: Colors.white.withOpacity(0.7),
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    scaffoldBackgroundColor: AppColors.darkBackground ,
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      )
    ),
    )
  );
}