class RewardModel {
  int coins;
  int diamonds;
  List<String> avatars;
  List<String> videoUnlocks;
  List<String> quizUnlocks;
  List<String> spinUnlocks;
  List<String> stickerUnlocks;

  RewardModel({
    this.coins = 0,
    this.diamonds = 0,
    this.avatars = const [],
    this.videoUnlocks = const [],
    this.quizUnlocks = const [],
    this.spinUnlocks = const [],
    this.stickerUnlocks = const [],
  });
}

class Rank {
  String name;
  List<RankLevel> levels;

  Rank({
    required this.name,
    required this.levels,
  });
}

class RankLevel {
  int level;
  String title;
  // Additional fields as needed

  RankLevel({
    required this.level,
    required this.title,
    // Additional fields as needed
  });
}
