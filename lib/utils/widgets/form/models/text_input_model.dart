import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputModel {
  String? name;
  String? title;
  String? placeholder;
  String? value;
  String? help;
  bool? isRtl;
  bool? enabled;
  bool? readOnly;
  bool? required;
  String? regex;
  IconData? icon;
  Function? callBack;

  TextInputModel({
    this.name,
    this.title,
    this.placeholder,
    this.value,
    this.help,
    this.isRtl,
    this.enabled,
    this.readOnly,
    this.required,
    this.regex,
    this.icon,
    this.callBack,
  });

  TextInputModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    placeholder = json['placeholder'];
    value = json['value'];
    help = json['help'];
    isRtl = json['is_rtl'] ?? true;
    enabled = json['enabled'];
    readOnly = json['readOnly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data['value'] = value;
    return data;
  }
}
