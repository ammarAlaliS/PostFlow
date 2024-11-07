class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  final String date;

  // Constructor
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.date,
  });

  // Método de fábrica para convertir JSON en un objeto de tipo PostModel
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] ?? 0, // Default a 0 si no existe el userId
      id: json['id'] ?? 0, // Default a 0 si no existe el id
      title: json['title'] ?? '', // Default a '' si no existe el title
      body: json['body'] ?? '', // Default a '' si no existe el body
      date: json['date'] ?? 'No Date', // Default a 'No Date' si no existe la fecha
    );
  }

  // Método para convertir un PostModel en un mapa JSON
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

