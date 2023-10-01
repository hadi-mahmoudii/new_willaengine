import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/blog/blog_detail_page.dart';
import 'package:willaengine/presentation/pages/blog/model/blog_model.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/cached_image.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

import '../../../../utils/widgets/dot_indicator.dart';

class NewsHomeWidget extends StatefulWidget {
  const NewsHomeWidget({
    super.key,
    required this.articles,
    required this.title,
    required this.subTitle,
  });

  final List<Article> articles;
  final String title;
  final String subTitle;

  @override
  State<NewsHomeWidget> createState() => _NewsHomeWidgetState();
}

class _NewsHomeWidgetState extends State<NewsHomeWidget> {
  int _currentIndex = 0;
  CarouselController carouselController = CarouselController();
  GlobalController globalController = GlobalController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 3.h, bottom: 40),
      decoration: const BoxDecoration(
          // border: Border(bottom: BorderSide(color: Color(0xff707070), width: 1)),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitleWidget(
            title: widget.title,
            title2: widget.subTitle,
            textHeight: 0.8,
            fontSize: 12.sp,
            titleColor: AppColors.greenTitle,
            color: AppColors.greenTitle,
            // letterSpacing: 3,
          ),
          SizedBox(
            height: 2.h,
          ),
          CarouselSlider.builder(
            itemCount: widget.articles.length,
            carouselController: carouselController,
            disableGesture: true,
            itemBuilder: (context, index, realIndex) {
              Article currentArticle = widget.articles[index];
              return GestureDetector(
                onTap: () {
                  Logger().e(widget.articles[index].id);
                  Get.to(
                    BlogDetailPage(),
                    arguments: {"id": widget.articles[index].id},
                    preventDuplicates: false,
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.borderColor, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  clipBehavior: Clip.antiAlias,
                  // margin: const EdgeInsets.only(left: 10),
                  // alignment: Alignment.center,
                  // padding: EdgeInsets.only(bottom: 1.h),
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: AppColors.borderColor),
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(15),
                  //   border: Border.all(color: AppColors.borderColor),
                  // ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: cachedImage(
                              currentArticle.mainImage,
                              boxFit: BoxFit.fill,
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentArticle.title!,
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Expanded(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      currentArticle.abstract ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      maxLines: 4,
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
                enlargeCenterPage: false,
                // height: 37.h,
                aspectRatio: 1.3,
                viewportFraction: 0.5,
                padEnds: false,
                pauseAutoPlayOnTouch: true,
                disableCenter: false,
                reverse: true,
                autoPlay: true,
                onPageChanged: (val, _) {
                  setState(() {
                    carouselController.jumpToPage(val);
                    _currentIndex = val;
                  });
                }),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    carouselController.previousPage();
                  },
                  icon: Icon(
                    GlobalController.rtl.value ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                  )),
              SizedBox(
                width: 20.w,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DotsIndicator(
                    dotsCount: widget.articles.length > 1 ? widget.articles.length : 1,
                    position: _currentIndex,
                    decorator: const DotsDecorator(
                      color: AppColors.grey3, // Inactive color
                      activeColor: Colors.black,
                    ),
                    mainAxisSize: MainAxisSize.min,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    carouselController.nextPage();
                  },
                  icon: Icon(
                    !GlobalController.rtl.value ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
