import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constant/color.dart';

class LineThroughText extends StatelessWidget {
  const LineThroughText({Key? key, required this.amount, required this.disCount, this.titleFontSize, this.disCountSize}) : super(key: key);

  final String amount;
  final String disCount;
  final double? titleFontSize;
  final double? disCountSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        Text(
          amount,
          style: TextStyle(
            color: AppColors.brownTitle,
            fontFamily: "montserrat",
            decoration: TextDecoration.lineThrough,
            fontSize: titleFontSize ?? 9.sp,
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        disCount != ""
            ? Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: AppColors.brownTitle,
                ),
                child: Text(
                  '${disCount}%',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "montserrat",
                    fontSize: disCountSize ?? 7.sp,
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
