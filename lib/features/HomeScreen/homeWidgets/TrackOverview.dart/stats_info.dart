import 'package:beinghuman/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StatsInfoWidget extends StatelessWidget {
  final UserController userController = UserController.instance;

  StatsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 30,
                child: Icon(
                  Iconsax.medal_star5,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(width: 10),
              Obx(() {
                return Text(
                  userController.user.value.rank,
                  style: Theme.of(context).textTheme.bodyLarge,
                );
              }),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
                child: Obx(() {
                  final totalTime =
                      userController.getTotalSecondsForCurrentLevel();
                  final timeSpent =
                      totalTime - userController.secondsRemaining.value;
                  final progress = timeSpent / totalTime;
                  return CircularPercentIndicator(
                    radius: 10,
                    lineWidth: 4,
                    percent: progress,
                    progressColor: Colors.green,
                    backgroundColor: Colors.green.withOpacity(0.1),
                    circularStrokeCap: CircularStrokeCap.round,
                    startAngle: 5.0,
                  );
                }),
              ),
              const SizedBox(width: 10),
              Obx(() {
                return Text(
                  'Level ${userController.user.value.level}',
                  style: Theme.of(context).textTheme.bodyLarge,
                );
              }),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(
                width: 30,
                child: Icon(
                  Iconsax.star5,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(width: 10),
              Obx(() {
                return Text(
                  '${userController.user.value.level} coins',
                  style: Theme.of(context).textTheme.bodyLarge,
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}
