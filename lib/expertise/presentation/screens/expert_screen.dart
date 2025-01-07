import 'package:flutter/material.dart';
import 'package:stock_market/core/presentation/widgets/stripe_group.dart';
import 'package:stock_market/core/utils/app_color.dart';
import 'package:stock_market/core/utils/app_textstyle.dart';
import 'package:stock_market/core/utils/text_constants.dart';

import '../../../core/utils/app_gradient.dart';

class ExpertScreen extends StatefulWidget {
  const ExpertScreen({super.key});

  @override
  State<ExpertScreen> createState() => _ExpertScreenState();
}

class _ExpertScreenState extends State<ExpertScreen> {
  String selectedOption = '';

  void _selectOption(String option) {
    setState(() {
      selectedOption = option; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: AppGradients.backgroundGradient,
              ),
            ),
            const StripeGroup(),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                  
                    Text(
                      TextConstants.expertiselevel,
                      style: AppTextStyles.heading
                          .copyWith(color: AppColors.gradient1),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      TextConstants.investingknowledge,
                      style: AppTextStyles.body,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),

                
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _selectOption(TextConstants.beginner); 
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.transparent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectedOption == TextConstants.beginner
                                  ? AppColors.gradient1
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          width: 350,
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  TextConstants.beginner,
                                  style: AppTextStyles.subheading,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  TextConstants.investingfeeling,
                                  style: AppTextStyles.smallText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                   
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _selectOption(TextConstants.intermediate); 
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.transparent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectedOption == TextConstants.intermediate
                                  ? AppColors.gradient1
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          width: 350,
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  TextConstants.intermediate,
                                  style: AppTextStyles.subheading,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  TextConstants.amountofinvesting,
                                  style: AppTextStyles.smallText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
