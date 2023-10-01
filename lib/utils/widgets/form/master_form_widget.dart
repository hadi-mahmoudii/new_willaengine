import 'package:flutter/material.dart';

class MasterFormWidget extends StatelessWidget {
  final String title;
  final bool gotPadding;

  final List<Widget> children;

  const MasterFormWidget({super.key, required this.children, required this.title, this.gotPadding = false});

  @override
  Widget build(BuildContext context) {
    if (title != "") {
      children.insert(
          0,
          Container(
              margin: EdgeInsets.only(right: gotPadding ? 33 : 0),
              child: title != ""
                  ? Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    )
                  : Container()));
    }
    return Container(
        margin: EdgeInsets.symmetric(vertical: title != "" ? 3 : 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: children));
  }
}
