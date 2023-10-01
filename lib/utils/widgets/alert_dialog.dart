import 'package:flutter/material.dart';

class GlobalAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;

  const GlobalAlertDialog({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title ?? '',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
      ),
      content: Text(
        content ?? '',
        textDirection: TextDirection.rtl,
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'OK',
            style: TextStyle(fontFamily: 'montserrat'),
          ),
        )
      ],
    );
  }
}
