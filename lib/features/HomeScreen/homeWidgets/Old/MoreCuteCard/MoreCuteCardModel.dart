// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MoreCuteCardModel {
  final IconData iconData;
  final String title;
  late final int progress;
  final Color? cardColor;

  MoreCuteCardModel({
    required this.iconData,
    required this.title,
    required this.progress,
    this.cardColor,
  });
}
