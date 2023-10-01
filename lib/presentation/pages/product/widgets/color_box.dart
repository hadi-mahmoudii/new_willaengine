import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.purple),
      child: Row(children: [
        CircleAvatar(
          radius: 7,
          backgroundColor: Colors.white,
        ),
        SizedBox(width: 3.w),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 10.sp),
        )
      ]),
    );
  }
}
