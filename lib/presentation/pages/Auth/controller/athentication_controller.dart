import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willaengine/presentation/pages/Auth/Entities/auth.dart';
import 'package:willaengine/presentation/pages/shop/controller/shop_controller.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/Models/request_result.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/alert_dialog.dart';

class AthenticationController extends GetxController {
  //var
  var loading = false.obs;
  var newPassLoading = false.obs;

  signUp(
      {required String userName,
      password,
      cellNumber,
      confirmPassword,
      required BuildContext context}) async {
    loading.value = true;
    await AuthEntity()
        .signUp(
      userName: userName,
      password: password,
      cellNumber: cellNumber,
      confirmPassword: confirmPassword,
    )
        .then((result) {
      if (result == RequestResult.VerifyPhone) {
        Navigator.of(context).popAndPushNamed(Routes.verification);
      } else if (result == RequestResult.DuplicateNumber) {
        showDialog(
          context: context,
          builder: (ctx) => const GlobalAlertDialog(
            title: 'خطا',
            content: 'این شماره تلفن قبلااستفاده شده است!',
          ),
        );
      }
    });
    loading.value = false;
  }

  verifyRegister(String otp, BuildContext context) async {
    if (otp!.length == 6) {
      await AuthEntity().verifyRegister(otp!).then((result) async {
        if (result == RequestResult.Accept) {
          await showDialog(
            context: context,
            builder: (ctx) => const GlobalAlertDialog(
              title: 'ثبت نام',
              content: 'ثبت نام شما با موفقیت انجام شد',
            ),
          );
          Get.offAndToNamed(Routes.homePage);
        } else if (result == RequestResult.WrongCode) {
          await showDialog(
            context: context,
            builder: (ctx) => const GlobalAlertDialog(
              title: 'کد نادرست',
              content: 'کد وارد شده صحیح نمی باشد!',
            ),
          );
        } else {}
      });
    }
  }

  login(String phone, password, BuildContext context) async {
    loading.value = true;
    await AuthEntity().login(phone, password).then((result) async {
      Navigator.of(context).pushReplacementNamed(Routes.homePage);
      if (result == RequestResult.Accept) {
        ShopController.mergeShoppingCard();
        GlobalController.clearTempToken();
      } else if (result == RequestResult.VerifyPhone) {
        await showDialog(
          context: context,
          builder: (ctx) => const GlobalAlertDialog(
            title: 'خطا',
            content: 'مشکلی حین ورود رخ داده است.لطفا دوباره امتحان کنید.',
          ),
        );
      } else {
        await showDialog(
          context: context,
          builder: (ctx) => const GlobalAlertDialog(
            title: 'خطا',
            content: 'نام کاربری یا رمز واردشده صحیح نمی باشد.',
          ),
        );
      }
    });
    loading.value = false;
  }

  setNewPassword(String newPass, String repeat) async {
    newPassLoading.value = true;
    await AuthEntity().sendRePass(newPass);
    newPassLoading.value = false;
  }
}
