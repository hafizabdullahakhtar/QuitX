import 'package:beinghuman/features/HomeScreen/homeWidgets/Old/CuteCard/cute_cards.dart';
import 'package:beinghuman/models/cute_cards/cute_cards_data.dart';
import 'package:flutter/material.dart';
import 'package:beinghuman/models/cute_cards/cute_card_model.dart';

class CuteCardList extends StatelessWidget {
  const CuteCardList({super.key});

  @override
  Widget build(BuildContext context) {
    List<CardModel> cards = HardCodedData.getCards();

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: CuteCard(cardModel: cards[index]),
          );
        },
      ),
    );
  }
}
