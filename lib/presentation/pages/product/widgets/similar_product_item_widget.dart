import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Home/models/product_model.dart';
import 'package:willaengine/presentation/pages/product/controller/product_detail_controller.dart';
import 'package:willaengine/presentation/pages/product/models/product_detail_model.dart';
import 'package:willaengine/presentation/pages/product/product_detail_page.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/constant/images.dart';
import 'package:willaengine/utils/widgets/cached_image.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

import '../../../../utils/widgets/line_throught_text.dart';
import '../../../../utils/widgets/star_rating.dart';

class SimilarProductItemWidget extends StatefulWidget {
  const SimilarProductItemWidget({super.key, required this.product, required this.callBack});
  final ProductDetailModel product;
  final Function callBack;

  @override
  State<SimilarProductItemWidget> createState() => _SimilarProductItemWidgetState();
}

class _SimilarProductItemWidgetState extends State<SimilarProductItemWidget> {
  // ProductDetailController detailController = Get.find<ProductDetailController>().getProductDetail(widget.product.id!);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          const ProductDetailPage(),
          arguments: {"id": widget.product.id},
          preventDuplicates: false,
        );
        // Get.find<ProductDetailController>().getProductDetail(widget.product.id!);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAlias,
        // margin: const EdgeInsets.only(
        //   left: 10,
        // ),
        // padding: const EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(15),
        //     border: Border.all(
        //       color: AppColors.borderColor,
        //     )),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: cachedImage(
                  widget.product.product!.mainImage,
                  boxFit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        TextTitleWidget(
                          title: widget.product!.name ?? '',
                          title2: "BROWN SET",
                          fontSize: 7.sp,
                          subFontSize: 5.sp,
                          color: AppColors.grayTitle,
                          letterSpacing: 2,
                        ),
                        // StarRating(
                        //   rating: 4,
                        //   onRatingChanged: (rating) => setState(() => print(rating)),
                        //   color: AppColors.greenTitle,
                        // ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LineThroughText(
                                amount: widget.product!.storeProductVariations!.isNotEmpty
                                    ? widget.product!.storeProductVariations![0].oldPrice.toString()
                                    : "",
                                disCount: '5'),
                            Text(
                              widget.product!.storeProductVariations!.isNotEmpty ? widget.product!.storeProductVariations![0].price.toString() : "",
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColors.black,
                                fontFamily: "montserrat",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
