import 'package:beinghuman/utils/constants/colors.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:beinghuman/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TrackingCard extends StatelessWidget {
  const TrackingCard({super.key});

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
      child: Row(
        children: [
          Container(
            // width: 30,
            decoration: const BoxDecoration(
              color: TColors.primary,
              // borderRadius: BorderRadius.circular(20),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // streak
                  Text(
                    '7',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: TColors.white, fontSize: 60),
                  ),
                  Text(
                    'days',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: TColors.white,
                        ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
