import 'package:flutter/material.dart';

class LearningModule {
  final String id;
  final String title;
  final String description;
  final List<String> videoUrls;
  final Color color;
  final IconData icon;
  final double progress; // Added progress attribute

  // Constructor
  LearningModule({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrls,
    required this.color,
    required this.icon,
    required this.progress, // Added progress attribute to the constructor
  }) : assert(videoUrls.isNotEmpty, 'Video URLs cannot be empty');

  // Getter for video count
  int get videoCount => videoUrls.length;
}
