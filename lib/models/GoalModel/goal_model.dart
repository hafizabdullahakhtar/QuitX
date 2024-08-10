class Goal {
  final String goalId;
  final String userId;
  final String description;
  final DateTime deadline;
  final bool isCompleted;

  Goal({
    required this.goalId,
    required this.userId,
    required this.description,
    required this.deadline,
    required this.isCompleted,
  });

  // Factory constructor to convert JSON to Goal object
  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      goalId: json['goalId'],
      userId: json['userId'],
      description: json['description'],
      deadline: DateTime.parse(json['deadline']),
      isCompleted: json['isCompleted'],
    );
  }

  // Method to convert Goal object to JSON
  Map<String, dynamic> toJson() => {
        'goalId': goalId,
        'userId': userId,
        'description': description,
        'deadline': deadline.toIso8601String(),
        'isCompleted': isCompleted,
      };
}
