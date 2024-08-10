import 'package:beinghuman/features/Authentication/Screens/SignupScreen/signup_form.dart';
import 'package:beinghuman/utils/common/widgets/login_signup/form_divider.dart';
import 'package:beinghuman/utils/common/widgets/login_signup/social_buttons.dart';
import 'package:beinghuman/utils/constants/image_strings.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:beinghuman/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  TImages.AppLogoFull,
                  width: 150,
                  alignment: Alignment.bottomLeft,
                ),
              ),
              const SizedBox(height: 40),

              /// Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const SignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Divider
              const FormDivider(dividerText: TTexts.orSignInWith),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
