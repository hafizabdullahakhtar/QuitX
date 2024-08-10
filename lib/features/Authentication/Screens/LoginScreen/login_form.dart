import 'package:beinghuman/features/Authentication/Controller/login_controller.dart';
import 'package:beinghuman/utils/validators/validation.dart';
import 'package:flutter/material.dart';

import 'package:beinghuman/features/PasswordConfig/forget_password.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:beinghuman/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.only(top: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email

            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                expands: false,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),

            /// Remember Me $ Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text((TTexts.rememberMe)),
                  ],
                ),

                /// Forgot Password
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ForgetPassword(), // Replace ForgetPasswordScreen() with your actual forget password screen widget
                      ),
                    );
                  },
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            ///Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignin(),
                    child: const Text(TTexts.signIn))),

            // const SizedBox(height: TSizes.spaceBtwItems),
            // /// Create Account Button
            // SizedBox(
            //   width: double.infinity,
            //   child: OutlinedButton(
            //       onPressed: () => Get.to(() => const SignupScreen()),
            //       child: const Text(TTexts.createAccount)),
            // ),
          ],
        ),
      ),
    );
  }
}
