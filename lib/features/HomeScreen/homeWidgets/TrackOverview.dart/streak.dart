import 'package:beinghuman/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Streak extends StatelessWidget {
  final UserController userController = UserController.instance;

  Streak({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => userController.startTimer(),
          child: Container(
            width: 150,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  'STREAK ${userController.getTotalDaysForCurrentLevel()} DAYS',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return CircularPercentIndicator(
                    radius: 60,
                    lineWidth: 15,
                    percent: userController.percentage(),
                    progressColor: const Color(0XFF222222),
                    backgroundColor: Colors.black.withOpacity(0.1),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: userController.timerRunning
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Show days completed so far
                              Text(
                                '${userController.getTotalDaysSpent()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                              ),
                              const Text(
                                'DAYS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          )
                        : Text(
                            'START',
                            style: Theme.of(context).textTheme.headlineSmall!,
                          ),
                  );
                }),
                const SizedBox(height: 10),
                Obx(() {
                  return buildTimeLeft(userController.secondsRemaining.value,
                      userController.user.value.isOnStreak);
                }),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionButton(
              context,
              icon: Iconsax.alarm,
              color: const Color(0XFFEBBA5B),
              onPressed: () {
                // Implement action for alarm button if needed
              },
            ),
            const SizedBox(width: 12),
            _buildActionButton(
              context,
              icon: Iconsax.danger5,
              color: const Color(0XFFF05A5A),
              onPressed: () {
                userController.incrementLevel();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context,
      {required IconData icon, required Color color, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildTimeLeft(int secondsRemaining, bool isOnStreak) {
    if (!isOnStreak) {
      return const Text('Tap to Start');
    } else if (secondsRemaining == 0) {
      return const Text('Level Completed!');
    }

    final int daysLeft = secondsRemaining ~/ (24 * 3600);
    final int hoursLeft = (secondsRemaining % (24 * 3600)) ~/ 3600;
    final int minutesLeft = (secondsRemaining % 3600) ~/ 60;
    final int seconds = secondsRemaining % 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        daysLeft > 0
            ? Text('$daysLeft days', style: TextStyle(fontSize: 8))
            : const SizedBox(),
        Text('$hoursLeft hrs', style: TextStyle(fontSize: 8)),
        Text('$minutesLeft min', style: TextStyle(fontSize: 8)),
        Text('$seconds sec', style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
