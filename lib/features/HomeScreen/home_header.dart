// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:beinghuman/utils/common/widgets/custom_shapes/TPrimary_header.dart';
import 'package:beinghuman/utils/constants/colors.dart';
import 'package:beinghuman/utils/constants/image_strings.dart';
import 'package:beinghuman/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/sizes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = THelperFunctions.getFormattedDate(currentDate);
    return TPrimaryHeaderContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: TSizes.appBarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      TImages.ui_calendar,
                      width: 26,
                      height: 26,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      formattedDate,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: TColors.white),
                    )
                  ],
                ),
                const Icon(
                  Iconsax.notification,
                  color: TColors.white,
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// user profile
            UserProfile(),
          ],
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 35,
          child: SvgPicture.asset(
            TImages.avatar1,
          ),
        ),
        const SizedBox(width: TSizes.gridViewSpacing),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hafiz Azam",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: TColors.white),
            ),
            const SizedBox(height: TSizes.gridViewSpacing),
            Row(
              children: [
                Icon(
                  Iconsax.star5,
                  color: Color.fromARGB(255, 255, 200, 1),
                ),
                const SizedBox(width: 5),
                Text(
                  "Pro",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.white),
                ),
                const SizedBox(width: TSizes.gridViewSpacing),
                Icon(
                  Iconsax.chart5,
                  color: Color.fromARGB(255, 255, 200, 1),
                ),
                const SizedBox(width: 5),
                Text(
                  "80%",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.white),
                ),
                const SizedBox(width: TSizes.gridViewSpacing),
                Icon(
                  Iconsax.coin_15,
                  color: Color.fromARGB(255, 255, 200, 1),
                ),
                const SizedBox(width: 5),
                Text(
                  "2,676",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.white),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
