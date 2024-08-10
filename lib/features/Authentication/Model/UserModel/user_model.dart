import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String userId;
  String firstName;
  String lastName;
  String email;
  int level;
  String rank;
  int diamondCount;
  int coinCount;
  DateTime? streakStartTime; // Added this new field
  bool isOnStreak; // Added this new field

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.level,
    required this.rank,
    required this.diamondCount,
    required this.coinCount,
    this.streakStartTime,
    this.isOnStreak = false,
  });

  static empty() {
    return UserModel(
      userId: '',
      firstName: '',
      lastName: '',
      email: '',
      level: 1,
      rank: 'Beginner',
      diamondCount: 0,
      coinCount: 0,
      streakStartTime: null,
      isOnStreak: false,
    );
  }

  String get fullName => '$firstName $lastName';

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernamewithPrefix = "cwt_$camelCaseUsername";
    return usernamewithPrefix;
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'level': level,
      'rank': rank,
      'diamondCount': diamondCount,
      'coinCount': coinCount,
      'streakStartTime': streakStartTime?.toIso8601String(),
      'isOnStreak': isOnStreak,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      level: json['level'] ?? 0,
      rank: json['rank'] ?? '',
      diamondCount: json['diamondCount'] ?? 0,
      coinCount: json['coinCount'] ?? 0,
      streakStartTime: json['streakStartTime'] != null
          ? DateTime.parse(json['streakStartTime'])
          : null,
      isOnStreak: json['isOnStreak'] ?? false,
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      userId: user.uid,
      firstName:
          user.displayName != null ? user.displayName!.split(' ')[0] : '',
      lastName: user.displayName != null
          ? user.displayName!.split(' ').length > 1
              ? user.displayName!.split(' ')[1]
              : ''
          : '',
      email: user.email ?? '',
      level: 0,
      rank: '',
      diamondCount: 0,
      coinCount: 0,
      streakStartTime: null,
      isOnStreak: false,
    );
  }
}
