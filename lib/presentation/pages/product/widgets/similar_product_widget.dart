import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Home/models/product_model.dart';
import 'package:willaengine/presentation/pages/product/models/product_detail_model.dart';
import 'package:willaengine/presentation/pages/product/widgets/product_item_widget.dart';
import 'package:willaengine/presentation/pages/product/widgets/similar_product_item_widget.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

import '../../../../utils/widgets/dot_indicator.dart';
import '../../../../utils/widgets/star_rating.dart';

class SimilarProductWidget extends StatefulWidget {
  const SimilarProductWidget({super.key, required this.similarProducts});
  final List<ProductDetailModel> similarProducts;
  @override
  State<SimilarProductWidget> createState() => _SimilarProductWidgetState();
}

class _SimilarProductWidgetState extends State<SimilarProductWidget> {
  //controller
  CarouselController carouselController = CarouselController();
  GlobalController globalController = GlobalController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitleWidget(
            title: 'similarProduct'.tr,
            title2: "Similar Products",
            fontSize: 12.sp,
            textHeight: 0.8,
          ),
          SizedBox(
            height: 2.h,
          ),
          CarouselSlider.builder(
            itemCount: widget.similarProducts.length,
            carouselController: carouselController,
            disableGesture: true,
            itemBuilder: (context, index, realIndex) {
              return SimilarProductItemWidget(
                product: widget.similarProducts[index],
                callBack: () {},
              );
            },
            options: CarouselOptions(
                enlargeCenterPage: false,
                // height: 37.h,
                aspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.2),
                reverse: true,
                viewportFraction: 0.5,
                padEnds: false,
                pauseAutoPlayOnTouch: true,
                disableCenter: false,
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
                  !GlobalController.rtl.value ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
                ),
              ),
              DotsIndicator(
                dotsCount: widget.similarProducts.length,
                position: _currentIndex,
                decorator: const DotsDecorator(
                  color: AppColors.defaultColor, // Inactive color
                  activeColor: Colors.black,
                ),
                mainAxisSize: MainAxisSize.max,
              ),
              IconButton(
                onPressed: () {
                  carouselController.nextPage();
                },
                icon: Icon(
                  GlobalController.rtl.value ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
