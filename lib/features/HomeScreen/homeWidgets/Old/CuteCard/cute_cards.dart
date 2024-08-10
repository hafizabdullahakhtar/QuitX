import 'package:flutter/material.dart';
import 'package:beinghuman/models/cute_cards/cute_card_model.dart';
import 'package:beinghuman/utils/constants/colors.dart';
import 'package:beinghuman/utils/constants/sizes.dart';

class CuteCard extends StatelessWidget {
  final CardModel cardModel;

  const CuteCard({
    super.key,
    required this.cardModel,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.4;

    return Stack(
      children: [
        Container(
          width: cardWidth,
          // height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg * 1.5),
            color: cardModel.cardColor ?? TColors.accent,
            // border: Border.all(color: TColors.black.withOpacity(0.5), width: 2),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: TColors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    cardModel.iconData,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.cardRadiusLg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cardModel.heading,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: TColors.light),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.defaultSpace * 1.5),

                    // Progress
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${cardModel.progressText} ${cardModel.unit}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.white),
                      ),
                    ),

                    const Spacer(),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Daily Goal",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .apply(color: TColors.light),
                          ),
                          Text(
                            '${cardModel.dailyGoalText} ${cardModel.unit}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .apply(color: TColors.light),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   width: cardWidth - cardModel.progress,
        //   decoration: BoxDecoration(
        //     color: TColors.white.withOpacity(0.3),
        //     borderRadius: const BorderRadius.horizontal(
        //       left: Radius.circular(TSizes.cardRadiusLg * 1.5),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
