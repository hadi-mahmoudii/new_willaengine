import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    required Color mainFontColor,
  }) : _mainFontColor = mainFontColor, super(key: key);

  final Color _mainFontColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80,
        child: SpinKitThreeBounce(
          color: _mainFontColor,
          size: 25.0,
        ),
      )
    );
  }
}
