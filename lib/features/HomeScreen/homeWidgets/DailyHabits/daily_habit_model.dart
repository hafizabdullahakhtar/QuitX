import 'package:flutter/material.dart';

class HabitData {
  final String iconPath;
  final Color iconColor;
  final String habitName;
  final bool showBadge;
  final int? counter;
  final bool isCustom;

  HabitData({
    required this.iconPath,
    this.iconColor = Colors.blueAccent,
    required this.habitName,
    this.showBadge = true,
    this.counter,
    this.isCustom = false, // Default to false (predefined habit)
  });

  // Factory method to create HabitData from Firebase snapshot
  factory HabitData.fromFirebase(Map<String, dynamic> data) {
    return HabitData(
      iconPath: data['iconPath'] ?? '',
      iconColor: data['iconColor'] != null
          ? Color(data['iconColor'])
          : Colors.blueAccent,
      habitName: data['habitName'] ?? '',
      showBadge: data['showBadge'] ?? true,
      counter: data['counter'],
      isCustom: data['isCustom'] ?? false,
    );
  }
}



// class HabitData {
//   final String iconPath;
//   final Color iconColor;
//   final String habitName;
//   final bool showBadge;
//   final int? counter; // This counter is nullable

//   HabitData({
//     required this.iconPath,
//     this.iconColor = Colors.blueAccent,
//     required this.habitName,
//     this.showBadge = true,
//     this.counter, // This counter is nullable and optional
//   }) : assert(showBadge == true
//             ? counter != null
//             : true); // Assertion to enforce counter presence when showBadge is true
// }




