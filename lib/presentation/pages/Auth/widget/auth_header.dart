import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/utils/constant/color.dart';

class AuthHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String title2;
  final bool halfSize;

  const AuthHeader({Key? key, required this.title, required this.title2, this.halfSize = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: AppColors.defaulHeader,
            border: Border(
                bottom: BorderSide(
              color: AppColors.brownTitle,
              width: 1.5,
            ))
            // gradient: LinearGradient(
            //   colors: [Color(0xFFc5c5c5), Color(0xFFe3e3e3)],
            //   begin: FractionalOffset(0.0, 0.0),
            //   end: FractionalOffset(0.0, 1.0),
            //   stops: [0.0, 1.0],
            //   // tileMode: TileMode.repeated,
            // ),
            ),
        child: LayoutBuilder(
          builder: (p0, constrains) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                mainAxisAlignment: !halfSize ? MainAxisAlignment.center : MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.brownTitle,
                      // color: Color(0xffA23277),
                      fontSize: !halfSize ? constrains.maxWidth * 0.10 : constrains.maxWidth * 0.09,
                      letterSpacing: 5,
                      fontFamily: "montserrat",
                    ),
                  ),
                  Text(
                    title2,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.brownTitle,
                      fontSize: !halfSize ? constrains.maxWidth * 0.10 : constrains.maxWidth * 0.09,
                      letterSpacing: 5,
                      fontFamily: "montserrat",
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            );
          },
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(!halfSize ? Get.height / 3.5 : Get.height / 5);
}
