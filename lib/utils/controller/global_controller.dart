import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:willaengine/presentation/pages/Auth/Entities/auth.dart';
import 'package:willaengine/presentation/pages/shop/controller/shop_controller.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/constant/app_keys.dart';
import 'package:willaengine/utils/constant/theme.dart';
import 'package:willaengine/utils/constant/token_generator.dart';
import 'package:willaengine/utils/storage.dart';

class GlobalController extends GetxController {
  String selectedLang = "";
  static String tempToken = '';
  static var rtl = false.obs;
  RxBool loginLoading = false.obs;
  static var isLoggedIn = false.obs;
  static var shoppingCardItem = 0.obs;

  bool get isRtl => rtl.value;
  Rx<TextDirection> direction = TextDirection.rtl.obs;
  final _appTheme = (AppThemes.persianLang).obs;
  ThemeData get appTheme => _appTheme.value;

  set appTheme(ThemeData value) {
    _appTheme.value = value;
  }

  set setRtl(bool value) {
    rtl.value = value;
  }

  setShoppingCardItem(int number) {
    shoppingCardItem.value = number;
  }

  @override
  void onInit() async {
    selectedLang = (storageRead(AppKeys.language) ?? "en") as String;
    super.onInit();
  }

  tryAutoLogin(BuildContext context) async {
    loginLoading.value = true;
    bool signed = await AuthEntity().tryAutoLogin(context);

    if (signed) {
      Get.offAndToNamed(Routes.homePage);
      ShopController.shoppingCardItems();
    } else {
      checkTempToken();
      Get.offAndToNamed(Routes.homePage);
      // Get.toNamed(Routes.login);
    }
    loginLoading.value = false;
  }

  static checkTempToken() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('tempToken')) {
      tempToken = getRandomString(50);
      final token = json.encode({'tempToken': tempToken});
      await prefs.setString('tempToken', token);
    } else {
      final token = json.decode(prefs.getString('tempToken')!);
      tempToken = token['tempToken'];
    }
    ShopController.shoppingCardItems();
  }

  static clearTempToken() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('tempToken')) {
      prefs.remove('tempToken');
    }
  }

  switchAppLanguage(String code) {
    Get.updateLocale(Locale(code, getCountryCode(code)));
  }

  Future<void> setAppLanguage(String code) async {
    Get.updateLocale(Locale(code, getCountryCode(code)));
    defineAppDirection(code);
    appTheme = getAppTheme(code);
    await storageWrite(AppKeys.language, code);
    selectedLang = code;
  }

  Locale getAppLanguage() {
    if (storageExists(AppKeys.language)) {
      return Locale(selectedLang, getCountryCode(selectedLang));
    }
    return const Locale("fa", "IR");
  }

  String getCountryCode(String code) {
    String countryCode = "";

    switch (code) {
      case "fa":
        countryCode = 'IR';
        break;
      case "en":
        countryCode = 'US';
        break;
      case "ar":
        countryCode = 'IQ';
        break;
    }

    return countryCode;
  }

  void defineAppDirection(String code) {
    if (code == 'fa') {
      rtl.value = true;
      direction.value = TextDirection.rtl;
    } else {
      rtl.value = false;
      direction.value = TextDirection.ltr;
    }
    Logger().w(rtl);
  }

  ThemeData getAppTheme(String code) {
    switch (code) {
      case "fa":
        return AppThemes.persianLang;
      case "en":
        return AppThemes.persianLang;
    }

    return AppThemes.persianLang;
  }

  static void setToken(String token) {
    storageWrite("token", token);
  }
}
