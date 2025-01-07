import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/presentation/gradient_text.dart';
import '../../../../core/presentation/stripe_group.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_gradient.dart';
import '../../../../core/utils/app_textstyle.dart';
import '../../../../core/utils/text_constants.dart';
import '../../widgets/login_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _LoginformKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

   bool _isButtonDisabled = false;
   Timer? _debounceTimer;

  void _handleButtonClick() {
    if (_isButtonDisabled) return; 

    setState(() {
      _isButtonDisabled = true; 
    });

    if (_LoginformKey.currentState!.validate()) {
      
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      print('navigating: to home page...');
    } else {
      print('Validation failed');
    }

  
    _debounceTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _isButtonDisabled = false; 
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _debounceTimer?.cancel(); 
    super.dispose();
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
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _LoginformKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const GradientText(
                        text: TextConstants.createaccount,
                        style: AppTextStyles.heading, 
                        gradient: AppGradients.textGradient,
                      ),
                      const SizedBox(height: 20),
                      SignUpFields(
                        nameController: _nameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            print('Forget Password');
                          },
                          child: Text(
                            TextConstants.forgetpassword,
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.gradient1, 
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                       _handleButtonClick();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        backgroundColor: AppColors.gradient1,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 104.0,
                        ),
                      ),
                      child: const Text(TextConstants.loginButton, style:   AppTextStyles.ButtonText,),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(TextConstants.noaccount, style: AppTextStyles.body.copyWith(color: AppColors.white)),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, TextConstants.routesignup);
                            print('Navigating to Signup Screen');
                          },
                          child: Text(
                            TextConstants.signUp,
                            style: AppTextStyles.smallText.copyWith(
                              color: AppColors.gradient1,
                            ),
                          ),
                        ),
                      ],
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
