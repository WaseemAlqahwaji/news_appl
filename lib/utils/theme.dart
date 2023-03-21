import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KTheme
{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.bold,
          ),
          color: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,

          ),
      ),
  );
  // static ThemeData darkTheme = ThemeData(
  //   scaffoldBackgroundColor: Colors.white,
  //   appBarTheme: AppBarTheme(
  //     centerTitle: true,
  //     titleTextStyle: TextStyle(
  //       color: Colors.black,
  //       fontSize: 16.0.sp,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     color: Colors.white,
  //     elevation: 0.0,
  //     systemOverlayStyle: const SystemUiOverlayStyle(
  //         statusBarColor: Colors.transparent
  //     ),
  //   ),
  // );
}