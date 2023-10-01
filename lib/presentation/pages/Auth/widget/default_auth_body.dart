import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willaengine/presentation/pages/Auth/widget/auth_header.dart';
import 'package:willaengine/presentation/pages/Auth/widget/subject_widget.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/sizes.dart';

class DefaultAuthBody extends StatelessWidget {
  DefaultAuthBody({
    super.key,
    required this.backText,
    required this.subjectTitle,
    required this.subjectSubtitle,
    required this.headerTitle,
    required this.headerSub,
    this.children = const [],
  });
  final String backText, subjectTitle, subjectSubtitle, headerTitle, headerSub;

  List<Widget>? children;
  List<Widget>? _myMethod() => children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthHeader(title: headerTitle, title2: headerSub),
      body: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: heightBlockSize * 3, horizontal: 22),
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.defaultColor,
                  size: 13,
                ),
                Text(
                  backText,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            SizedBox(
              height: heightBlockSize * 2,
            ),
            SubjectWidget(
              title: subjectTitle,
              subtitle: subjectSubtitle,
            ),
            SizedBox(
              height: heightBlockSize * 2,
            ),
            ..._myMethod()!,
          ],
        ),
      ),
    );
  }
}
