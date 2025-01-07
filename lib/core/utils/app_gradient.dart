import 'package:flutter/material.dart';
import 'package:stock_market/core/utils/app_color.dart';

class AppGradients {
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
     AppColors.primaryColor,
     AppColors.secondaryColor,
    
    ],
  );

 
  static const LinearGradient textGradient = LinearGradient(
     begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
    AppColors.gradient1,
     AppColors.gradient2,
    ],
  );
}
