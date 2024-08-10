class Settings {
  final String userId;
  final bool receiveNotifications;
  final String theme; // You can use enums for theme options
  final bool enablePrivacyMode;

  Settings({
    required this.userId,
    required this.receiveNotifications,
    required this.theme,
    required this.enablePrivacyMode,
  });

  // Factory constructor to convert JSON to Settings object
  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      userId: json['userId'],
      receiveNotifications: json['receiveNotifications'],
      theme: json['theme'],
      enablePrivacyMode: json['enablePrivacyMode'],
    );
  }

  // Method to convert Settings object to JSON
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'receiveNotifications': receiveNotifications,
        'theme': theme,
        'enablePrivacyMode': enablePrivacyMode,
      };
}
