import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/controller/global_controller.dart';
import 'package:willaengine/utils/widgets/form/models/text_input_model.dart';

class GlobalDatePickerWidget extends StatefulWidget {
  final TextInputModel model;
  final Function callBack;
  final DateTime? initialDate;

  GlobalDatePickerWidget({
    super.key,
    required this.model,
    required this.callBack,
    this.initialDate,
  });

  @override
  State<GlobalDatePickerWidget> createState() => _GlobalDatePickerWidgetState();
}

class _GlobalDatePickerWidgetState extends State<GlobalDatePickerWidget> {
  TextEditingController controller = TextEditingController();
  var globalController = Get.find<GlobalController>();

  @override
  void initState() {
    if (widget.initialDate != null) {
      controller.text = globalController.selectedLang == 'fa'
          ? Jalali.fromDateTime(widget.initialDate!).formatCompactDate()
          : intl.DateFormat('yyyy-MM-dd').format(widget.initialDate!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formatter = [];
    if (widget.model.regex != null) {
      formatter.add(FilteringTextInputFormatter.allow(RegExp(r'' + widget.model.regex! + '')));
    }

    return FormBuilderTextField(
      controller: controller,
      key: Key(widget.model.name!),
      name: widget.model.name!,
      initialValue: widget.model.value != null ? widget.model.value.toString() : null,
      maxLines: 1,
      keyboardType: TextInputType.text,
      readOnly: true,
      onTap: globalController.selectedLang == 'fa'
          ? () async {
              Jalali? shamsiDate = await showPersianDatePicker(
                context: context,
                initialDate: widget.initialDate != null ? Jalali.fromDateTime(widget.initialDate!) : Jalali.now(),
                firstDate: Jalali(1300, 8),
                lastDate: Jalali(1450, 9),
              );
              if (shamsiDate != null) {
                DateTime time = shamsiDate.toDateTime();
                widget.callBack!(time);
                String formattedDate = shamsiDate.formatCompactDate();
                setState(() {
                  controller.text = formattedDate; //set output date to TextField value.
                });
              } else {}
            }
          : () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: widget.initialDate ?? DateTime.now(),
                firstDate: DateTime(1900),
                //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                widget.callBack!(pickedDate);
                String formattedDate = intl.DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  controller.text = formattedDate; //set output date to TextField value.
                });
              } else {}
            },
      onChanged: (value) {
        if (value!.isNotEmpty || value.runtimeType != String) {
          // model.value = int.parse(value);
        }
      },
      textDirection: (widget.model.isRtl ?? true) ? TextDirection.rtl : TextDirection.ltr,
      validator: FormBuilderValidators.compose((widget.model.required ?? false)
          ? [
              FormBuilderValidators.required(errorText: "لطفا ${widget.model.title} را وارد نمایید"),
            ]
          : []),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: -5),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.inputBorder, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        icon: Icon(
          widget.model.icon,
          size: 20,
        ),
        label: Text(
          widget.model.title ?? '',
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
        enabled: true,
        alignLabelWithHint: false,
      ),
    );
  }
}

