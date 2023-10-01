// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:travel/widgets/constants/app_colors.dart';
// import 'package:willaengine/utils/constant/color.dart';

// import 'app_fonts.dart';
// import 'app_text_styles.dart';

// class AppThemes {
//   static final englishTheme = _getTheme(lang: "en");

//   static final persianTheme = _getTheme(lang: "fa");

//   static ThemeData secondTextFieldTheme(context){
//     return Theme.of(context).copyWith(
//         inputDecorationTheme: Theme.of(context)
//             .inputDecorationTheme
//             .copyWith(
//             iconColor: AppColors.primary,
//             fillColor: AppColors.white));
//   }

//   static ThemeData _getTheme({required String lang}) {
//     return ThemeData(
//        primaryColor: AppColors.primary,
//         primarySwatch: AppColors.swatch,
//         primaryColorBrightness: Brightness.light,
//         backgroundColor: AppColors.defaultBg,
//         scaffoldBackgroundColor: AppColors.defaultBg,
//         dialogBackgroundColor: Colors.white,
//         canvasColor: Colors.white,
//         fontFamily: AppFonts.ibmPlex,
//         textTheme: Get.textTheme.apply(
//           displayColor: AppColors.textColor1,
//           bodyColor: AppColors.textColor1,
//           fontFamily: getFont(lang),
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
//           fillColor: Colors.black12,
//           hintStyle: TypographyClass.bodySmall(),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//           enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.transparent)),
//         ),
//         dialogTheme: DialogTheme(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12)
//           )
//         ),
//         cardTheme: CardTheme(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12)
//           )
//         ),
//         checkboxTheme: CheckboxThemeData(
//           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//             side: const BorderSide(color: AppColors.textColor2)
//           ),
//         ),
//         bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
//     );
//   }

//   static getFont(lang){
//     return lang == "en" ? AppFonts.ibmPlex : AppFonts.iranSans;
//   }
// }
