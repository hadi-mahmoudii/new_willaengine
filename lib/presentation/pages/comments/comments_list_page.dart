import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Auth/widget/long_button.dart';
import 'package:willaengine/presentation/pages/comments/widgets/comment_item_widget.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

class CommentListPage extends StatelessWidget {
  const CommentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const GlobalHeaderWidget(title: "", title2: ""),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          errorDialog(context);
        },
        backgroundColor: AppColors.lightBlue,
        elevation: 10,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return CommentItemWidget();
          },
        ),
      ),
    );
  }
}

Future errorDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(0),

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
          child: Container(
            height: 50.h,
            width: 90.w,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextTitleWidget(
                      title: "نظر شما",
                      title2: "YOUR COMMENT",
                      fontSize: 14.sp,
                      color: Colors.blue,
                      titleColor: Colors.black,
                    ),
                    SvgPicture.asset(AppIcons.add)
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.comment,
                      height: 17,
                      width: 17,
                      color: AppColors.grey3,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text("متن کامنت")
                  ],
                ),
                Expanded(
                    child: TextFormField(
                  minLines: 4,
                      maxLines: 6,
                )),
                LongButton(
                  text: "ثبت کامنت",
                  color: AppColors.blueBorder,
                  callBack: () {},
                )
              ],
            ),
          ),
        );
      });
}
