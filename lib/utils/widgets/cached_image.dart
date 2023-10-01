// ignore_for_file: missing_return

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:willaengine/utils/constant/color.dart';

Widget cachedImage(url,
    {double? height,
    double? width,
    bool showLoading = true,
    bool hasBackgroundColor = true,
    bool cache = true,
    boxFit}) {
  return ExtendedImage.network(
    url,
    cache: cache,
    fit:boxFit?? BoxFit.fill,
    gaplessPlayback: true,
    height: height,
    width: width,
    loadStateChanged: (ExtendedImageState state) {
      switch (state.extendedImageLoadState) {
        case LoadState.loading:
          // _controller.reset();

          return Container(
            padding: const EdgeInsets.only(top : 40),
            alignment: Alignment.center,
            child: showLoading
                ?  const Center(
                  child: SpinKitThreeBounce(
                      color: AppColors.blueBorder,
                      size: 25.0,
                    ),
                )
                : Container(),
          );
        case LoadState.failed:
          // _controller.reset();
          //remove memory cached
          state.imageProvider.evict();
          return GestureDetector(
            child: Container(
              child: const Center(
                  child: Icon(
                Icons.error_outline,
                color: AppColors.blueBorder,
              )),
            ),
            onTap: () {
              state.reLoadImage();
            },
          );
        case LoadState.completed:
          // TODO: Handle this case.
          break;
      }
    },
  );
}

// Widget cachedImage(url,{double height,double width}) {
//   return CachedNetworkImage(
//     fit: BoxFit.cover,
//     height: height,
//     width: width,
//     imageUrl: url,
//     placeholder: (context, url) => LoadingImage(),
//     errorWidget: (context, url, error) => Icon(Icons.error),
//   );
// }

// child: ExtendedImage.network(
// socialPost.image,
// width: screenWidth,
// height: screenWidth,
// fit: BoxFit.fill,
// enableSlideOutPage: true,
// mode: ExtendedImageMode.gesture,
// extendedImageGestureKey: gestureKey,
// initGestureConfigHandler: (ExtendedImageState state) {
// return GestureConfig(
// minScale: 1,
// animationMinScale: 0.7,
// maxScale: 2.0,
// animationMaxScale: 4.5,
// speed: 1.0,
// inertialSpeed: 100.0,
// initialScale: 1.0,
// inPageView: false,
// initialAlignment: InitialAlignment.center,
// reverseMousePointerScrollDirection: false,
// gestureDetailsIsChanged: (GestureDetails details) {
// //print(details?.totalScale);
// });
// },
