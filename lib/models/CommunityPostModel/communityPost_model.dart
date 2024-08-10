class CommunityPost {
  final String postId;
  final String userId;
  final String content;
  final DateTime timestamp;
  final int likes;
  final List<Map<String, dynamic>> comments;

  CommunityPost({
    required this.postId,
    required this.userId,
    required this.content,
    required this.timestamp,
    required this.likes,
    required this.comments,
  });

  // Factory constructor to convert JSON to CommunityPost object
  factory CommunityPost.fromJson(Map<String, dynamic> json) {
    return CommunityPost(
      postId: json['postId'],
      userId: json['userId'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
      likes: json['likes'],
      comments: List<Map<String, dynamic>>.from(json['comments']),
    );
  }

  // Method to convert CommunityPost object to JSON
  Map<String, dynamic> toJson() => {
        'postId': postId,
        'userId': userId,
        'content': content,
        'timestamp': timestamp.toIso8601String(),
        'likes': likes,
        'comments': comments,
      };
}
