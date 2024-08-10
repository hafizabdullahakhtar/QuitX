import 'package:beinghuman/features/OnBoarding/onboarding_screen.dart';
import 'package:beinghuman/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

// import '../home screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // delay
    Future.delayed(const Duration(seconds: 1), () {
      // navigate
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(TImages.AppLogo),
      ),
    );
  }
}
