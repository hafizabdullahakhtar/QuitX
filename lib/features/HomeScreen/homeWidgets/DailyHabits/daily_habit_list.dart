import 'package:beinghuman/features/HomeScreen/homeWidgets/DailyHabits/daily_habit_model.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'daily_habit_data.dart';
import 'daily_habit_icon.dart';

class DailyHabitList extends StatelessWidget {
  const DailyHabitList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, bottom: 10), // Adjust as needed
          child: Text('Daily Habits',
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Container(
          height: 100,
          padding: const EdgeInsets.only(left: 20),
          child: ListView(
            // physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            children: habitList.map((habitData) {
              return Padding(
                padding: const EdgeInsets.only(
                    right: 15), // Adjust spacing as needed
                child: DailyHabitIcon(
                  habitData: HabitData(
                    iconPath: habitData.iconPath,
                    habitName: habitData.habitName,
                    showBadge: habitData.showBadge,
                    iconColor: habitData.iconColor,
                    counter: habitData.counter ?? 0,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
