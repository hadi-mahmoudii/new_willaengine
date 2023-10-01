import 'package:flutter/material.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';

import '../../../utils/constant/color.dart';

class ProductTechnicalPage extends StatelessWidget {
  const ProductTechnicalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: GlobalHeaderWidget(
        title: "مشخصات محصول",
        title2: "PRODUCT SPECIFICATION",
      ),
    );
  }
}
