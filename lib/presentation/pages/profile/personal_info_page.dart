import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Auth/widget/long_button.dart';
import 'package:willaengine/presentation/pages/profile/controller/profile_controller.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/converters.dart';
import 'package:willaengine/utils/widgets/form/global_date_picker_widget.dart';
import 'package:willaengine/utils/widgets/form/models/text_input_model.dart';
import 'package:willaengine/utils/widgets/form/text_input_widget.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  //var
  bool initialized = false;
  DateTime? birthday;
  var profileController = Get.find<ProfileController>();
  var formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GlobalHeaderWidget(
        title: 'personalInfo'.tr,
        title2: 'PERSONAL INFO',
      ),
      body: FormBuilder(
        key: formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
          width: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextInputWidget(
                        model: TextInputModel(
                      name: 'name',
                      value: profileController.profile!.value?.firstName ?? '',
                      title: 'name'.tr,
                      icon: Icons.person,
                      required: true,
                    )),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Expanded(
                    child: TextInputWidget(
                        model: TextInputModel(
                      name: 'lastName',
                      title: 'lastName'.tr,
                      icon: Icons.person,
                      value: profileController.profile!.value?.lastName ?? '',
                      required: true,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              TextInputWidget(
                  model: TextInputModel(
                name: 'email',
                title: 'email'.tr,
                icon: Icons.mail,
                value: profileController.profile!.value?.email ?? '',
                required: true,
              )),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextInputWidget(
                        model: TextInputModel(
                      name: 'password',
                      title: 'name'.tr,
                      icon: Icons.menu_outlined,
                      required: true,
                    )),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Expanded(
                    child: TextInputWidget(
                        model: TextInputModel(
                      name: 'confirm_password',
                      title: 'lastName'.tr,
                      icon: Icons.menu_outlined,
                      required: true,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              GlobalDatePickerWidget(
                model: TextInputModel(
                  name: 'birthday',
                  title: 'birthday'.tr,
                  icon: Icons.date_range_outlined,
                  required: true,
                ),
                callBack: (DateTime time) {
                  birthday = time;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Divider(),
              SizedBox(
                height: 4.h,
              ),
              Obx(() => LongButton(
                    text: 'saveInfo'.tr,
                    loading: profileController.profileInfoLoading.value,
                    callBack: () async{
                      formKey.currentState!.save();
                    final bool response = await  profileController.editProfile({
                        "name": "${formKey.currentState!.value['name']} ${formKey.currentState!.value['lastName']}",
                        "name_en": null,
                        "first_name": formKey.currentState!.value['name'],
                        "last_name": formKey.currentState!.value['lastName'],
                        "national_code": null,
                        "email": formKey.currentState!.value['email'],
                        "birthday": birthday != null ? Converters.getDateTimeFormat(birthday!) : formKey.currentState!.value['email'],
                        "instagram": null,
                        "telegram": null,
                        "city_id": null,
                      });
                      if(response == true){
                        Get.back();
                      }
                    },
                    color: AppColors.blueBorder,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
