import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Auth/widget/long_button.dart';
import 'package:willaengine/presentation/pages/shop/choose_address_page.dart';
import 'package:willaengine/presentation/pages/shop/controller/shop_controller.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/cached_image.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';
import 'package:willaengine/utils/widgets/line_throught_text.dart';
import 'package:willaengine/utils/widgets/loading_widget.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

class ShopMainPage extends StatefulWidget {
  const ShopMainPage({Key? key}) : super(key: key);

  @override
  State<ShopMainPage> createState() => _ShopMainPageState();
}

class _ShopMainPageState extends State<ShopMainPage> {
  final controller = Get.put(ShopController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getShopCards();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const GlobalHeaderWidget(title: 'سبد خرید من', title2: 'MY CART'),
      body: GetX<ShopController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: (controller.loading.value ||
                  controller.shopCardModel.value == null)
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingWidget(mainFontColor: AppColors.blueBorder),
                  ],
                )
              : ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.shopCardModel.value?.data
                            ?.shoppingCartItems?.length,
                        itemBuilder: (context, index) {
                          int quantity = controller.shopCardModel.value!.data!
                                  .shoppingCartItems![index].quantity ??
                              0;
                          return Container(
                            height: 11.h,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: cachedImage(
                                            controller
                                                .shopCardModel
                                                .value
                                                ?.data!
                                                .shoppingCartItems?[index]
                                                .storeProductVariation
                                                ?.storeProduct
                                                ?.product
                                                ?.mainImage,
                                            boxFit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: TextTitleWidget(
                                            title: controller
                                                    .shopCardModel
                                                    .value
                                                    ?.data!
                                                    .shoppingCartItems?[index]
                                                    .storeProductVariation
                                                    ?.storeProduct
                                                    ?.product
                                                    ?.name ??
                                                '',
                                            title2: controller
                                                    .shopCardModel
                                                    .value
                                                    ?.data!
                                                    .shoppingCartItems?[index]
                                                    .storeProductVariation
                                                    ?.storeProduct
                                                    ?.product
                                                    ?.nameEn ??
                                                '',
                                            fontSize: 6.sp,
                                            subFontSize: 5.sp,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          quantity--;
                                          controller.changeQuantity(
                                              controller
                                                  .shopCardModel
                                                  .value!
                                                  .data!
                                                  .shoppingCartItems![index]
                                                  .id!,
                                              quantity);
                                        },
                                        padding: EdgeInsets.all(0),
                                      ),
                                      Text(
                                        quantity.toString(),
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          quantity++;
                                          controller.changeQuantity(
                                              controller
                                                  .shopCardModel
                                                  .value!
                                                  .data!
                                                  .shoppingCartItems![index]
                                                  .id!,
                                              quantity);
                                        },
                                        padding: EdgeInsets.all(0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          LineThroughText(
                                              amount: controller
                                                      .shopCardModel
                                                      .value
                                                      ?.data!
                                                      .shoppingCartItems?[index]
                                                      .storeProductVariation
                                                      ?.price
                                                      .toString() ??
                                                  '',
                                              disCount: '5',
                                              titleFontSize: 8.sp,
                                              disCountSize: 5.sp),
                                          Text(
                                            controller
                                                    .shopCardModel
                                                    .value
                                                    ?.data
                                                    ?.shoppingCartItems?[index]
                                                    .storeProductVariation
                                                    ?.oldPrice
                                                    .toString() ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 8.sp,
                                              fontFamily: "montserrat",
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.deleteCard(controller
                                              .shopCardModel
                                              .value!
                                              .data!
                                              .shoppingCartItems![index]
                                              .id!);
                                        },
                                        child: SvgPicture.asset(
                                          AppIcons.close,
                                          height: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              controller.shopCardModel.value!.data!
                                  .shoppingCartItems!.length
                                  .toString(),
                              style: TextStyle(fontSize: 24.sp),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "آیتم در سبد \nخرید شما",
                              style: TextStyle(fontSize: 7.sp),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                LineThroughText(
                                  amount: controller
                                          .shopCardModel.value?.data?.price ??
                                      '',
                                  disCount: "",
                                  titleFontSize: 12.sp,
                                  disCountSize: 8.sp,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    LongButton(
                        text: 'تکمیل خرید؟ انتخاب آدرس',
                        callBack: () => Get.to(ChooseAddressPage())),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 60.w,
                        padding: EdgeInsets.only(top: 15, bottom: 50),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: AppColors.blueBorder))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              !GlobalController.rtl.value
                                  ? Icons.keyboard_arrow_left_rounded
                                  : Icons.keyboard_arrow_right_rounded,
                              color: AppColors.grey3,
                            ),
                            Text("میخواهم خرید را ادامه دهم. بازگشت")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        );
      }),
    );
  }
}
