import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Home/widget/news_home_widget.dart';
import 'package:willaengine/presentation/pages/Home/widget/specials_home_widget.dart';
import 'package:willaengine/presentation/pages/blog/controller/blog_controller.dart';
import 'package:willaengine/presentation/pages/blog/controller/blog_detail_contoller.dart';
import 'package:willaengine/presentation/pages/blog/model/blog_model.dart';
import 'package:willaengine/presentation/pages/product/controller/product_detail_controller.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/Entities/global.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/cached_image.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';

import '../product/widgets/tools_line_widget.dart';

class BlogDetailPage extends StatefulWidget {
  BlogDetailPage({Key? key}) : super(key: key);

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  var blogController = Get.put(BlogController());
  int? id;

  @override
  void initState() {
    var argument = Get.arguments as Map;
    id = argument['id'];
    Get.put(BlogDetailController(), tag: id.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalHeaderWidget(
        title: "newsDetail".tr,
        title2: "BLOG DETAIL",
        gotBackIcon: true,
        gotSerach: false,
        gotLike: true,
        backRoute: Routes.homePage,
      ),
      body: GetX<BlogDetailController>(
          tag: id.toString(),
          builder: (controller) {
            return !controller.detailLoading.value
                ? ListView(children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            clipBehavior: Clip.hardEdge,
                            height: 30.h,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: cachedImage(controller.article.value?.mainImage ?? ''),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            controller.article.value!.title ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          const Divider(
                            color: AppColors.grey3,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later,
                                size: 11.sp,
                                color: AppColors.grey3,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                GlobalEntity().dateConvert(controller.article.value!.createdAt.toString()),
                                style: TextStyle(fontSize: 6.sp, color: AppColors.grey3),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Icon(
                                Icons.person,
                                size: 11.sp,
                                color: AppColors.grey3,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                controller.article.value?.user?.name ?? '',
                                style: TextStyle(
                                  fontSize: 6.sp,
                                  color: AppColors.grey3,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          // Text(controller.article.value?.content ?? ''),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Html(
                              data: controller.article.value?.content ?? '',
                              style: {"p": Style(textAlign: TextAlign.justify), "li": Style(textAlign: TextAlign.justify)},
                              shrinkWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    ToolsLineWidget(
                      relType: "article",
                      id: controller.article.value!.id!,
                      icon: AppIcons.comments,
                      goToPath: '',
                      title: "نظرات کاربران",
                      subTitle: "COMMENT",
                      backgroundColor: AppColors.purpleBack,
                      textColor: AppColors.purple,
                      gotAmount: true,
                      amount: controller.article!.value?.commentsCount.toString() ?? '0',
                    ),
                    SizedBox(height: 6.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Divider(
                            color: AppColors.grey3,
                          ),
                          Obx(
                            () => blogController.loading.value
                                ? const Center(
                                    child: LoadingWidget(mainFontColor: AppColors.blueBorder),
                                  )
                                : NewsHomeWidget(
                                    articles: blogController.articles!.value,
                                    title: 'similarNews'.tr,
                                    subTitle: 'SIMILAR BLOG',
                                  ),
                          ),
                          SizedBox(
                            height: 4.h,
                          )
                        ],
                      ),
                    )
                  ])
                : const Center(
                    child: LoadingWidget(mainFontColor: AppColors.blueBorder),
                  );
          }),
    );
  }
}
