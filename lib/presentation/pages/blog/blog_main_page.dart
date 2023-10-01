import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/blog/controller/blog_controller.dart';
import 'package:willaengine/presentation/pages/blog/widgets/blog_item_widget.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';

class BlogMainPage extends StatefulWidget {
  const BlogMainPage({super.key});

  @override
  State<BlogMainPage> createState() => _BlogMainPageState();
}

class _BlogMainPageState extends State<BlogMainPage> {
  @override
  void initState() {
    Get.put(BlogController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalHeaderWidget(
        title: 'newsAndBLogs'.tr,
        title2: 'BLOGS',
      ),
      body: GetX<BlogController>(builder: (controller) {
        return !controller.loading.value
            ? ListView.builder(
                padding: globalPadding,
                itemCount: controller.articles?.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return BlogItemWidget(
                    article: controller.articles![index],
                  );
                },
              )
            : const Center(
                child: LoadingWidget(mainFontColor: AppColors.blueBorder),
              );
      }),
    );
  }
}
