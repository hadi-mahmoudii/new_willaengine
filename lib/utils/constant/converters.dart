import 'package:intl/intl.dart';

class Converters {




  static getDateTimeFormat(DateTime date){
    String dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(date);
    return dateTime;

  }
  static getDateTimeStringFormat(String date){
    DateTime dateTime = DateTime.parse(date);
    String stringDate = DateFormat.yMd().format(dateTime);
    return stringDate;

  }
  static getLanguageCodeByLanguage(String language) {
    switch (language) {
      case 'فارسی':
        return 'fa';
      case 'العربية':
        return 'ar';
      case 'English':
        return 'en';
      case 'Deutschland':
        return 'de';
      case 'Français':
        return 'fr';
      case 'Türkçe':
        return 'tr';
      default:
        return '';
    }
  }

  static getLanguageByLanguageCode(String languageCode) {
    switch (languageCode) {
      case 'fa':
        return 'فارسی';
      case 'ar':
        return 'العربية';
      case 'en':
        return 'English';
      case 'de':
        return 'Deutschland';
      case 'fr':
        return 'Français';
      case 'tr':
        return 'Türkçe';
      default:
        return '';
    }
  }

}