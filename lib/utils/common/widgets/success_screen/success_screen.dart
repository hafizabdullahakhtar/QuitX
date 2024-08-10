import 'package:beinghuman/utils/common/styles/spacing_styles.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle,
      this.onPressed})
      : super(key: key);

  final String image, title, subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: TSpacingStyle.paddingWithAppBarHeight * 2,
      child: Column(
        children: [
          /// Image
          SizedBox(
            width: double.infinity * 0.6,
            child: SvgPicture.asset(
              image,
              width: 150,
              alignment: Alignment.bottomLeft,
            ),
          ),

          ///  Title & Subtitle
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          /// Buttons
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    ));
  }
}
