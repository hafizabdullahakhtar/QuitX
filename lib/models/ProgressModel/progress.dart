class Progress {
  final String progressId;
  final String userId;
  final DateTime date;
  final List<String> activitiesLogged;
  final bool milestoneAchievement;

  Progress({
    required this.progressId,
    required this.userId,
    required this.date,
    required this.activitiesLogged,
    required this.milestoneAchievement,
  });

  // Factory constructor to convert JSON to Progress object
  factory Progress.fromJson(Map<String, dynamic> json) {
    return Progress(
      progressId: json['progressId'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      activitiesLogged: List<String>.from(json['activitiesLogged']),
      milestoneAchievement: json['milestoneAchievement'],
    );
  }

  // Method to convert Progress object to JSON
  Map<String, dynamic> toJson() => {
        'progressId': progressId,
        'userId': userId,
        'date': date.toIso8601String(),
        'activitiesLogged': activitiesLogged,
        'milestoneAchievement': milestoneAchievement,
      };
}
