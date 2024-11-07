class Post {
  final int id;
  final String title;
  final String body;
  final String date;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
  });

  // Método para crear un Post desde un JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],       // Asegúrate de que el campo 'id' exista en el JSON
      title: json['title'], // Asegúrate de que el campo 'title' exista en el JSON
      body: json['body'],   // Asegúrate de que el campo 'body' exista en el JSON
      date: json['date'] ?? 'Fecha no disponible',  // Si la API no proporciona la fecha, maneja el caso aquí
    );
  }
}
