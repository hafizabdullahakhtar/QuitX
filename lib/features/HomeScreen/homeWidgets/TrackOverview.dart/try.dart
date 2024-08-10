// import 'package:beinghuman/controllers/user_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UserStreakWidget extends StatelessWidget {
//   final UserController userController = UserController.instance;

//   UserStreakWidget({Key? key}) : super(key: key);

//   String formatDuration(Duration duration) {
//     int days = duration.inDays;
//     int hours = duration.inHours.remainder(24);
//     int minutes = duration.inMinutes.remainder(60);
//     int seconds = duration.inSeconds.remainder(60);

//     return '$days days: $hours hrs: $minutes min: $seconds sec';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (userController.user.value.streakStartTime == null ||
//           !userController.user.value.isOnStreak) {
//         return Column(
//           children: [
//             const Text("Start your streak to see progress"),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 userController.startStreak();
//               },
//               child: const Text("Start Streak"),
//             ),
//           ],
//         );
//       }

//       final now = DateTime.now();
//       final streakDuration = userController
//           .ranks[userController.currentRankIndex]
//           .levels[userController.currentLevelIndex]
//           .daysToUpgrade;
//       final endTime = userController.user.value.streakStartTime!
//           .add(Duration(days: streakDuration));
//       final timeLeft = endTime.difference(now);
//       final daysCompleted = streakDuration - timeLeft.inDays;

//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Current Rank: ${userController.user.value.rank}',
//             style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Current Level: ${userController.user.value.level}',
//             style: const TextStyle(fontSize: 20),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Days Completed: $daysCompleted',
//             style: const TextStyle(fontSize: 20),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Time Left: ${formatDuration(timeLeft)}',
//             style: const TextStyle(fontSize: 20),
//           ),
//         ],
//       );
//     });
//   }
// }
