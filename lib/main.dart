import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:sizer/sizer.dart';

import 'package:willaengine/localization/localization_service.dart';
import 'package:willaengine/presentation/routes/app_pages.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/theme.dart';
import 'package:willaengine/utils/controller/global_controller.dart';

import 'presentation/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColors.darkGrey, statusBarIconBrightness: Brightness.light));
  Get.put(GlobalController(), permanent: true);

  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final controller = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetX<GlobalController>(builder: (controller) {
        return GetMaterialApp(
          title: 'willaengine',
          getPages: AppPages.routes,
          initialRoute: Routes.splash,
          debugShowCheckedModeBanner: false,
          theme: controller.appTheme,
          enableLog: true,
          textDirection: controller.direction.value,
          translations: TranslationService(),
          locale: controller.getAppLanguage(),
        );
      });
    });
  }
}
