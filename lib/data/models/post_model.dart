class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  final String date;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.date,
  });


  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] ?? 0, 
      id: json['id'] ?? 0, 
      title: json['title'] ?? '', 
      body: json['body'] ?? '', 
      date: json['date'] ?? 'No Date',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
      'date': date,
    };
  }
}

