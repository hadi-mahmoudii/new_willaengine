import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Auth/controller/athentication_controller.dart';
import 'package:willaengine/presentation/pages/Auth/widget/auth_header.dart';
import 'package:willaengine/presentation/pages/Auth/widget/subject_widget.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/widgets/form/models/number_input_model.dart';
import 'package:willaengine/utils/widgets/form/number_input_widget.dart';

import '../../../utils/Models/request_result.dart';
import '../../../utils/widgets/alert_dialog.dart';
import 'Entities/auth.dart';
import 'widget/long_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller
  AthenticationController controller = AthenticationController();

  //key
  var formKey = GlobalKey<FormBuilderState>();

  //var
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AuthHeader(
        title: 'LET’S',
        title2: "DIG  IN",
      ),
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child: FormBuilder(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heightBlockSize * 1,
                      ),
                      Text(
                        'main'.tr,
                        style: TextStyle(
                          color: AppColors.greenTitle,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SubjectWidget(
                        title: 'enter'.tr,
                        subtitle: "LOGIN INTO APP",
                      ),
                      SizedBox(
                        height: heightBlockSize * 1,
                      ),
                      NumberInputWidget(
                        model: NumberInputModel(
                          name: 'phone',
                          title: 'phone_number'.tr,
                          icon: Icons.call,
                          required: true,
                        ),
                      ),
                      SizedBox(
                        height: heightBlockSize * 1,
                      ),
                      NumberInputWidget(
                        model: NumberInputModel(
                          name: 'password',
                          title: 'password'.tr,
                          icon: Icons.lock,
                          required: true,
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Obx(
                      () => IgnorePointer(
                        ignoring: false,
                        child: LongButton(
                          text: 'enter_app'.tr,
                          loading: controller.loading.value,
                          callBack: () async {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            formKey.currentState?.save();
                            controller.login(
                              formKey.currentState!.value['phone'],
                              formKey.currentState!.value['password'],
                              context,
                            );
                          },
                          color: AppColors.greenTitle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightBlockSize * 1.5,
                    ),
                    LongButton(
                      text: 'sign_in'.tr,
                      callBack: () => Get.toNamed(Routes.registration),
                      color: AppColors.brownTitle,
                    ),
                    SizedBox(
                      height: heightBlockSize * 1.5,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.forgotPass),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: AppColors.defaultColor))),
                          child: Text(
                            "forgot_pass_t".tr,
                            style: const TextStyle(color: AppColors.black, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
