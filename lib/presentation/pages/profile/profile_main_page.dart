import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Auth/widget/auth_header.dart';
import 'package:willaengine/presentation/pages/Auth/widget/subject_widget.dart';
import 'package:willaengine/presentation/pages/profile/controller/profile_controller.dart';
import 'package:willaengine/presentation/pages/profile/widget/profile_item_part.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';

class ProfileMainPage extends StatefulWidget {
  const ProfileMainPage({super.key});

  @override
  State<ProfileMainPage> createState() => _ProfileMainPageState();
}

class _ProfileMainPageState extends State<ProfileMainPage> {
  final ProfileController profileController = ProfileController();
  @override
  void initState() {
    Get.put(ProfileController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthHeader(
        title: "YOUR",
        title2: 'PRIVATE',
        halfSize: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: globalPadding,
            child: Row(
              children: [
                const Expanded(
                  child: SubjectWidget(
                    title: 'محیط کاربری شما',
                    subtitle: "YOUR DASHBOARD",
                    closeHeight: true,
                  ),
                ),
                InkWell(
                  onTap: () {
                    profileController.logOut();
                  },
                  child: SvgPicture.asset(AppIcons.off),
                ),
                SizedBox(
                  width: 2.w,
                )
              ],
            ),
          ),
          GetX<ProfileController>(
            builder: (controller) => !controller.loading.value
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          children: [
                            Text(
                              controller.profile.value?.cellNumber ?? '',
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.navyBlue),
                            ),
                            const Divider(
                                color: AppColors.grey3, thickness: 0.8),
                            Text(
                              controller.profile.value?.name ?? '',
                              style: TextStyle(
                                  fontSize: 13.sp, color: AppColors.navyBlue),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          ProfileItemPart(
                            title: 'personalInfo'.tr,
                            subTitle: "MY PERSONAL INFO",
                            icon: AppIcons.person,
                            getBorder: false,
                            onPressed: () {
                              Get.toNamed(
                                Routes.personalInfoPage,
                              );
                            },
                          ),
                          ProfileItemPart(
                            title: "changePassword".tr,
                            subTitle: "CHANGE PASSWORD",
                            icon: AppIcons.star,
                            getBorder: true,
                            isCream: true,
                            onPressed: () {
                              Get.toNamed(Routes.changePasswordPage);
                            },
                          ),
                          ProfileItemPart(
                            title: 'myOrder'.tr,
                            subTitle: "MY ORDERS",
                            icon: AppIcons.shop,
                            getBorder: false,
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoadingWidget(mainFontColor: AppColors.blueBorder),
                    ],
                  ),
          )
        ]),
      ),
    );
  }
}
