import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/gen/assets.gen.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

class GlobalHeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String title2;
  final bool gotBackIcon;
  final String? backRoute;
  final bool? gotSerach;
  final bool? gotLike;

  const GlobalHeaderWidget({
    Key? key,
    required this.title,
    required this.title2,
    this.gotBackIcon = false,
    this.backRoute,
    this.gotSerach = true,
    this.gotLike = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.h,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2.h),
      // padding: EdgeInsets.only(right: 15, left: 15, top: 15),
      decoration: BoxDecoration(
          color: AppColors.defaulHeader,
          border: Border(
              bottom: BorderSide(
            color: AppColors.divider,
            width: 1,
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              gotBackIcon
                  ? InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.brownTitle,
                        size: 20.sp,
                      ))
                  : Image.asset(
                      Assets.images.homeIcon.path,
                      alignment: Alignment.center,
                      height: 4.h,
                      fit: BoxFit.fitHeight,
                      color: AppColors.brownTitle,
                    ),
              SizedBox(
                width: 2.w,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: TextTitleWidget(
                  title: title,
                  title2: title2,
                  isBrown: true,
                  textHeight: 1,
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              )
            ],
          ),
          Row(
            children: [
              gotSerach! && !gotLike!
                  ? IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.search,
                        color: AppColors.brownTitle,
                      ),
                      iconSize: 40,
                    )
                  : SizedBox(),
              gotLike! && !gotSerach!
                  ? IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.heart,
                        color: AppColors.brownTitle,
                      ),
                      iconSize: 30,
                    )
                  : SizedBox(),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(11.h);
}
