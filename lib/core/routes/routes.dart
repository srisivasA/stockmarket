import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/login/presentation/screens/login.dart';
import '../../auth/signup/presentation/screens/signup.dart';
import '../../landingpage/presentation/screens/landing_screen.dart';
import '../utils/text_constants.dart';


final routerProvider = Provider<RouteFactory>((ref) {
  return (settings) {
    final Map<String, WidgetBuilder> routes = {
      TextConstants.initialRoute: (context) =>  LandingScreen(),
      TextConstants.routesignup: (context) =>  const SignUp(),
      TextConstants.routesignin: (context) => const LoginScreen(),
    };

    
    WidgetBuilder? builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(
        builder: builder,
        settings: settings,
      );
    }

    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text('404 - Page Not Found')),
      ),
    );
  };
});
