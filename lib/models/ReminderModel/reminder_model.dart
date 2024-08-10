import 'package:flutter/material.dart';

class Reminder {
  final String reminderId;
  final String userId;
  final String reminderMessage;
  final TimeOfDay time; // You can use Flutter's TimeOfDay class
  final List<int>
      daysOfWeek; // You can use integers to represent days of the week (e.g., 0 for Sunday, 1 for Monday, etc.)

  Reminder({
    required this.reminderId,
    required this.userId,
    required this.reminderMessage,
    required this.time,
    required this.daysOfWeek,
  });

  // Factory constructor to convert JSON to Reminder object
  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      reminderId: json['reminderId'],
      userId: json['userId'],
      reminderMessage: json['reminderMessage'],
      time: TimeOfDay(hour: json['hour'], minute: json['minute']),
      daysOfWeek: List<int>.from(json['daysOfWeek']),
    );
  }

  // Method to convert Reminder object to JSON
  Map<String, dynamic> toJson() => {
        'reminderId': reminderId,
        'userId': userId,
        'reminderMessage': reminderMessage,
        'hour': time.hour,
        'minute': time.minute,
        'daysOfWeek': daysOfWeek,
      };
}
