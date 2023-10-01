import 'package:flutter/material.dart';
import 'package:persian_date_null_saftey/persian_date.dart';
import 'package:sizer/sizer.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final String? type;
  final Function? callBack;

  const OtpInput(
    this.controller,
    this.type, {
    Key? key,
    this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      height: 45,
      width: 12.w,
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: TextFormField(
            controller: controller,
            maxLength: 1,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            // controller: textController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value.length == 1 && type != 'last') {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && type != 'first') {
                FocusScope.of(context).previousFocus();
              }
              callBack != null ? callBack!() : null;
            },
            // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
              // border: InputBorder.none,
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 77, 130))),
              counterText: '',
            ),
          ),
        ),
      ),
    );

    // SizedBox(
    //   height: 60,
    //   width: 50,
    //   child: TextField(
    //     autofocus: autoFocus,
    //     textAlign: TextAlign.center,
    //     keyboardType: TextInputType.number,
    //     controller: controller,
    //     maxLength: 1,
    //     cursorColor: Theme.of(context).primaryColor,
    //     decoration: const InputDecoration(border: OutlineInputBorder(), counterText: '', hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
    //     onChanged: (value) {
    //       if (value.length == 1) {
    //         FocusScope.of(context).nextFocus();
    //       }
    //     },
    //   ),
    // );
  }
}
