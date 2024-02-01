import 'package:flutter/material.dart';

class InteractionLogPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> interactions = [
      {'title': 'Interaction 1', 'time': '10:00 AM'},
      {'title': 'Interaction 2', 'time': '11:30 AM'},
      {'title': 'Interaction 3', 'time': '1:45 PM'},
      {'title': 'Interaction 1', 'time': '10:00 AM'},
      {'title': 'Interaction 2', 'time': '11:30 AM'},
      {'title': 'Interaction 3', 'time': '1:45 PM'},
      {'title': 'Interaction 1', 'time': '10:00 AM'},
      {'title': 'Interaction 2', 'time': '11:30 AM'},
      {'title': 'Interaction 3', 'time': '1:45 PM'},
      // Ajoutez d'autres interactions simulées ici
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Journal des Interactions ')),
      body: InteractionCard(interactions: interactions),
    );
  }
}

class InteractionCard extends StatelessWidget {
  final List<Map<String, dynamic>> interactions;

  InteractionCard({required this.interactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: interactions.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          color: Colors.white, // Changez la couleur ici
          child: ListTile(
            title: Text(
              interactions[index]['title'] ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black, // Couleur du texte
              ),
            ),
            subtitle: Text(interactions[index]['time'] ?? ''),
          ),
        );
      },
    );
  }
}
