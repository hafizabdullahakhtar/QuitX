import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String lastUpdateTimeKey = 'lastUpdateTime';

  // Update user streak daily
  static Future<void> updateStreakDaily() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get last update time from preferences (default to 0 if not set)
    int lastUpdateTime = prefs.getInt(lastUpdateTimeKey) ?? 0;

    // Get current time
    int currentTime = DateTime.now().millisecondsSinceEpoch;

    // Calculate time difference in hours
    int hoursSinceLastUpdate =
        (currentTime - lastUpdateTime) ~/ (1000 * 60 * 60);

    // Update streak for each hour passed since last update
    // For demonstration, I'm assuming user data is stored in shared preferences
    int currentStreak = prefs.getInt('currentStreak') ?? 0;
    int requiredStreak = prefs.getInt('requiredStreak') ?? 0;

    for (int i = 0; i < hoursSinceLastUpdate; i++) {
      if (currentStreak < requiredStreak) {
        currentStreak++;
      } else {
        // Reset streak if requiredStreak is reached
        currentStreak = 0;
      }
    }

    // Save new last update time
    await prefs.setInt(lastUpdateTimeKey, currentTime);
    await prefs.setInt('currentStreak', currentStreak);
  }
}
