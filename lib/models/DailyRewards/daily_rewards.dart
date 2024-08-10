import 'package:cloud_firestore/cloud_firestore.dart'; // Import for Timestamp
import 'package:beinghuman/models/RewardModel/reward_model.dart'; // Assuming RewardModel path

class DailyReward {
  String id;
  DateTime date; // Date for which the reward applies
  RewardModel reward; // Reference to the associated Reward object

  DailyReward({
    required this.id,
    required this.date,
    required this.reward,
  });

  factory DailyReward.fromMap(Map<String, dynamic> map) => DailyReward(
        id: map['id'],
        date: (map['date'] as Timestamp).toDate(),
        reward: RewardModel(
          coins: map['coins'] ?? 0, // Handle potential missing 'coins' field
          diamonds:
              map['diamonds'] ?? 0, // Handle potential missing 'diamonds' field
          avatars: (map['avatars'] as List<dynamic>?)?.cast<String>() ??
              const [], // Handle potential missing or invalid 'avatars' field
          videoUnlocks: (map['videoUnlocks'] as List<dynamic>?)
                  ?.cast<String>() ??
              const [], // Handle potential missing or invalid 'videoUnlocks' field
          quizUnlocks: (map['quizUnlocks'] as List<dynamic>?)?.cast<String>() ??
              const [], // Handle potential missing or invalid 'quizUnlocks' field
          spinUnlocks: (map['spinUnlocks'] as List<dynamic>?)?.cast<String>() ??
              const [], // Handle potential missing or invalid 'spinUnlocks' field
          stickerUnlocks: (map['stickerUnlocks'] as List<dynamic>?)
                  ?.cast<String>() ??
              const [], // Handle potential missing or invalid 'stickerUnlocks' field
        ),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'date': date,
        'coins': reward.coins,
        'diamonds': reward.diamonds,
        'avatars': reward.avatars,
        'videoUnlocks': reward.videoUnlocks,
        'quizUnlocks': reward.quizUnlocks,
        'spinUnlocks': reward.spinUnlocks,
        'stickerUnlocks': reward.stickerUnlocks,
      };
}
