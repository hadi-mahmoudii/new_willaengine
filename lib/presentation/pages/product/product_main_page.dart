import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/product/controller/category_controller.dart';
import 'package:willaengine/presentation/pages/product/product_list_page.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/cached_image.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

class ProductMainPage extends StatefulWidget {
  const ProductMainPage({super.key});

  @override
  State<ProductMainPage> createState() => _ProductMainPageState();
}

class _ProductMainPageState extends State<ProductMainPage> {
  @override
  void initState() {
    Get.put(CategoryController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalHeaderWidget(
        title: "categories".tr,
        title2: 'CATEGORIES',
        gotSerach: false,
      ),
      body: GetX<CategoryController>(builder: (controller) {
        return !controller.loading.value
            ? ListView.builder(
                itemCount: controller.categories.length,
                padding: globalPadding,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => Get.to(
                      ProductListPage(
                        title: controller.categories[index].name,
                        subtitle: controller.categories[index].nameEn,
                      ),
                      arguments: {
                        "id": controller.categories[index].id,
                      },
                    ),
                    child: Container(
                      height: 10.h,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.borderColor))),
                      child: Row(
                        children: [
                          SizedBox(child: cachedImage(controller.categories[index].mainImage)),
                          SizedBox(
                            width: 2.w,
                          ),
                          TextTitleWidget(
                            title: controller.categories[index].name ?? '',
                            title2: controller.categories[index].nameEn ?? '',
                            fontSize: 12.sp,
                            subFontSize: 8.sp,
                          ),
                          const Spacer(),
                          // Container(
                          //   padding: const EdgeInsets.all(5),
                          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: AppColors.defaultBackground),
                          //   child: Column(
                          //     children:  [
                          //       Text(
                          //         controller.categories[index].childrenCount.toString(),
                          //       ),
                          //       Text(
                          //         'آیتم',
                          //         style: TextStyle(fontSize: 8.sp),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          Icon(
                            !GlobalController.rtl.value ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),
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
