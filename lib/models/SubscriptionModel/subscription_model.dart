class Subscription {
  final String subscriptionId;
  final String userId;
  final String subscriptionType;
  final DateTime expirationDate;

  Subscription({
    required this.subscriptionId,
    required this.userId,
    required this.subscriptionType,
    required this.expirationDate,
  });

  // Factory constructor to convert JSON to Subscription object
  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      subscriptionId: json['subscriptionId'],
      userId: json['userId'],
      subscriptionType: json['subscriptionType'],
      expirationDate: DateTime.parse(json['expirationDate']),
    );
  }

  // Method to convert Subscription object to JSON
  Map<String, dynamic> toJson() => {
        'subscriptionId': subscriptionId,
        'userId': userId,
        'subscriptionType': subscriptionType,
        'expirationDate': expirationDate.toIso8601String(),
      };
}
