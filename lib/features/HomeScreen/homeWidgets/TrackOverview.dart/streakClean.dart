import 'package:beinghuman/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: camel_case_types
class streakClean extends StatelessWidget {
  final UserController userController = UserController.instance;

  streakClean({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Obx(() {
            return GestureDetector(
              onTap: () => userController.startTimer(),
              child: CircularPercentIndicator(
                radius: 80,
                lineWidth: 15,
                // want to add actual percent value here (0.0 - 1.0)
                percent: userController.percentage(),
                progressColor: Color.fromARGB(255, 53, 59, 225),
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
              ),
            );
          }),
        ),
      ],
    );
  }
}
