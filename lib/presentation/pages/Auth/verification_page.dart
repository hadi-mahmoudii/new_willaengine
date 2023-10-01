import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/gen/assets.gen.dart';
import 'package:willaengine/presentation/pages/Auth/controller/athentication_controller.dart';
import 'package:willaengine/presentation/pages/Auth/widget/default_auth_body.dart';
import 'package:willaengine/presentation/pages/Auth/widget/long_button.dart';
import 'package:willaengine/presentation/pages/Auth/widget/otp_input.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/widgets/form/models/number_input_model.dart';
import 'package:willaengine/utils/widgets/form/number_input_widget.dart';

import '../../../utils/Models/request_result.dart';
import '../../../utils/widgets/alert_dialog.dart';
import 'Entities/auth.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  //controllers
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  AthenticationController controller = AthenticationController();

  //var
  int timerValue = 60;
  String? otp;
  bool isLoading = false;
  Timer? globalTimer;
  bool isInit = true;

  void checkCode() async {
    otp = _fieldOne.text + _fieldTwo.text + _fieldThree.text + _fieldFour.text + _fieldFive.text + _fieldSix.text;
    controller.verifyRegister(otp!, context);
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    globalTimer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          // if (!this.mounted) {
          //   timer.cancel();
          // }
          if (timerValue < 1) {
            timerValue = 60;
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

  @override
  void dispose() {
    try {
      globalTimer?.cancel();
    } catch (e) {}
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      startTimer();
      setState(() {
        isInit = false;
      });
    }
    _fieldSix.addListener(() {
      Logger().e(otp);
      otp!.length == 6 ? checkCode() : null;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAuthBody(
      backText: 'sign'.tr,
      subjectTitle: 'confirm_phone'.tr,
      subjectSubtitle: 'CELL NUMBER VERIFY',
      headerTitle: 'JUST A',
      headerSub: "QUICK",
      children: [
        // NumberInputWidget(model: NumberInputModel(name: 'phone_number', title: 'phone_number'.tr, icon: Icons.call)),
        SizedBox(
          height: heightBlockSize * 6,
        ),
        Text(
          'confirm_text_number'.tr,
          style: const TextStyle(color: AppColors.black, fontSize: 14),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: [
            OtpInput(_fieldOne, 'first'), // auto focus
            OtpInput(_fieldTwo, ''),
            OtpInput(_fieldThree, ''),
            OtpInput(_fieldFour, ''),
            OtpInput(_fieldFive, ''),
            OtpInput(
              _fieldSix,
              "last",
              callBack: () {
                checkCode();
              },
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Container(
          width: 100.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: AppColors.blueIcon)),
                ),
                child: Center(
                    child: Image.asset(
                  Assets.images.star.path,
                  fit: BoxFit.cover,
                  height: 20,
                )),
              ),
              SizedBox(width: 2.w),
              Text(
                ' ارسال مجدد کد تا${timerValue.toString()}  ثانیه دیگر',
                style: TextStyle(color: AppColors.purple, fontSize: 5.sp),
              )
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
        ),

        LongButton(
            text: 'confirm_code'.tr,
            callBack: () {
              checkCode();
            })
      ],
    );
  }
}
