import 'package:beinghuman/features/HomeScreen/homeWidgets/DailyHabits/daily_habit_model.dart';
import 'package:beinghuman/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

final List<HabitData> habitList = [
  HabitData(
    iconPath: TImages.water,
    habitName: 'Water',
    iconColor: const Color(0XFF75D4F6),
    showBadge: true,
    counter: 8,
  ),
  HabitData(
    iconPath: TImages.excercise,
    habitName: 'Exercise',
    iconColor: Colors.purpleAccent,
    showBadge: true,
    counter: 2,
  ),
  HabitData(
    iconPath: TImages.reading,
    habitName: 'Reading',
    iconColor: const Color(0XFFF9B171),
    showBadge: true,
    counter: 2,
  ),
  HabitData(
    iconPath: TImages.night,
    habitName: 'Early Bed',
    iconColor: const Color(0XFF6D75C1),
    showBadge: false,
  ),
  HabitData(
    iconPath: TImages.morning,
    habitName: 'Early Rise',
    iconColor: const Color(0XFFFADD75),
    showBadge: false,
  ),
  HabitData(
    iconPath: TImages.food,
    habitName: 'Good Fuel',
    iconColor: Colors.greenAccent,
    showBadge: true,
    counter: 3,
  ),
  // HabitData(
  //   iconPath: TImages.more,
  //   habitName: 'Add More',
  //   iconColor: const Color.fromARGB(255, 164, 164, 164),
  //   isCustom: true,
  //   showBadge: false,
  //   counter: 5,
  // ),
];
