import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/controller/global_controller.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/widgets/text_title_widget.dart';
import '../../comments/comments_list_page.dart';

class ToolsLineWidget extends StatefulWidget {
  ToolsLineWidget(
      {Key? key,
      required this.id,
      required this.relType,
      required this.icon,
      required this.title,
      required this.subTitle,
      required this.goToPath,
      this.amount,
      this.gotAmount = false,
      required this.backgroundColor,
      required this.textColor})
      : super(key: key);

  final String icon, title, subTitle;
  String? amount = '';
  bool gotAmount;
  final Color backgroundColor;
  final Color textColor;
  final String goToPath;
  final int id;
  final String relType;

  @override
  State<ToolsLineWidget> createState() => _ToolsLineWidgetState();
}

class _ToolsLineWidgetState extends State<ToolsLineWidget> {
  GlobalController globalController = GlobalController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(widget.goToPath, arguments: {
        "id": widget.id,
        "relType": widget.relType,
      }),
      child: Container(
        height: 10.h,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        color: widget.backgroundColor,
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.comments,
              height: 25,
              width: 25,
              color: widget.textColor,
            ),
            SizedBox(
              width: 2.w,
            ),
            TextTitleWidget(
              title: widget.title,
              title2: widget.subTitle,
              color: widget.textColor,
              titleColor: widget.textColor,
            ),
            const Spacer(),
            widget.gotAmount
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.amount ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "montserrat",
                          color: AppColors.brownTitle,
                        ),
                      ),
                      Text(
                        'نظر',
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: AppColors.brownTitle,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              GlobalController.rtl.value ? AppIcons.leftArrow : AppIcons.rightArrow,
              height: 20,
              width: 20,
              color: widget.textColor,
            )
          ],
        ),
      ),
    );
  }
}
