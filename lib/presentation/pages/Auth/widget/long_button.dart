import 'package:flutter/material.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    super.key,
    this.color,
    this.loading,
    required this.text,
    required this.callBack,
  });

  final Color? color;
  final String text;
  final Function() callBack;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all(color: color ?? AppColors.defaultColor), borderRadius: BorderRadius.circular(10)),
        child: loading ?? false
            ? const LoadingWidget(mainFontColor: AppColors.blueBorder)
            : Text(
                text,
                style: TextStyle(fontSize: 12, color: color ?? AppColors.black),
              ),
      ),
    );
  }
}
