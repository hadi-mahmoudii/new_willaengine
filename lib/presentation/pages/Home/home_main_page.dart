import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Home/controller/home_controller.dart';
import 'package:willaengine/presentation/pages/Home/models/categories_model.dart';
import 'package:willaengine/presentation/pages/Home/widget/carousel_slider_widget.dart';
import 'package:willaengine/presentation/pages/Home/widget/categories_home_widget.dart';
import 'package:willaengine/presentation/pages/Home/widget/news_home_widget.dart';
import 'package:willaengine/presentation/pages/Home/widget/specials_home_widget.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

class HomeMainPage extends StatefulWidget {
  HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  CarouselController buttonCarouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: GlobalHeaderWidget(
          title: 'home'.tr,
          title2: "SWEET HOME",
        ),
        body: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: !controller.loading.value
                ? ListView(children: [
                    controller.sliders.isNotEmpty
                        ? SizedBox(
                            height: 3.h,
                          )
                        : SizedBox(),
                    controller.sliders.isNotEmpty
                        ? CarouselSliderWidget(
                            sliders: controller.sliders.value,
                            controller: buttonCarouselController,
                          )
                        : SizedBox(),
                    !controller.categoryLoading.value
                        ? CategoriesHomeWidget(
                            categories: controller.mainCategories,
                          )
                        : const Center(
                            child: LoadingWidget(
                              mainFontColor: AppColors.blueBorder,
                            ),
                          ),
                    !controller.specialProLoading.value && controller.specialsProduct.isNotEmpty
                        ? SpecialsHomeWidget(
                            specialProducts: controller.specialsProduct,
                          )
                        : Container(
                            height: 30.h,
                            child: const LoadingWidget(
                              mainFontColor: AppColors.blueBorder,
                            ),
                          ),
                    !controller.articleLoading.value
                        ? NewsHomeWidget(
                            articles: controller.specialsArticle,
                            title: 'recent_news'.tr,
                            subTitle: 'Latest On Our Blog',
                          )
                        : Container(
                            height: 30.h,
                            child: LoadingWidget(mainFontColor: AppColors.blueBorder),
                          ),
                  ])
                : const Center(
                    child: LoadingWidget(mainFontColor: AppColors.blueBorder),
                  )),
      );
    });
  }
}