// class InputDatePickerComponent extends StatefulWidget {
//   // Vars
//   final Color initColor;
//   final double initFontSize;
//   final FontWeight initFontWeight;
//   final String labelText;
//   final Color? labelColor;
//   final double labelFontSize;
//   final FontWeight labelFontWeight;
//   final String? hintText;
//   final Color? hintColor;
//   final double? hintFontSize;
//   final FontWeight? hintFontWeight;
//   final String? helperText;
//   final Color? helperColor;
//   final double? helperFontSize;
//   final FontWeight? helperFontWeight;
//   final double errorFontSize;
//   final FontWeight errorFontWeight;
//   final IconData? prefixIcon;
//   final Widget? prefixIconImage;
//   final double? prefixSize;
//   final Color? prefixColor;
//   final Widget? suffixWidget;
//   final Color backgroundColor;
//   final double borderRadius;
//   final double? borderWidth;
//   final Color? borderColor;
//   final Color focusedColor;
//   final Color errorColor;
//   final int maxLength;
//   final bool isEditable;
//   final TextInputAction textInputAction;
//   final TextEditingController controller;
//   final Function(dynamic value)? callBack;
//   final Function? deleteCallBack;
//   final dynamic validateCallback;
//   DateTime initialDate;
//
//   // Constructor
//   InputDatePickerComponent({
//     super.key,
//     required this.initColor,
//     required this.initFontSize,
//     required this.initialDate,
//     required this.initFontWeight,
//     required this.labelText,
//     required this.labelColor,
//     required this.labelFontSize,
//     required this.labelFontWeight,
//     required this.hintText,
//     required this.hintColor,
//     required this.hintFontSize,
//     required this.hintFontWeight,
//     required this.helperText,
//     required this.helperColor,
//     required this.helperFontSize,
//     required this.helperFontWeight,
//     required this.errorFontSize,
//     required this.errorFontWeight,
//     required this.prefixIcon,
//     required this.prefixIconImage,
//     required this.prefixSize,
//     required this.prefixColor,
//     required this.suffixWidget,
//     required this.backgroundColor,
//     required this.borderRadius,
//     required this.borderWidth,
//     required this.borderColor,
//     required this.focusedColor,
//     required this.errorColor,
//     required this.maxLength,
//     required this.isEditable,
//     required this.textInputAction,
//     required this.controller,
//     required this.validateCallback,
//     this.callBack,
//     this.deleteCallBack,
//   });
//
//   @override
//   State<InputDatePickerComponent> createState() =>
//       _InputDatePickerComponentState();
// }
//
// class _InputDatePickerComponentState extends State<InputDatePickerComponent> {
//   // Tree
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       readOnly: true,
//       onTap: context.localizations.language == 'فارسی'
//           ? () async {
//         Jalali? shamsiDate = await showPersianDatePicker(
//           context: context,
//           initialDate: Jalali.now(),
//           firstDate: Jalali(1385, 8),
//           lastDate: Jalali(1450, 9),
//         );
//         if (shamsiDate != null) {
//           DateTime time = shamsiDate.toDateTime();
//           widget.callBack!(time);
//           String formattedDate = shamsiDate.formatCompactDate();
//           setState(() {
//             widget.controller.text =
//                 formattedDate; //set output date to TextField value.
//             widget.initialDate = time;
//           });
//         } else {}
//       }
//           : () async {
//         DateTime? pickedDate = await showDatePicker(
//           context: context,
//           initialDate: widget.initialDate,
//           firstDate: DateTime(2000),
//           //DateTime.now() - not to allow to choose before today.
//           lastDate: DateTime(2101),
//         );
//
//         if (pickedDate != null) {
//           widget.callBack!(pickedDate);
//           String formattedDate =
//           intl.DateFormat('yyyy-MM-dd').format(pickedDate);
//
//           setState(() {
//             widget.controller.text =
//                 formattedDate; //set output date to TextField value.
//             widget.initialDate = pickedDate;
//           });
//         } else {}
//       },
//
//       style: TextStyle(
//         color: widget.initColor,
//         fontSize: widget.initFontSize,
//         fontWeight: widget.initFontWeight,
//       ),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: widget.backgroundColor,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius),
//           borderSide: BorderSide(
//             color: widget.borderColor ?? Colors.transparent,
//             width: widget.borderWidth ?? 0,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius),
//           borderSide: BorderSide(
//             color: widget.focusedColor,
//             width: widget.borderWidth ?? 0,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius),
//           borderSide: BorderSide(
//             color: widget.focusedColor,
//             width: widget.borderWidth ?? 0,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius),
//           borderSide: BorderSide(
//             color: widget.errorColor,
//             width: widget.borderWidth ?? 0,
//           ),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius),
//           borderSide: BorderSide(
//             color: widget.borderColor ?? Colors.transparent,
//             width: widget.borderWidth ?? 0,
//           ),
//         ),
//         labelText: widget.labelText,
//         labelStyle: TextStyle(
//           color: widget.labelColor,
//           fontSize: widget.labelFontSize,
//           fontWeight: widget.labelFontWeight,
//         ),
//         hintText: widget.hintText,
//         hintStyle: TextStyle(
//           color: widget.hintColor,
//           fontSize: widget.hintFontSize,
//           fontWeight: widget.hintFontWeight,
//         ),
//         helperText: widget.helperText,
//         helperStyle: TextStyle(
//           color: widget.helperColor,
//           fontSize: widget.helperFontSize,
//           fontWeight: widget.helperFontWeight,
//         ),
//         errorStyle: TextStyle(
//           color: widget.errorColor,
//           fontSize: widget.errorFontSize,
//           fontWeight: widget.errorFontWeight,
//         ),
//         counterText: '',
//         prefixIcon: (widget.prefixIcon != null)
//             ? Icon(
//           widget.prefixIcon,
//           color: widget.prefixColor,
//           size: widget.prefixSize,
//         )
//             : (widget.prefixIconImage != null)
//             ? widget.prefixIconImage
//             : null,
//         suffixIcon: (widget.controller.text.isNotEmpty  && widget.deleteCallBack != null)
//             ? InkWell(
//           onTap: (){
//             widget.deleteCallBack;
//             widget.controller.text = '';
//           } ,
//           child: Container(
//             margin:
//             const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//             padding: const EdgeInsets.all(5),
//             decoration: BoxDecoration(
//               color: AppColor.red100,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: SvgPicture.asset(kAssetIconDelete,
//                 width: 15, height: 15, color: AppColor.red300),
//           ),
//         )
//             : (widget.suffixWidget != null)
//             ? widget.suffixWidget
//             : null,
//       ),
//       cursorColor: widget.focusedColor,
//       obscureText: false,
//       enableSuggestions: false,
//       autocorrect: false,
//       maxLines: 1,
//       maxLength: widget.maxLength,
//       enabled: widget.isEditable,
//       keyboardType: TextInputType.text,
//       textInputAction: widget.textInputAction,
//       controller: widget.controller,
//       validator: widget.validateCallback,
//       // onChanged: (value) => callBack!(value),
//     );
//   }
// }
