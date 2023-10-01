import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/product/controller/product_detail_controller.dart';
import 'package:willaengine/presentation/pages/product/widgets/color_box.dart';
import 'package:willaengine/presentation/pages/product/widgets/similar_product_widget.dart';
import 'package:willaengine/presentation/pages/product/widgets/tools_line_widget.dart';
import 'package:willaengine/presentation/pages/shop/controller/shop_controller.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/constant/sizes.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/cached_image.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';
import 'package:willaengine/utils/widgets/star_rating.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

import '../../../utils/widgets/dot_indicator.dart';
import '../../../utils/widgets/global_header_widget.dart';
import '../../../utils/widgets/line_throught_text.dart';
import '../Home/widget/specials_home_widget.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int? id;
  int _currentIndex = 0;
  int? currentVariantId;

  // CONTROLLER
  ProductDetailController productDetailController = ProductDetailController();
  ShopController shopController = ShopController();

  //
  ValueNotifier addedNotifier = ValueNotifier(false);

  onResume(int id) {
    productDetailController.getProductDetail(id);
  }

  @override
  void initState() {
    var argument = Get.arguments as Map;
    id = argument['id'];
    Get.put(ProductDetailController(), tag: id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Obx(
        () => InkWell(
          onTap: () async {
            if (!shopController.addLoading.value) {
              addedNotifier.value = await shopController.addShoppingCard(
                    currentVariantId!,
                    context,
                  ) ??
                  false;
            }
          },
          child: Row(
            textDirection: GlobalController.rtl.value ? TextDirection.ltr : TextDirection.rtl,
            children: [
              // SizedBox(
              //   width: 5.w,
              // ),
              Container(
                height: 7.h,
                width: 7.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, //New
                        blurRadius: 25.0,
                        offset: Offset(0, 5))
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.bag,
                      color: AppColors.black,
                    ),
                    // Positioned.directional(
                    //     start: 10,
                    //     top: 12,
                    //     textDirection: GlobalController.rtl.value ? TextDirection.ltr : TextDirection.rtl,
                    //     child: CircleAvatar(
                    //       backgroundColor: AppColors.greenTitle,
                    //       radius: 8,
                    //       child: Center(
                    //           child: Text(
                    //         '2',
                    //         style: TextStyle(
                    //           fontSize: 11,
                    //           color: Colors.white,
                    //         ),
                    //       )),
                    //     ))
                  ],
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: Container(
                    height: 7.h,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey, //New
                            blurRadius: 25.0,
                            offset: Offset(0, 5))
                      ],
                    ),
                    child: shopController.addLoading.value
                        ? Container(
                            height: 5.h,
                            child: LoadingWidget(mainFontColor: AppColors.blueBorder),
                          )
                        : ValueListenableBuilder(
                            valueListenable: addedNotifier,
                            builder: (context, value, child) => Row(
                              children: [
                                Icon(
                                  value ? Icons.check_circle : Icons.add,
                                  color: value ? Colors.green : AppColors.brownTitle,
                                  size: 24.sp,
                                  opticalSize: 1,
                                  weight: 0.5,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextTitleWidget(
                                  title: value ? "addToCardSuccesful".tr : "addToCard".tr,
                                  title2: "Add To Shopping Card",
                                  letterSpacing: 0.8,
                                ),
                                // TextTitleWidget( "addToCard".tr, title2: "Add To Shopping Card",),
                              ],
                            ),
                          )),
              ),
              SizedBox(
                width: 6.w,
              ),
            ],
          ),
        ),
      ),
      appBar: GlobalHeaderWidget(
        title: 'productDetails'.tr,
        title2: 'Product Details',
        gotBackIcon: true,
      ),
      body: GetX<ProductDetailController>(
          tag: id.toString(),
          builder: (controller) {
            return !controller.loading.value
                ? ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 54.h,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: CarouselSlider.builder(
                                        itemCount: 5,
                                        // carouselController: widget.controller,
                                        disableGesture: true,
                                        itemBuilder: (context, index, realIndex) {
                                          currentVariantId = controller.product!.storeProductVariations?[0].id ?? 0;
                                          return Container(
                                              padding: const EdgeInsets.all(25),
                                              child: cachedImage(
                                                controller.product!.product!.mainImage!,
                                                boxFit: BoxFit.contain,
                                              ));
                                        },
                                        options: CarouselOptions(
                                            enlargeCenterPage: false,
                                            // height: 37.h,
                                            aspectRatio: 1,
                                            viewportFraction: 1,
                                            padEnds: false,
                                            pauseAutoPlayOnTouch: true,
                                            disableCenter: false,
                                            autoPlay: false,
                                            onPageChanged: (val, _) {
                                              setState(() {
                                                // widget.controller.jumpToPage(val);
                                                _currentIndex = val;
                                              });
                                            }),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 2.h,
                                    // ),
                                    // Expanded(
                                    //   flex: 1,
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       IconButton(
                                    //           onPressed: () {
                                    //             // widget.controller.previousPage();
                                    //           },
                                    //           icon: const Icon(Icons.keyboard_arrow_right)),
                                    //       DotsIndicator(
                                    //         mainAxisAlignment: MainAxisAlignment.center,
                                    //         dotsCount: controller.product!.storeProductVariations!.isNotEmpty
                                    //             ? controller.product!.storeProductVariations!.length
                                    //             : 1,
                                    //         position: _currentIndex,
                                    //         decorator: const DotsDecorator(
                                    //           color: AppColors.defaultColor, // Inactive color
                                    //           activeColor: Colors.black,
                                    //         ),
                                    //         mainAxisSize: MainAxisSize.min,
                                    //       ),
                                    //       IconButton(
                                    //           onPressed: () {
                                    //             // widget.controller.nextPage();
                                    //           },
                                    //           icon: const Icon(Icons.keyboard_arrow_left))
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextTitleWidget(
                                      title: controller.product!.product!.name!,
                                      title2: controller.product!.product!.productCategory!.nameEn ?? '',
                                      fontSize: 12.sp,
                                    ),
                                    // StarRating(
                                    //   onRatingChanged: (rate) {},
                                    //   color: AppColors.greenTitle,
                                    //   starSize: 20,
                                    // ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Html(
                                      data: controller.product?.product?.description,
                                      shrinkWrap: true,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    controller.product!.storeProductVariations!.isNotEmpty
                                        ? SingleChildScrollView(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'رنگ',
                                                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                                                      ),
                                                      Text(
                                                        "color",
                                                        style: TextStyle(fontSize: 10.sp),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const VerticalDivider(color: Colors.black),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                // const Divider(color: Colors.black),
                                                Expanded(
                                                  flex: 4,
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: controller.product!.storeProductVariations!.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return const ColorBox(title: 'بنفش');
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            LineThroughText(
                                                amount: controller.currentVariant.value?.oldPrice.toString() ?? '',
                                                disCount: '5',
                                                titleFontSize: 9.sp,
                                                disCountSize: 7.sp),
                                            Text(
                                              controller.currentVariant.value?.price.toString() ?? '',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                                fontFamily: "montserrat",
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ToolsLineWidget(
                            id: controller.product!.id!,
                            relType: "store_product",
                            icon: AppIcons.comments,
                            goToPath: Routes.comments,
                            title: "نظرات کاربران",
                            subTitle: "COMMENT",
                            backgroundColor: AppColors.defaulHeader,
                            textColor: AppColors.brownTitle,
                            gotAmount: true,
                            amount: '120',
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ToolsLineWidget(
                            id: controller.product!.id!,
                            relType: "store_product",
                            icon: AppIcons.details,
                            goToPath: Routes.technicalDetail,
                            title: "مشخصات فنی",
                            subTitle: "TECHNICAL",
                            backgroundColor: AppColors.greenHeader,
                            textColor: AppColors.greenTitle,
                            amount: '120',
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          !controller.similarLoading.value
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: SimilarProductWidget(
                                    similarProducts: controller.similarProduct,
                                  ),
                                )
                              : const Center(
                                  child: LoadingWidget(
                                    mainFontColor: AppColors.blueBorder,
                                  ),
                                ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ],
                  )
                : const Center(
                    child: LoadingWidget(
                      mainFontColor: AppColors.blueBorder,
                    ),
                  );
          }),
    );
  }
}
