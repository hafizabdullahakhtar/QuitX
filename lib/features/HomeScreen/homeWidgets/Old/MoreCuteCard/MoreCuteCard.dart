// ignore_for_file: file_names

import 'package:beinghuman/features/HomeScreen/homeWidgets/Old/MoreCuteCard/MoreCuteCardModel.dart';
import 'package:beinghuman/utils/constants/colors.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MoreCuteCard extends StatelessWidget {
  final MoreCuteCardModel cardModel;

  const MoreCuteCard({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: TSizes.cuteWidth,
          decoration: BoxDecoration(
            color: cardModel.cardColor,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            // border: Border.all(color: cardModel.cardColor!),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  cardModel.iconData,
                  color: TColors.white,
                ),
                const VerticalDivider(
                  width: 0.5,
                  color: TColors.white,
                ),
                Text(
                  cardModel.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: TColors.white),
                ),
              ],
            ),
          ),
        ),

        // overlay container
        Container(
          decoration: BoxDecoration(
            color: TColors.white.withOpacity(0.3),
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(TSizes.cardRadiusMd),
            ),
          ),
          width: TSizes.cuteWidth - cardModel.progress,
        ),
      ],
    );
  }
}
