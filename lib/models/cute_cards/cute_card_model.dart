import 'package:flutter/material.dart';

class CardModel {
  final String heading;
  final IconData iconData;
  final String progressText;
  final String unit;
  final String dailyGoalText;
  final int progress;
  final Color? cardColor;

  CardModel({
    required this.heading,
    required this.iconData,
    required this.progress,
    required this.progressText,
    required this.unit,
    required this.dailyGoalText,
    this.cardColor,
  });
}
