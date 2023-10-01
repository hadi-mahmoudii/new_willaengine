import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/blog/blog_detail_page.dart';
import 'package:willaengine/presentation/pages/blog/model/blog_model.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/widgets/cached_image.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/images.dart';

class BlogItemWidget extends StatelessWidget {
  const BlogItemWidget({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.blogDetail,
        arguments: {"id": article.id},
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        // height: 18.h,
        decoration: BoxDecoration(border: Border.all(color: AppColors.defaultBackground, width: 2), borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: cachedImage(
                    article.mainImage,
                  ),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(),
                      Text(
                        article.abstract ?? '',
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.message,
                            size: 20,
                            color: AppColors.greenTitle,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            article.commentsCount.toString(),
                            style: TextStyle(
                              color: AppColors.greenTitle,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                            child: const Icon(
                              Icons.share_rounded,
                              color: Colors.black,
                              size: 11,
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.brownTitle,
                            ),
                            child: const Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.white,
                              size: 11,
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            article.likesCount.toString(),
                            style: TextStyle(
                              color: AppColors.brownTitle,
                              fontSize: 8.sp,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
