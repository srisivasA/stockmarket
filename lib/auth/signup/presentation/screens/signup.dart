import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_market/core/utils/app_textstyle.dart';

import '../../../../core/presentation/gradient_text.dart';
import '../../../../core/presentation/stripe_group.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_gradient.dart';
import '../../../../core/utils/text_constants.dart';
import '../../widgets/signup_feilds.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signUpformKey = GlobalKey<FormState>();
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

    if (_signUpformKey.currentState!.validate()) {
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _debounceTimer?.cancel(); // Cancel the timer if the widget is disposed
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
                  key: _signUpformKey,
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
                      child: const Text(
                        TextConstants.createaccount,
                        style: AppTextStyles.ButtonText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(TextConstants.haveanaccount,
                            style: AppTextStyles.smallText),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, TextConstants.routesignin);
                            print("Navigating to Login Screen");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                TextConstants.signUp,
                                style: AppTextStyles.smallText.copyWith(
                                  color: AppColors.gradient1,
                                ),
                              ),
                            ],
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
