import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/utils/constant/color.dart';

class SubjectWidget extends StatelessWidget {
  const SubjectWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.closeHeight = false,
  });
  final String title;
  final String subtitle;
  final bool closeHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.greenTitle,
              height: closeHeight! ? 0.4 : 1,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 8,
              wordSpacing: 2,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
              color: AppColors.greenTitle,
              fontFamily: "montserrat",
            ),
          )
        ],
      ),
    );
  }
}
