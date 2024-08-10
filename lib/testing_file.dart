// import 'package:beinghuman/features/Authentication/Model/UserModel/local_storage_manager.dart';
// import 'package:beinghuman/features/Authentication/Model/UserModel/rank_data.dart';
// import 'package:flutter/material.dart';
// import 'package:beinghuman/features/Authentication/Model/UserModel/user_model.dart';

// class UserDataScreen extends StatefulWidget {
//   const UserDataScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _UserDataScreenState createState() => _UserDataScreenState();
// }

// class _UserDataScreenState extends State<UserDataScreen> {
//   UserModel? user;

//   @override
//   void initState() {
//     super.initState();
//     // Load user data from local storage when the screen initializes
//     loadUserData();
//   }

//   // Method to load user data from local storage
//   Future<void> loadUserData() async {
//     UserModel? loadedUser = await LocalStorageManager.loadUser();
//     if (loadedUser != null) {
//       setState(() {
//         user = loadedUser;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: user != null
//           ? _buildUserDataWidget(user!)
//           : const Text('User data not found.'),
//     );
//   }

//   // Helper method to display user data on the screen
//   Widget _buildUserDataWidget(UserModel user) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text('User ID: ${user.userId}'),
//         const SizedBox(height: 8),
//         Text('Name: ${user.firstName} ${user.lastName}'),
//         const SizedBox(height: 8),
//         Text('Email: ${user.email}'),
//         const SizedBox(height: 8),
//         Text('Level: ${user.currentLevelIndex + 1}'),
//         const SizedBox(height: 8),
//         Text('Level Progress: ${user.currentLevelProgress}'),
//         const SizedBox(height: 8),
//         Text('Current Streak: ${user.currentLevelStreak}'),
//         const SizedBox(height: 8),
//         Text('Current Rank: ${user.currentRankIndex + 1}'),
//         const SizedBox(height: 8),
//         Text('Current Rank: ${ranks[user.currentRankIndex].name}'),
//         if (user.profilePicture != null) ...[
//           // Image.network(user.profilePicture!),
//           const SizedBox(height: 8),
//         ],
//       ],
//     );
//   }
// }
