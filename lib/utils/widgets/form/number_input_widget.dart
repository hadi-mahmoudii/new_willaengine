import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/utils/constant/color.dart';

import 'package:willaengine/utils/widgets/form/master_form_widget.dart';
import 'package:willaengine/utils/widgets/form/models/number_input_model.dart';

class NumberInputWidget extends StatelessWidget {
  final NumberInputModel model;

  const NumberInputWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      key: Key(model.name!),
      controller: model.controller,
      name: model.name!,
      initialValue: model.value != null ? model.value.toString() : null,
      maxLines: 1,
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        if (value!.isNotEmpty || value.runtimeType != String) {
          model.value = int.parse(value);
          model.callBack != null ? model.callBack!(value) : null;
        }
      },
      textDirection: (model.isRtl ?? true) ? TextDirection.rtl : TextDirection.ltr,
      validator: FormBuilderValidators.compose((model.required ?? false)
          ? [
              FormBuilderValidators.integer(),
              FormBuilderValidators.required(
                errorText: "لطفا ${model.title} را وارد نمایید",
              ),
            ]
          : []),
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 7.sp),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: -5,
          vertical: 5,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.inputBorder, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        icon: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Icon(
            model.icon,
            size: 20,
          ),
        ),
        label: Text(
          model.title ?? '',
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
