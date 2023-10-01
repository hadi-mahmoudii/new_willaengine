import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Auth/controller/athentication_controller.dart';
import 'package:willaengine/presentation/pages/Auth/widget/default_auth_body.dart';
import 'package:willaengine/presentation/pages/Auth/widget/long_button.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/widgets/form/models/text_input_model.dart';
import 'package:willaengine/utils/widgets/form/text_input_widget.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({super.key});

  //key
  final formKey = GlobalKey<FormBuilderState>();
  final controller = Get.put(AthenticationController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: DefaultAuthBody(
        backText: 'forgot_pass'.tr,
        subjectTitle: 'set_new_password'.tr,
        subjectSubtitle: 'RESET YOUR PASSWORD',
        headerTitle: 'KEEP IT',
        headerSub: "SAFE",
        children: [
          TextInputWidget(
              model: TextInputModel(
            name: 'password',
            title: 'import_new_password'.tr,
            icon: Icons.lock,
          )),
          SizedBox(
            height: 3.h,
          ),
          TextInputWidget(
              model: TextInputModel(
            name: 'repeat_password',
            title: 'repeat_password'.tr,
            icon: Icons.lock,
          )),
          SizedBox(
            height: heightBlockSize * 6,
          ),
          SizedBox(height: 2.h),
          Obx(
            () => LongButton(
              text: 'set_new_password'.tr,
              loading: controller.newPassLoading.value,
              callBack: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                formKey.currentState?.save();
                controller.setNewPassword(
                  formKey.currentState!.value['password'],
                  formKey.currentState!.value['repeat_password'],
                );
              },
              color: AppColors.greenTitle,
            ),
          ),
        ],
      ),
    );
  }
}
