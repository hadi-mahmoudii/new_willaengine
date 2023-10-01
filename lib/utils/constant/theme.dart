import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:willaengine/gen/fonts.gen.dart';
import 'package:willaengine/utils/constant/color.dart';

class AppThemes {
  static final persianLang = _getTheme(lang: 'fa');
  static final englishLang = _getTheme(lang: 'en');
  static ThemeData _getTheme({required String lang}) {
    return ThemeData(
        primaryColor: AppColors.materialLightPrimaryColor,
        primaryColorLight: AppColors.grayTitle,
        scaffoldBackgroundColor: AppColors.bgColor,
        dialogBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.deepPurpleAccent,
          // foregroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle(
            // <-- SEE HERE
            // Status bar color
            statusBarColor: Colors.green,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        canvasColor: Colors.white,
        fontFamily: getFont(lang),
        textTheme: Get.textTheme.apply(
          displayColor: Color(0xff707070),
          bodyColor: Color(0xff707070),
          fontFamily: getFont(lang),
        ),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.accent).copyWith(background: AppColors.bgColor));
  }

  static getFont(lang) {
    return lang == "en" ? FontFamily.montserrat : FontFamily.iranYekan;
  }
}
