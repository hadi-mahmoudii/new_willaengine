import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/widgets/form/models/text_input_model.dart';
import 'package:willaengine/utils/widgets/form/text_input_widget.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';

class SearchMainPage extends StatelessWidget {
  const SearchMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalHeaderWidget(
        title: 'productsSearch'.tr,
        title2: 'SEARCH IN PRODUCTS',
        gotSerach: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: globalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextInputWidget(
                          model: TextInputModel(
                              name: 'password',
                              title: 'insertSearch'.tr,
                              icon: Icons.search,
                              callBack: (value) {
                                Logger().d(value);
                              }))),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.greenTitle,
                    ),
                    child: Icon(
                      Icons.search,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "categories".tr,
              )
            ],
          ),
        ),
      ),
    );
  }
}
