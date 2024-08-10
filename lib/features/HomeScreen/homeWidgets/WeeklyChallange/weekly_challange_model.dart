import 'package:flutter/material.dart';

class WeeklyChallenge {
  final String iconPath;
  final Color iconColor;
  final String title;
  final String? description;
  final String action1;
  final String action2;
  final String action3;
  int? progress;

  WeeklyChallenge({
    required this.iconPath,
    this.iconColor = Colors.blueAccent,
    required this.title,
    this.description,
    required this.action1,
    required this.action2,
    required this.action3,
    this.progress = 0,
  });

  get isCompleted => null;

  Map<String, dynamic> toJson() {
    return {
      'iconPath': iconPath,
      'iconColor': iconColor,
      'title': title,
      'description': description,
      'action1': action1,
      'String': action2,
      'currentLevel': action3,
      'progress': progress,
    };
  }

  factory WeeklyChallenge.fromJson(Map<String, dynamic> json) {
    return WeeklyChallenge(
      iconPath: json['iconPath'],
      iconColor:
          Color(json['iconColor']), // Assuming iconColor is stored as an int
      title: json['title'],
      description: json['description'],
      action1: json['action1'],
      action2: json['action2'],
      action3: json['action3'],
      progress: json['progress'],
    );
  }

  factory WeeklyChallenge.fromMap(Map<String, dynamic> json) {
    return WeeklyChallenge(
      iconPath: json['iconPath'] as String,
      iconColor: Color(
          json['iconColor'] as int), // Assuming iconColor is stored as an int
      title: json['title'] as String,
      description: json['description'] as String?, // Allow null for description
      action1: json['action1'] as String,
      action2: json['action2'] as String,
      action3: json['action3'] as String,
      progress: json['progress'] as int?, // Allow null for progress
    );
  }

  bool isChallengeComplete() {
    return progress == 3;
  }
}
