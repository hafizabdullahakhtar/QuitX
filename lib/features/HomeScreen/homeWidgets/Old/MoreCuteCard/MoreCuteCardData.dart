// ignore_for_file: file_names

import 'package:beinghuman/features/HomeScreen/homeWidgets/Old/MoreCuteCard/MoreCuteCardModel.dart';
import 'package:flutter/material.dart';

class MoreCuteCardData {
  static List<MoreCuteCardModel> getCards() {
    return [
      MoreCuteCardModel(
        iconData: Icons.water_drop,
        title: 'Water',
        progress: 30,
        cardColor: const Color(0xff0077b6),
      ),
      MoreCuteCardModel(
        iconData: Icons.mode_night,
        title: 'Sleep',
        progress: 10,
        cardColor: const Color(0xff8338ec),
      ),
    ];
  }
}
