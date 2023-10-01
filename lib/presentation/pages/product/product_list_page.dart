import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:willaengine/presentation/pages/product/controller/product_controller.dart';
import 'package:willaengine/presentation/pages/product/widgets/product_item_widget.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';

import '../../../utils/widgets/global_header_widget.dart';

class ProductListPage extends StatefulWidget {
  ProductListPage({
    super.key,
    this.title,
    this.subtitle,
  });
  final String? title;
  final String? subtitle;
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  var controller = Get.put(ProductController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final argument = ModalRoute.of(context)!.settings.arguments as Map;
      int id = argument["id"];
      controller.getCategoryProducts(id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalHeaderWidget(
        title: widget.title ?? 'home'.tr,
        title2: widget.subtitle ?? 'SWEET HOME',
        gotBackIcon: true,
      ),
      body: GetX<ProductController>(builder: (controller) {
        print(controller.products.length);
        return !controller.loading.value
            ? Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: controller.products.isNotEmpty
                    ? GridView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.2),
                          mainAxisSpacing: 10,
                        ),
                        itemCount: controller.products.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductItemWidget(
                            productParent: controller.products[index],
                          );
                        },
                      )
                    : const Center(
                        child: Text("list is empty"),
                      ),
              )
            : const Center(
                child: LoadingWidget(mainFontColor: AppColors.blueBorder),
              );
      }),
    );
  }
}
