import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/gen/assets.gen.dart';
import 'package:willaengine/presentation/pages/Auth/Entities/auth.dart';
import 'package:willaengine/presentation/pages/Auth/widget/default_auth_body.dart';
import 'package:willaengine/presentation/pages/Auth/widget/long_button.dart';
import 'package:willaengine/presentation/pages/Auth/widget/otp_input.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/Models/request_result.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/widgets/alert_dialog.dart';
import 'package:willaengine/utils/widgets/form/models/number_input_model.dart';
import 'package:willaengine/utils/widgets/form/number_input_widget.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  //controllers
  final TextEditingController _cellNumberCtrl = TextEditingController();
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  //var
  String? otp;
  bool isLoading = false;
  bool codeSended = false;
  int timerValue = 60;
  Timer? globalTimer;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    globalTimer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          // if(!this.mounted){
          //   timer.cancel();
          // }
          if (timerValue < 1) {
            timerValue = 60;
            codeSended = false;
            timer.cancel();
          } else {
            setState(() {
              timerValue -= 1;
            });
          }
        },
      ),
    );
  }

  bool letTextBoxEnable() {
    if (!isLoading && !codeSended) {
      return true;
    } else {
      return false;
    }
  }

  bool letCodeBoxEnable() {
    if (!isLoading && codeSended) {
      return true;
    } else {
      return false;
    }
  }

  Future<void>? checkCode(String value) {
    setState(() {
      isLoading = true;
    });
    AuthEntity().verifyForgetPass(value).then((result) async {
      if (result == RequestResult.WrongCode) {
        await showDialog(
          context: context,
          builder: (ctx) => const GlobalAlertDialog(
            title: 'کد نادرست',
            content: 'کد واردشده صحیح نمی باشد!',
          ),
        );
        Navigator.popAndPushNamed(context, Routes.forgotPass);
      } else {
        // Navigator.of(context).pushReplacementNamed(Routes.rePassScreen);
      }
      // setState(() {
      //   isLoading = false;
      //   codeSended = true;
      // });
    });
    return null;
  }

  Future<void>? requestCode(String cellNumber) {
    setState(() {
      isLoading = true;
    });
    AuthEntity().forgetPass(cellNumber).then((result) {
      Logger().i(result);
      if (result == RequestResult.VerifyPhone) {
        setState(() {
          isLoading = false;
          codeSended = true;
        });
        startTimer();
      } else {
        if (result == RequestResult.Reject) {
          showDialog(
            context: context,
            builder: (ctx) => const GlobalAlertDialog(
              title: 'خطا',
              content: 'کاربری با این شماره وجود ندارد لطفا ابتدا در سایت ثبت نام نمایید',
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (ctx) => const GlobalAlertDialog(
              title: 'خطا',
              content: 'این شماره قبلا ثبت نام نکرده است!',
            ),
          );
        }

        setState(() {
          isLoading = false;
          // codeSended = true;
        });
      }
    });
    return null;
  }

  @override
  void dispose() {
    try {
      globalTimer!.cancel();
    } catch (e) {}
    _cellNumberCtrl.dispose();
    // _verificationCodeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAuthBody(
      backText: 'enter'.tr,
      subjectTitle: 'forgot_pass'.tr,
      subjectSubtitle: 'FORGOT PASSWORD',
      headerTitle: 'FORGOT',
      headerSub: "SOMETHING",
      children: [
        NumberInputWidget(
          model: NumberInputModel(
            name: 'phone_number',
            controller: _cellNumberCtrl,
            title: 'phone_number'.tr,
            icon: Icons.call,
            required: true,
            callBack: (value) {
              if (value.length == 11 && !codeSended) {
                requestCode(_cellNumberCtrl.text);
              }
            },
          ),
        ),
        SizedBox(
          height: heightBlockSize * 6,
        ),
        isLoading
            ? const LoadingWidget(mainFontColor: AppColors.grey3)
            : Column(
                children: [
                  Text(
                    'confirm_text'.tr,
                    style: const TextStyle(color: AppColors.black, fontSize: 14),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OtpInput(_fieldOne, 'first'), // auto focus
                      OtpInput(_fieldTwo, ''),
                      OtpInput(_fieldThree, ''),
                      OtpInput(_fieldFour, ''),
                      OtpInput(_fieldFive, ''),
                      OtpInput(_fieldSix, 'last'),
                    ],
                  ),
                ],
              ),
        SizedBox(height: 2.h),
        Container(
          width: 100.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: AppColors.blueIcon)),
                ),
                child: Center(
                    child: Image.asset(
                  Assets.images.starBlue.path,
                  fit: BoxFit.cover,
                  height: 20,
                  color: AppColors.brownTitle,
                )),
              ),
              SizedBox(width: 2.w),
              Text(
                ' ارسال مجدد کد تا${timerValue.toString()}  ثانیه دیگر',
                style: TextStyle(
                  color: AppColors.brownTitle,
                  fontSize: 6.sp,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        LongButton(
            text: 'confirm_code'.tr,
            color: AppColors.greenTitle,
            callBack: () {
              Get.toNamed(Routes.newPassword);
            })
      ],
    );
  }
}
