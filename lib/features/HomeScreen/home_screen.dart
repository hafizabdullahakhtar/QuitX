import 'package:beinghuman/controllers/user_controller.dart';
import 'package:beinghuman/features/Authentication/Model/UserModel/user_model.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/DailyHabits/daily_habit_list.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/TrackOverview.dart/streakClean.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/TrackOverview.dart/track_overview.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/TrackOverview.dart/try.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/TrackOverview.dart/your_widget.dart';
import 'package:beinghuman/features/HomeScreen/homeWidgets/WeeklyChallange/weekly_challange_list.dart';
import 'package:beinghuman/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // UserController controller = UserController.instance;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              streakClean(),
              // MyWidget(),
              // UserDataScreen(), // Assuming this displays user data
              const SizedBox(height: TSizes.appBarHeight),
              // YourWidget(),
              // UserProfile(),
              const TrackOverview(),
              const SizedBox(height: TSizes.spaceBtwSections),
              const DailyHabitList(),
              const SizedBox(height: TSizes.spaceBtwSections),
              const WeeklyChallengeList(),
            ],
          ),
        ),
      ),
    );
  }
}
