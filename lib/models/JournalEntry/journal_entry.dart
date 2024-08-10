class JournalEntry {
  final String entryId;
  final String userId;
  final DateTime date;
  final String mood;
  final String reflection;

  JournalEntry({
    required this.entryId,
    required this.userId,
    required this.date,
    required this.mood,
    required this.reflection,
  });

  // Factory constructor to convert JSON to JournalEntry object
  factory JournalEntry.fromJson(Map<String, dynamic> json) {
    return JournalEntry(
      entryId: json['entryId'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      mood: json['mood'],
      reflection: json['reflection'],
    );
  }

  // Method to convert JournalEntry object to JSON
  Map<String, dynamic> toJson() => {
        'entryId': entryId,
        'userId': userId,
        'date': date.toIso8601String(),
        'mood': mood,
        'reflection': reflection,
      };
}
