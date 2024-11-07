class PostModel {
  final int id;
  final String title;
  final String body;
  final String date;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      date: json['date'] ?? 'No Date',
    );
  }
}
