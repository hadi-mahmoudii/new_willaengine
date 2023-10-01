import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:willaengine/localization/arabic.dart';
import 'package:willaengine/localization/english.dart';
import 'package:willaengine/localization/persian.dart';

class TranslationService extends Translations {
  final supportedLanguages = [""];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'fa_IR': persian,
        'ar_IQ': arabic,
      };
}
