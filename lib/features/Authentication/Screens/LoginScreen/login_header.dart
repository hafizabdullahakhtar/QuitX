// ignore_for_file: sized_box_for_whitespace

import 'package:beinghuman/utils/constants/image_strings.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:beinghuman/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: TSizes.defaultSpace,
        ),
        Container(
          width: double.infinity,
          child: SvgPicture.asset(
            TImages.AppLogoFull, // Your SVG file path
            width: 150, // Set the width to constrain the size
            alignment: Alignment.bottomLeft, // Set alignment if needed
          ),
        ),
        const SizedBox(height: 40),
        Text(TTexts.loginTitle,
            style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: TSizes.md),
      ],
    );
  }
}
