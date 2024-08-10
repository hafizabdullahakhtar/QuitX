import 'package:beinghuman/models/RewardModel/reward_model.dart';

class ChallengeModel {
  final String challengeId;
  final String description;
  final int duration; // Duration in days
  final RewardModel reward;
  final bool isCompleted;

  ChallengeModel({
    required this.challengeId,
    required this.description,
    required this.duration,
    required this.reward,
    this.isCompleted = false,
  });
}
