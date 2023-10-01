import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Auth/controller/athentication_controller.dart';
import 'package:willaengine/presentation/pages/Auth/widget/default_auth_body.dart';
import 'package:willaengine/presentation/pages/Auth/widget/long_button.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/widgets/form/models/number_input_model.dart';
import 'package:willaengine/utils/widgets/form/models/text_input_model.dart';
import 'package:willaengine/utils/widgets/form/number_input_widget.dart';
import 'package:willaengine/utils/widgets/form/text_input_widget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  //controller
  AthenticationController controller = AthenticationController();

  //key
  final formKey = GlobalKey<FormBuilderState>();

  //var
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultAuthBody(
      backText: 'enter_system'.tr,
      subjectTitle: 'register_app'.tr,
      subjectSubtitle: 'REGISTRATION',
      headerTitle: 'JOIN THE',
      headerSub: "CLUB",
      children: [
        FormBuilder(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextInputWidget(
                      model: TextInputModel(
                    name: 'full_name',
                    title: 'full_name'.tr,
                    icon: Icons.person,
                    required: true,
                  )),
                  SizedBox(
                    height: 2.h,
                  ),
                  NumberInputWidget(
                      model: NumberInputModel(
                    name: 'phone_number',
                    title: 'phone_number'.tr,
                    icon: Icons.call,
                    required: true,
                  )),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextInputWidget(
                      model: TextInputModel(
                    name: 'password',
                    title: 'password'.tr,
                    icon: Icons.lock,
                    required: true,
                  )),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextInputWidget(
                      model: TextInputModel(
                    name: 'confirm_password',
                    title: 'repeat_password'.tr,
                    icon: Icons.lock,
                    required: true,
                  )),
                  SizedBox(
                    height: 4.h,
                  ),
                  Obx(() => LongButton(
                      color: AppColors.greenTitle,
                      text: 'confirm_code'.tr,
                      loading: controller.loading.value,
                      callBack: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        } else {
                          formKey.currentState!.save();
                          controller.signUp(
                            userName: formKey.currentState!.value['full_name'],
                            password: formKey.currentState!.value['password'],
                            cellNumber: formKey.currentState!.value['phone_number'],
                            confirmPassword: formKey.currentState!.value['confirm_password'],
                            context: context,
                          );
                        }
                      })),
                ],
              ),
            ))
      ],
    );
    ;
  }
}
