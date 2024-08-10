import 'package:beinghuman/utils/constants/colors.dart';
import 'package:beinghuman/utils/constants/image_strings.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:beinghuman/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: screenWidth * 0.92,
      decoration: BoxDecoration(
        color: dark ? TColors.black : TColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
        // border: Border.all(color: TColors.black.withOpacity(0.5), width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(TSizes.lg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    child: Text(
                  'Recommended for you',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: TColors.black),
                )),
                SizedBox(
                    child: Text(
                  'Start your day with some motivation.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: TColors.black),
                )),
              ],
            ),
            const Spacer(),
            Image.asset(
              TImages.videoIcon,
            ),
          ],
        ),
      ),
    );
  }
}
