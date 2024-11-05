import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PublicationListScreen extends StatelessWidget {
  final List<Publication> publications = [
    Publication(
      title: 'Flutter Development',
      summary: 'Learn how to build beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Publication(
      title: 'Dart Programming Language',
      summary: 'Dart is a client-optimized language for fast apps on any platform.',
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Publication(
      title: 'Material Design',
      summary: 'Material is an adaptable system of guidelines, components, and tools that support the best practices of user interface design.',
      date: DateTime.now().subtract(Duration(days: 7)),
    ),
    // Add more publications as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publications'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: publications.length,
        itemBuilder: (context, index) {
          return PublicationCard(publication: publications[index]);
        },
      ),
    );
  }
}

class PublicationCard extends StatelessWidget {
  final Publication publication;

  const PublicationCard({Key? key, required this.publication}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              publication.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              publication.summary,
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Published on: ${DateFormat('MMMM d, y').format(publication.date)}',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Publication {
  final String title;
  final String summary;
  final DateTime date;

  Publication({required this.title, required this.summary, required this.date});
}