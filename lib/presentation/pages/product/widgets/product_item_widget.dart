import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/presentation/pages/Home/models/product_model.dart';
import 'package:willaengine/presentation/pages/product/product_detail_page.dart';
import 'package:willaengine/presentation/routes/app_routes.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/widgets/cached_image.dart';
import 'package:willaengine/utils/widgets/text_title_widget.dart';

import '../../../../utils/widgets/line_throught_text.dart';
import '../../../../utils/widgets/star_rating.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({super.key, required this.productParent});

  final ProductParent productParent;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          const ProductDetailPage(),
          arguments: {"id": widget.productParent.id},
          preventDuplicates: false,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 2.w,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: cachedImage(
                  widget.productParent.product!.mainImage,
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
                        TextTitleWidget(
                          title: widget.productParent!.name ?? '',
                          title2: widget.productParent.product?.productCategory?.nameEn ?? '',
                          fontSize: 9.sp,
                          subFontSize: 6.sp,
                          color: AppColors.grayTitle,
                          letterSpacing: 2,
                        ),
                        // StarRating(
                        //   rating: widget.,
                        //   onRatingChanged: (rating) => setState(() => print(rating)),
                        //   color: AppColors.lightBlue,
                        // ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LineThroughText(
                                amount: widget.productParent!.storeProductVariations!.isNotEmpty
                                    ? widget.productParent!.storeProductVariations![0].oldPrice.toString()
                                    : "",
                                disCount: '5'),
                            Text(
                              widget.productParent!.storeProductVariations!.isNotEmpty
                                  ? widget.productParent!.storeProductVariations![0].price.toString()
                                  : "",
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
