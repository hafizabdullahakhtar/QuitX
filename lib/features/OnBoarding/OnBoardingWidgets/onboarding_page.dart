import 'package:beinghuman/utils/constants/image_strings.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPage extends StatelessWidget {
  final String image, title, subtitle;
  final String color;

  const OnBoardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.color});

  @override
  Widget build(BuildContext context) {
    Color colorValue = Color(int.parse('0xFF$color')); // Parse the color string

    return Stack(
      children: [
        SvgPicture.asset(
          image,
          alignment: Alignment.topCenter,
          width: double.infinity,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SizedBox(
            height: 265,
            child: Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
              ),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      TImages.sehatgharButton,
                      alignment: Alignment.topCenter,
                      colorFilter: ColorFilter.mode(
                        colorValue,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: colorValue),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
