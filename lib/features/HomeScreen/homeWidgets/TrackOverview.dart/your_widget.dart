// import 'package:beinghuman/controllers/user_controller.dart';
// import 'package:beinghuman/features/Authentication/Model/UserModel/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// class UserProfile extends StatelessWidget {
//   final UserController userController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           const SizedBox(height: 20.0),
//           Obx(
//             () => userController.user.value.streakStart != null
//                 ? Column(
//                     children: [
//                       const Text(
//                         'Streak:',
//                         style: TextStyle(fontSize: 18.0),
//                       ),
//                       const SizedBox(height: 5.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircularPercentIndicator(
//                             radius: 60.0,
//                             lineWidth: 6.0,
//                             percent:
//                                 userController.percentage().clamp(0.0, 1.0),
//                             progressColor: Colors.blue,
//                             center: Obx(
//                               () => Text(
//                                 'Streak: ${userController.user.value.streakStart != null ? userController.secondsRemaining.value ~/ 86400 + 1 : 0}d',
//                                 style: TextStyle(fontSize: 18.0),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 20.0),
//                           Expanded(
//                             child: LinearProgressIndicator(
//                               value:
//                                   userController.percentage().clamp(0.0, 1.0),
//                               backgroundColor: Colors.grey[200],
//                               valueColor:
//                                   const AlwaysStoppedAnimation(Colors.black),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 5.0),
//                       Text(
//                         'Time remaining: ${userController.secondsRemaining.value ~/ 3600}h ${(userController.secondsRemaining.value % 3600) ~/ 60}m ${(userController.secondsRemaining.value % 60)}s',
//                         style: const TextStyle(
//                           fontSize: 16.0,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   )
//                 : Column(
//                     children: [
//                       const Text(
//                         'No active streak yet.',
//                         style: TextStyle(fontSize: 16.0, color: Colors.grey),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Call a function in UserController to set streakStart
//                           userController.startTimer();
//                         },
//                         child: const Text('Start Streak'),
//                       ),
//                     ],
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
