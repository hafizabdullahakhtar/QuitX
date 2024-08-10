import 'package:beinghuman/models/cute_cards/cute_card_model.dart';
import 'package:flutter/material.dart';

class HardCodedData {
  static List<CardModel> getCards() {
    return [
      CardModel(
        heading: 'Water',
        iconData: Icons.water_drop,
        progressText: '4',
        unit: 'liters',
        dailyGoalText: '6',
        cardColor: Color.fromARGB(255, 89, 181, 204),
        progress: 30,
      ),
      CardModel(
        heading: 'Exercise',
        iconData: Icons.directions_run,
        progressText: '30',
        unit: 'min',
        dailyGoalText: '60',
        cardColor: Color.fromARGB(255, 66, 173, 97),
        progress: 50,
      ),
      CardModel(
        heading: 'Sleep',
        iconData: Icons.directions_run,
        progressText: '5',
        unit: 'point',
        dailyGoalText: '8',
        cardColor: const Color(0xffce4257),
        progress: 20,
      ),
    ];
  }
}
