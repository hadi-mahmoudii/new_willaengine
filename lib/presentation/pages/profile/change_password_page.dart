import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Auth/widget/long_button.dart';
import 'package:willaengine/presentation/pages/profile/controller/profile_controller.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/widgets/form/models/text_input_model.dart';
import 'package:willaengine/utils/widgets/form/text_input_widget.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  var controller = Get.find<ProfileController>();
  var formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GlobalHeaderWidget(
        gotBackIcon: true,
        title: 'changePassword'.tr,
        title2: 'PERSONAL INFO',
      ),
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: globalPadding,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              TextInputWidget(
                  model: TextInputModel(
                name: 'currentPassword',
                title: 'currentPassword'.tr,
                icon: CupertinoIcons.staroflife_fill,
                required: true,
              )),
              SizedBox(
                height: 4.h,
              ),
              TextInputWidget(
                  model: TextInputModel(
                name: 'newPassword',
                title: 'newPassword'.tr,
                icon: CupertinoIcons.staroflife_fill,
                required: true,
              )),
              SizedBox(
                height: 4.h,
              ),
              TextInputWidget(
                  model: TextInputModel(
                name: 'repeatNewPassword',
                title: 'repeatNewPassword'.tr,
                icon: CupertinoIcons.staroflife_fill,
                required: true,
              )),
              SizedBox(
                height: 8.h,
              ),
              Obx(() => LongButton(
                    text: 'changePassword'.tr,
                    color: AppColors.blueBorder,
                    loading: controller.passwordLoading.value,
                    callBack: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        controller.changePassword(
                          formKey.currentState!.value['currentPassword'],
                          formKey.currentState!.value['newPassword'],
                          formKey.currentState!.value['repeatNewPassword'],
                          context,
                        );
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
