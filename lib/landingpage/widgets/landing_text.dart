import 'package:flutter/material.dart';
import 'package:stock_market/core/utils/app_gradient.dart';

import '../../core/presentation/gradient_text.dart';
import '../../core/utils/app_textstyle.dart';
import '../../core/utils/text_constants.dart';


class LandingText extends StatelessWidget {
  const LandingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const Center(
      child: Column(
        
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 200),
            child: GradientText(
              text:TextConstants.investingforeverybody,
              gradient: AppGradients.textGradient,
              style:AppTextStyles.heading
            ),
          ),
          SizedBox(height: 16),
          Text(
            TextConstants.investingDescription, 
            textAlign: TextAlign.center,
            style:AppTextStyles.body
          ),
        ],
      ),
    );
  }
}
