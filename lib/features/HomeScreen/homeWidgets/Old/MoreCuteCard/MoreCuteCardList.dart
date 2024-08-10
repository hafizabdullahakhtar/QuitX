// ignore_for_file: file_names

import 'package:beinghuman/features/HomeScreen/homeWidgets/Old/MoreCuteCard/MoreCuteCard.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/Old/MoreCuteCard/MoreCuteCardData.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/Old/MoreCuteCard/MoreCuteCardModel.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MoreCuteCardList extends StatelessWidget {
  const MoreCuteCardList({super.key});

  @override
  Widget build(BuildContext context) {
    List<MoreCuteCardModel> cards = MoreCuteCardData.getCards();

    return SizedBox(
      height: TSizes.cuteHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: MoreCuteCard(cardModel: cards[index]),
          );
        },
      ),
    );
  }
}
