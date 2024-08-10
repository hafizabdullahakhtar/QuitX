class OfflineData {
  final String dataId;
  final String userId;
  final Map<String, dynamic> data;
  final DateTime timestamp;

  OfflineData({
    required this.dataId,
    required this.userId,
    required this.data,
    required this.timestamp,
  });

  // Factory constructor to convert JSON to OfflineData object
  factory OfflineData.fromJson(Map<String, dynamic> json) {
    return OfflineData(
      dataId: json['dataId'],
      userId: json['userId'],
      data: json['data'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // Method to convert OfflineData object to JSON
  Map<String, dynamic> toJson() => {
        'dataId': dataId,
        'userId': userId,
        'data': data,
        'timestamp': timestamp.toIso8601String(),
      };
}
