import 'package:flutter/material.dart';

import '../../../../core/presentation/stripe_group.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_gradient.dart';
import '../../../../core/utils/gradient_text.dart';
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
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
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
                      
                        if (_signUpformKey.currentState!.validate()) {
                         
                          print('Name: ${_nameController.text}');
                          print('Email: ${_emailController.text}');
                          print('Password: ${_passwordController.text}');
                        } else {
                        
                          print('Validation failed');
                        }
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
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text(
                       TextConstants.haveanaccount,
                          style: TextStyle(color: AppColors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                            print("Navigating to Login Screen");
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                TextConstants.signin,
                                style: TextStyle(color: AppColors.gradient1),
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
