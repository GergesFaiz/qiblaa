import 'package:flutter/material.dart';
import 'package:qiblaa/utils/AppColors.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(

      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.Gold
        ),
          titleTextStyle: AppTextStyle.bold20Gold,
          centerTitle: true,
          backgroundColor: AppColors.black)

  );
}