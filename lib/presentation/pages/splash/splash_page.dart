import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:willaengine/gen/assets.gen.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/text_style.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final globalController = Get.find<GlobalController>();
  int selectedIndex = 0;
  String code = 'fa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        Assets.images.splash_intro.path,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(8.0),
                  child: GetX<GlobalController>(builder: (controller) {
                    return SizedBox(
                      width: Get.width / 1.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                  3,
                                  (index) => languageBox(index, index == selectedIndex, (String lan) {
                                        setState(() {
                                          selectedIndex = index;
                                          code = lan.toLowerCase();
                                        });
                                        controller.switchAppLanguage(code);
                                      }))),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              controller.tryAutoLogin(context);
                              controller.setAppLanguage(code);
                            },
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border.all(color: AppColors.primaryBorder), borderRadius: BorderRadius.circular(10)),
                              child: controller.loginLoading.value
                                  ? const LoadingWidget(mainFontColor: AppColors.blueBorder)
                                  : Text(
                                      'language_but'.tr,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }

  Widget languageBox(int index, bool selected, Function callback) {
    List languages = [
      {'title': 'FA', 'subtitle': 'فارسی'},
      {'title': 'EN', 'subtitle': 'English'},
      {'title': 'AR', 'subtitle': 'العربیه'}
    ];
    return InkWell(
      onTap: () => callback(languages[index]['title']),
      child: Container(
        width: Get.width / 5,
        height: 114,
        decoration: BoxDecoration(
            color: selected ? Colors.transparent : Colors.white.withOpacity(0.5),
            border: Border.all(color: selected ? AppColors.primaryBorder.withOpacity(0.8) : const Color(0xff063F89).withOpacity(0.4)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(languages[index]['title'], style: selected ? AppTextStyles.black_40_w500 : AppTextStyles.black_40_w500_op),
            const SizedBox(
              height: 8,
            ),
            Text(
              languages[index]['subtitle'],
              style: selected ? AppTextStyles.black_10_w300 : AppTextStyles.black_10_w300_op,
            )
          ],
        ),
      ),
    );
  }
}
