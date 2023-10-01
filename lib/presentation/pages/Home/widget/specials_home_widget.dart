import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Home/models/product_model.dart';
import 'package:willaengine/presentation/pages/product/widgets/product_item_widget.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

import '../../../../utils/widgets/dot_indicator.dart';
import '../../../../utils/widgets/star_rating.dart';

class SpecialsHomeWidget extends StatefulWidget {
  const SpecialsHomeWidget({super.key, required this.specialProducts});
  final List<ProductParent> specialProducts;

  @override
  State<SpecialsHomeWidget> createState() => _SpecialsHomeWidgetState();
}

class _SpecialsHomeWidgetState extends State<SpecialsHomeWidget> {
  //controllers
  CarouselController carouselController = CarouselController();
  GlobalController globalController = GlobalController();

  //var
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: AppColors.divider,
          width: 1,
        )),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitleWidget(
            title: 'specials'.tr,
            title2: "Specials",
            titleColor: AppColors.greenTitle,
            color: AppColors.greenTitle,
            textHeight: 0.8,
            fontSize: 12.sp,
          ),
          SizedBox(
            height: 2.h,
          ),
          CarouselSlider.builder(
            itemCount: widget.specialProducts.length,
            carouselController: carouselController,
            disableGesture: true,
            itemBuilder: (context, index, realIndex) {
              return ProductItemWidget(
                productParent: widget.specialProducts[index],
              );
            },
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 2,
            //   childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.2),
            //   mainAxisSpacing: 10,
            // ),

            options: CarouselOptions(
                enlargeCenterPage: false,
                // height: 37.h,
                aspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.2),
                viewportFraction: 0.5,
                reverse: true,
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
                    GlobalController.rtl.value ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                  )),
              DotsIndicator(
                dotsCount: 5,
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
                    !GlobalController.rtl.value ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
