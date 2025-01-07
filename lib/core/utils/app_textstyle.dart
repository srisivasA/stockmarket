import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_font_families.dart';
import 'app_fontsize.dart'; 

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: AppFontSizes.extraLarge,
    fontWeight: FontWeight.bold,
    fontFamily: AppFontFamilies.roboto,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: AppFontSizes.large,
    fontWeight: FontWeight.w600,
    fontFamily: AppFontFamilies.roboto,
    color: AppColors.white
  );

  static const TextStyle body = TextStyle(
    fontSize: AppFontSizes.medium,
    fontFamily: AppFontFamilies.roboto,
     color: AppColors.white, 
  );

  static const TextStyle smallText = TextStyle(
    fontSize: AppFontSizes.small,
    fontFamily: AppFontFamilies.roboto,
    color: AppColors.white, 
  );

  static const TextStyle ButtonText = TextStyle(
    fontSize: AppFontSizes.large,
    fontWeight: FontWeight.w600,
    fontFamily: AppFontFamilies.roboto,
    color: AppColors.white
  );
}
