import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/widgets/form/models/text_input_model.dart';

class TextInputWidget extends StatelessWidget {
  final TextInputModel model;

  TextInputWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formatter = [];
    if (model.regex != null) {
      formatter.add(FilteringTextInputFormatter.allow(RegExp(r'' + model.regex! + '')));
    }

    return FormBuilderTextField(
      key: Key(model.name!),
      name: model.name!,
      initialValue: model.value != null ? model.value.toString() : null,
      maxLines: 1,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        if (value!.isNotEmpty || value.runtimeType != String) {
          model.callBack != null ? model.callBack!(value) : () {};
        }
      },
      textDirection: (model.isRtl ?? true) ? TextDirection.rtl : TextDirection.ltr,
      validator: FormBuilderValidators.compose((model.required ?? false)
          ? [
              FormBuilderValidators.required(errorText: "لطفا ${model.title} را وارد نمایید"),
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
          model.icon,
          size: 20,
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
