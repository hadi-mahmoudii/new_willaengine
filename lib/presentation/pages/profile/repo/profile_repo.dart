import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/profile/model/profile_model.dart';
import 'package:willaengine/utils/configs/app_session.dart';
import 'package:willaengine/utils/configs/urls.dart';
import 'package:willaengine/utils/widgets/alert_dialog.dart';

class ProfileRepo {
  static Future getProfile() async {
    Dio dio = Dio();
    ProfileModel? profile;
    Logger().i(AppSession.token);
    try {
      var response = await dio.get(Urls.getProfile,
          options: Options(
            headers: {"Authorization": AppSession.token},
          ));
      if (response.statusCode == 200) {
        profile = ProfileModel.fromJson(response.data['data']);
        Logger().w(response.data);
        return profile;
      }
      Logger().w(response);
    } catch (e) {}
  }

  ///
  /// LOG OUT
  ///
  static Future<bool> logOut() async {
    Dio dio = Dio();
    try {
      var response = await dio.post(
        Urls.logOut,
        options: Options(
          headers: {"Authorization": AppSession.token},
        ),
      );
      Logger().i(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Logger().e(e);
      return false;
    }
  }

  ///
  /// EDIT
  ///
  static Future editProfile(Map updateProfile) async {
    Dio dio = Dio();
    ProfileModel? profile;
    try {
      var response = await dio.put(Urls.updateProfile,
          data: updateProfile,
          options: Options(
            headers: {"Authorization": AppSession.token},
          ));
      if (response.statusCode == 200) {
        profile = ProfileModel.fromJson(response.data['data']);
        Logger().w(response.data);
        return profile;
      }
    } catch (e) {}
  }

  static Future changePassword(String currentPass, String password,
      String passwordConfirm, BuildContext context) async {
    Dio dio = Dio();
    var data = {
      'current_password': currentPass,
      'password': password,
      'password_confirmation': passwordConfirm
    };
    try {
      var response = await dio.post(Urls.changePassword,
          data: data,
          options: Options(
            headers: {
              "Authorization": AppSession.token,
              'Content-Type': 'application/x-www-form-urlencoded',
              'Accept': 'application/json',
            },
          ));
      if (response.statusCode == 200) {
        Get.back();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        errorHandler(
            e.response?.data['errors']['credentials'] ??
                e.response?.data['errors']['password'][1],
            context);
      } else {
        errorHandler(e.response?.data['message'], context);
      }
    }
  }
}

errorHandler(String error, BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => GlobalAlertDialog(
      title: 'خطا',
      content: error,
    ),
  );
}
