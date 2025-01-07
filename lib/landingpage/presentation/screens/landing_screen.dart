import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_market/core/presentation/stripe_group.dart';

import '../../../auth/signup/presentation/screens/signup.dart';
import '../../../core/utils/app_gradient.dart';
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
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
