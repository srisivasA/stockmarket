import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_market/core/presentation/stripe_group.dart';

import '../../../core/utils/app_gradient.dart';
import '../../../core/utils/text_constants.dart';
import '../../widgets/landing_text.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    
    Timer(const Duration(seconds: 5), () {
   
      Navigator.pushNamed(context, TextConstants.routesignup);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Stack(
        children: [
          
          Container(
            decoration: const BoxDecoration(
              gradient: AppGradients.backgroundGradient,
            ),
          ),
    
          const StripeGroup(),
   

          const LandingText(),
        ],
      ),
    );
  }
}
