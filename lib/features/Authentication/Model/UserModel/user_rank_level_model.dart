// rank_level_model.dart

class Level {
  int levelNumber;
  int daysToUpgrade; // Change secondsToUpgrade to daysToUpgrade

  Level({
    required this.levelNumber,
    required this.daysToUpgrade, // Change secondsToUpgrade to daysToUpgrade
  });

  static empty() {
    return Level(levelNumber: 1, daysToUpgrade: 0);
  }
}

class Rank {
  String rankName;
  List<Level> levels;

  Rank({
    required this.rankName,
    required this.levels,
  });

  static empty() {
    return Rank(rankName: 'Beginner', levels: []);
  }
}
