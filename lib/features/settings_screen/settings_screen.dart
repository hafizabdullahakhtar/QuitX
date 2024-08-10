import 'package:beinghuman/features/HomeScreen/home_header.dart';
import 'package:beinghuman/utils/common/widgets/custom_shapes/TPrimary_header.dart';
import 'package:beinghuman/utils/constants/colors.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            TPrimaryHeaderContainer(
                child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Appbar

                  Container(
                    decoration: BoxDecoration(
                      color: TColors.white.withOpacity(0.1),
                      border: Border.all(color: TColors.white.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const UserProfile(),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ))

            /// body
          ],
        ),
      ),
    );
  }
}
