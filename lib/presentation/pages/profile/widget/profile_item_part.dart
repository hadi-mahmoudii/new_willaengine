import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

class ProfileItemPart extends StatelessWidget {
  const ProfileItemPart({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onPressed,
    this.isCream = false,
    this.getBorder = true,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String icon;
  final bool getBorder;
  final bool isCream;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
            border: Border(
              top: getBorder
                  ? BorderSide(
                      color: AppColors.brownTitle,
                    )
                  : BorderSide.none,
              bottom: getBorder
                  ? BorderSide(
                      color: AppColors.brownTitle,
                    )
                  : BorderSide.none,
            ),
            color: isCream ? AppColors.defaulHeader : AppColors.greenHeader),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: isCream ? AppColors.brownTitle : AppColors.greenTitle,
            ),
            SizedBox(
              width: 2.w,
            ),
            TextTitleWidget(
              title: title,
              title2: subTitle,
              titleColor: isCream ? AppColors.brownTitle : AppColors.greenTitle,
              color: isCream ? AppColors.brownTitle : AppColors.greenTitle,
            ),
            const Spacer(),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(
                !GlobalController.rtl.value ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
              ),
              color: isCream ? AppColors.brownTitle : AppColors.greenTitle,
              iconSize: 20.sp,
            )
          ],
        ),
      ),
    );
  }
}
