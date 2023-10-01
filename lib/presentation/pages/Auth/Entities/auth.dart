import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:willaengine/utils/controller/global_controller.dart';

import '../../../../utils/Models/request_result.dart';
import '../../../../utils/configs/app_session.dart';
import '../../../../utils/configs/urls.dart';

//09122000000
class AuthEntity {
  // bool showSplash = true; //for dont show splash many times

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  String? _helperToken;
  String? _token;
  DateTime? _expiaryDate;

  // bool _isLoggedIn = false;
  Map<String, dynamic> _userData = {};

// eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjI5YWE5Y2JjYWU0MjkyYTY5MWQwOGU3MTM0MGI1NzBlOGFlMWIwMDlmNDRiMGRjZTU3NDk1ZjMzYTIxMmNjYzg3ZWVjODdhNDNkYzQ3NGM1In0.eyJhdWQiOiIxIiwianRpIjoiMjlhYTljYmNhZTQyOTJhNjkxZDA4ZTcxMzQwYjU3MGU4YWUxYjAwOWY0NGIwZGNlNTc0OTVmMzNhMjEyY2NjODdlZWM4N2E0M2RjNDc0YzUiLCJpYXQiOjE1OTAzMDQwMzIsIm5iZiI6MTU5MDMwNDAzMiwiZXhwIjoxNjIxODQwMDMyLCJzdWIiOiIxNTY5Iiwic2NvcGVzIjpbXX0.G7FlP8l4Fq1PK-iB2otXYnunlQwGA0RgwFhFyHYVmcnuDSCM8NBdhlgxUdNAXTfv2ASuD6GTFehtHlYZoU6LUc8cspxzBnlqapJOi7GVYHasVu7GTKpJ9a2-_io0ikFfyRg-1YV7G-cU1tPhtaaVzCPbZYQ93pISGB9Jx_IZHuO58glHxF9OZQoSoZj-1RxI96e2s3_6-_Dv74_qASxrAdPdtCwbGJu8PI2b8NUaosBp89bDcWdDPfBzOat1fGJViNvSliufAFXrWwHU9oim6W9pzJfbgBApkm4L0Wt7B1ECwyCmP3ZQcY-UvjIsjpk4nJkotrl-nQ19ZfnuBdTob_yTdeddwN2C_mQdF6F0Ilw2Yc_dVFFLn2U3iO25pY9TkETLgQDR8iF1sjQNtUpr41wPIAujb3rc1jIj3aMexPvctelpTQQF_Qqk-iMr8_7mTwPQMrgVFDXT8QU6xgSaxiCC3yuNwFN8JPsjrvYCq6xhEct7uFpwiEUzcTSo3g8ZdM2mbYJj5cpa0LWXx6L_Ffmw7HtxUvlREYkuUrqCu1nfXnVOpWO8Bwo0nauZan2KxJBDEO5bYeViQMcUhMW7rArn3TkK0NCi9Xxco8SL2mO5MfKeNcFZZhxva7aFHvSV3I6fUCZbjlKfK3qEd_b1hdRdcbQvWfRGqBdy_Lk3Xw8
  Future<RequestResult> verifyRegister(String code) async {
    final response = await http.post(
      Uri.parse(Urls.verifyRegisterNumber),
      headers: headers,
      body: {
        'code': code,
      },
    );
    final responseData = json.decode(response.body);

    try {
      if ((responseData['data'] as List<dynamic>).isEmpty) {
        print('Wrong Code');
        return RequestResult.WrongCode;
      }
    } catch (e) {}

    _token = responseData['data']['token'];
    _userData = responseData['data']['user'];
    _expiaryDate = DateTime.now().add(
      Duration(
        // seconds: responseData['expires_in'],
        seconds: 10000000000,
      ),
    );
    AppSession.token = _token!;
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'token': _token,
      'expiaryDate': _expiaryDate?.toIso8601String(),
      'user': _userData
    });
    prefs.setString('userData', userData);
    AppSession.isLoggedIn = true;
    GlobalController.isLoggedIn.value = true;
    return RequestResult.Accept;
  }

  Future<RequestResult> forgetPass(String cellNumber) async {
    final response = await http.post(
      Uri.parse(Urls.getForgetPassNumber),
      body: {
        'cell_number': cellNumber,
      },
      // headers: {'X-Requested-With': 'XMLHttpRequest', 'origin': Urls.domain},
    );
    final responseData = json.decode(response.body);
    print(responseData);

    try {
      if (responseData['message']['title'] == 'موفق') {
        return RequestResult.VerifyPhone;
      } else {
        return RequestResult.Reject;
      }
    } catch (e) {
      return RequestResult.Reject;
    }
  }

  Future<RequestResult> sendRePass(String password) async {
    final response = await http.post(
      Uri.parse(Urls.sendRePass),
      body: {
        'password': password,
        'password_confirmation': password,
      },
      // headers: {
      //   'X-Requested-With': 'XMLHttpRequest',
      //   'origin': Urls.domain,
      //   'Authorization': 'Bearer ' + _helperToken!,
      // },
    );
    final responseData = json.decode(response.body);
    print(responseData['message']['title']);
    if (responseData['message']['title'] == 'موفق') {
      return RequestResult.Accept;
    } else {
      return RequestResult.Reject;
    }
  }

  Future<RequestResult> verifyForgetPass(String code) async {
    final response = await http.post(
      Uri.parse(Urls.verifyForgetPassNumber),
      body: {
        'code': code,
      },
      headers: {'X-Requested-With': 'XMLHttpRequest', 'origin': Urls.domain},
    );
    final responseData = json.decode(response.body);
    if (responseData['data'] == null) {
      return RequestResult.WrongCode;
    }
    print(responseData['data']);
    _helperToken = responseData['data']['token'];
    return RequestResult.Accept;

    // if (response.statusCode == 401) {
    //   if (responseData['message'] == 'The user credentials were incorrect.') {
    //     return 'badinput'; // incorrect user or pass
    //   }
    //   else{
    //     return 'error';
    //   }
    // }
    // try {
    //   if (responseData['message']['title'] == 'موفق') {
    //     return RequestResult.VerifyPhone;
    //   } else {
    //     return RequestResult.Reject;
    //   }
    // } catch (e) {
    //   return RequestResult.Reject;
    // }
  }

  Future<RequestResult> signUp(
      {required String userName,
      required String password,
      required String confirmPassword,
      required String cellNumber}) async {
    var bodyFields = {
      'first_name': 'test',
      'last_name': userName,
      'email': 'test1@test.com',
      'cell_number': cellNumber,
      'password': password,
      'password_confirmation': confirmPassword
    };
    var response = await http.post(
      Uri.parse(Urls.signUp),
      body: bodyFields,
      headers: headers,
    );
    final responseData = json.decode(response.body);
    try {
      var result = responseData['message']['title'];
      if (result == 'موفق') {
        return RequestResult.VerifyPhone;
      }
    } catch (e) {
      print(e);
    }
    try {
      if (responseData['errors'][0] ==
          'کاربر دیگری با این شماره تلفن ثبت نام کرده') {
        return RequestResult.DuplicateNumber;
      }
    } catch (e) {
      print(e);
    }
    return RequestResult.Reject;
  }

  Future<RequestResult> login(String userName, String password) async {
    print(userName);
    print(password);
    final response = await http.post(
      Uri.parse(Urls.login),
      headers: headers,
      body: {
        'username': userName,
        'password': password,
      },
    );
    print(response.body);
    final responseData = json.decode(response.body);
    print(responseData);
    try {
      if (responseData['errors']['verification'] ==
          'تأیید شماره تلفن انجام نشده است.') {
        return RequestResult.VerifyPhone;
      }
    } catch (e) {}
    try {
      if (responseData['errors']['credentials'] ==
          'نام کاربری و یا رمز عبور نادرست می باشد.') {
        return RequestResult.WrongLogin;
      }
      if (responseData['message'] == 'The given data was invalid.') {
        return RequestResult.WronNumber;
      } else {
        print('Error');
        return RequestResult.WrongLogin;
      }
    } catch (e) {}
    _token = responseData['data']['token'];
    _userData = responseData['data']['user'];
    AppSession.token = _token!;
    _expiaryDate = DateTime.now().add(
      const Duration(
        // seconds: responseData['expires_in'],
        seconds: 10000000000,
      ),
    );
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'token': _token,
      'expiaryDate': _expiaryDate?.toIso8601String(),
      'user': _userData
    });
    prefs.setString('userData', userData);
    AppSession.isLoggedIn = true;
    GlobalController.isLoggedIn.value = true;
    return RequestResult.Accept;
  }

  Future<bool> tryAutoLogin(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    var sizes = MediaQuery.of(context).size;
    AppSession.deviceWidth = sizes.width;
    AppSession.deviceHeigth = sizes.height;
    AppSession.deviceBlockSize = sizes.width / 100;
    AppSession.isLoggedIn = false;
    GlobalController.isLoggedIn.value = false;
    AppSession.mainFontColor = Theme.of(context).primaryColor;
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      print('undone');

      return false;
    }
    final userData = json.decode(prefs.getString('userData')!);
    final expiaryDate = DateTime.parse(userData['expiaryDate'].toString());
    if (expiaryDate.isBefore(DateTime.now())) {
      return false;
    }
    // _token = userData['token'];
    AppSession.token = userData['token'].toString();
    var data = HashMap.from(userData['user'] as Map);
    AppSession.userId = data['id'].toString();
    print(AppSession.userId);
    // _expiaryDate = expiaryDate;
    // print(userData['user']);
    AppSession.isLoggedIn = true;
    GlobalController.isLoggedIn.value = true;
    return true;
  }

  static void logout() async {
    AppSession.isLoggedIn = false;
    GlobalController.isLoggedIn.value = false;
    AppSession.token = '';
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    GlobalController.checkTempToken();
  }
}
