class FeedbackModel {
  final String feedbackId;
  final String userId;
  final String description;
  final DateTime timestamp;

  FeedbackModel({
    required this.feedbackId,
    required this.userId,
    required this.description,
    required this.timestamp,
  });

  // Factory constructor to convert JSON to FeedbackModel object
  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      feedbackId: json['feedbackId'],
      userId: json['userId'],
      description: json['description'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // Method to convert FeedbackModel object to JSON
  Map<String, dynamic> toJson() => {
        'feedbackId': feedbackId,
        'userId': userId,
        'description': description,
        'timestamp': timestamp.toIso8601String(),
      };
}
