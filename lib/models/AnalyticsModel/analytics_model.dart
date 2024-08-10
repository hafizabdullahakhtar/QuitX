class Analytics {
  final String analyticsId;
  final String userId;
  final String eventType;
  final DateTime timestamp;

  Analytics({
    required this.analyticsId,
    required this.userId,
    required this.eventType,
    required this.timestamp,
  });

  // Factory constructor to convert JSON to Analytics object
  factory Analytics.fromJson(Map<String, dynamic> json) {
    return Analytics(
      analyticsId: json['analyticsId'],
      userId: json['userId'],
      eventType: json['eventType'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // Method to convert Analytics object to JSON
  Map<String, dynamic> toJson() => {
        'analyticsId': analyticsId,
        'userId': userId,
        'eventType': eventType,
        'timestamp': timestamp.toIso8601String(),
      };
}
