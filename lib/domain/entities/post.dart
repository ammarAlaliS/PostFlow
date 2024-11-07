class Post {
  final int userId; 
  final int id;
  final String title;
  final String body;
  final String date;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.date,
  });


  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] ?? 0,  
      id: json['id'],               
      title: json['title'],         
      body: json['body'],          
      date: json['date'] ?? 'Fecha no disponible', 
    );
  }

  // Método toJson para convertir el objeto a un mapa JSON
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

