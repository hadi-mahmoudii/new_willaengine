import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Home/models/slider_model.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/cached_image.dart';

import '../../../../utils/widgets/dot_indicator.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key, required this.sliders, required this.controller});
  final List<SliderModel> sliders;
  final CarouselController controller;

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xff707070), width: 1)),
      ),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: widget.sliders.length,
            carouselController: widget.controller,
            disableGesture: true,
            itemBuilder: (context, index, realIndex) {
              return Container(
                  height: double.infinity,
                  child: cachedImage(
                    widget.sliders[index].mainImage!,
                  ));
            },
            options: CarouselOptions(
                enlargeCenterPage: false,
                height: 20.h,
                viewportFraction: 1,
                padEnds: true,
                pauseAutoPlayOnTouch: true,
                disableCenter: true,
                autoPlay: true,
                onPageChanged: (val, _) {
                  setState(() {
                    widget.controller.jumpToPage(val);
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
                    widget.controller.previousPage();
                  },
                  icon: Icon(
                    !GlobalController.rtl.value ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
                  )),
              DotsIndicator(
                dotsCount: widget.sliders.length,
                position: _currentIndex,
                decorator: const DotsDecorator(
                  color: AppColors.defaultColor, // Inactive color
                  activeColor: Colors.black,
                ),
                mainAxisSize: MainAxisSize.max,
              ),
              IconButton(
                  onPressed: () {
                    widget.controller.nextPage();
                  },
                  icon: Icon(
                    GlobalController.rtl.value ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
