import 'package:flutter/material.dart';

import 'stripe.dart';

class StripeGroup extends StatelessWidget {
  const StripeGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children:  [
        Stripe(
          imagePath: 'assets/images/stripe1.png',
          topPosition: -50,
          height: 0.4,
        ),
        Stripe(
          imagePath: 'assets/images/stripe2.png',
          topPosition: 10,
          height: 0.4,
          rightPosition: 30,
        ),
        Stripe(
          imagePath: 'assets/images/stripe3.png',
          topPosition: 20,
          height: 0.4,
          rightPosition: 30,
        ),
      ],
    );
  }
}
