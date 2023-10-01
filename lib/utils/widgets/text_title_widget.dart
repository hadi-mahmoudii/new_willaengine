import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/utils/constant/color.dart';

class TextTitleWidget extends StatelessWidget {
  const TextTitleWidget({
    super.key,
    required this.title,
    required this.title2,
    this.color,
    this.titleColor,
    this.fontSize,
    this.subFontSize,
    this.letterSpacing,
    this.textHeight,
    this.mainAxisAlignment,
    this.isBrown = false,
  });

  final String title;
  final String title2;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final double? subFontSize;
  final double? letterSpacing;
  final double? textHeight;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? isBrown;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          style: TextStyle(
            fontSize: fontSize ?? 10.sp,
            color: isBrown! ? AppColors.brownTitle : titleColor,
            fontWeight: FontWeight.w400,
            height: textHeight,
          ),
        ),
        Text(
          title2,
          maxLines: 1,
          style: TextStyle(
            fontSize: subFontSize ?? 7.sp,
            letterSpacing: letterSpacing ?? 3,
            fontFamily: "montserrat",
            color: isBrown! ? AppColors.brownTitle : color,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
