import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Home/models/categories_model.dart';
import 'package:willaengine/presentation/pages/product/models/category_model.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/widgets/cached_image.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

class CategoriesHomeWidget extends StatelessWidget {
  const CategoriesHomeWidget({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3.h,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.divider, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitleWidget(
            title: 'categories'.tr,
            title2: "Categories",
            textHeight: 0.8,
            titleColor: AppColors.greenTitle,
            color: AppColors.greenTitle,
            fontSize: 12.sp,
          ),
          SizedBox(
            height: 2.h,
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 3.8),
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
            ),
            itemCount: 4,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => Get.toNamed(
                  Routes.productList,
                  arguments: {"id": categories[index].id},
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.defaultBackground,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 6.w),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: cachedImage(
                            categories[index].mainImage,
                          )),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                          flex: 2,
                          child: TextTitleWidget(
                            title: categories[index].name ?? '',
                            title2: categories[index].nameEn ?? '',
                            fontSize: 10.sp,
                            subFontSize: 8.sp,
                          )),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
