import 'package:beinghuman/features/Authentication/Screens/LoginScreen/login_form.dart';
import 'package:beinghuman/features/Authentication/Screens/LoginScreen/login_header.dart';
import 'package:beinghuman/features/Authentication/Screens/SignupScreen/signup_screen.dart';
import 'package:beinghuman/utils/common/widgets/login_signup/form_divider.dart';
import 'package:beinghuman/utils/common/widgets/login_signup/social_buttons.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:beinghuman/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: TSizes.defaultSpace,
              left: TSizes.defaultSpace,
              right: TSizes.defaultSpace),
          child: Column(
            children: [
              const LoginHeader(),

              /// Form
              const LoginForm(),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),

              /// Create Account Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
                      );
                    },
                    child: const Text(TTexts.createAccount)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Divider
              FormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
