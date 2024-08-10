// import 'package:cloud_firestore/cloud_firestore.dart';

// class Streak {
//   String userId;
//   String addictionId;
//   int currentStreak;
//   int targetStreak; // initial target days to abstain
//   DateTime startDate; // date the streak started

//   Streak({
//     required this.userId,
//     required this.addictionId,
//     required this.currentStreak,
//     required this.targetStreak,
//     required this.startDate,
//   });

//   factory Streak.fromMap(Map<String, dynamic> map) => Streak(
//         userId: map['userId'],
//         addictionId: map['addictionId'],
//         currentStreak: map['currentStreak'],
//         targetStreak: map['targetStreak'],
//         startDate: (map['startDate'] as Timestamp).toDate(),
//       );

//   Map<String, dynamic> toMap() => {
//         'userId': userId,
//         'addictionId': addictionId,
//         'currentStreak': currentStreak,
//         'targetStreak': targetStreak,
//         'startDate': startDate,
//       };
// }
