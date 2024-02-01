import 'package:flutter/material.dart';

class PositiveTestsList extends StatelessWidget {
  final List<Test> positiveTests;

  PositiveTestsList({required this.positiveTests});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: positiveTests.length,
      itemBuilder: (context, index) {
        final test = positiveTests[index];
        return TestListItem(test: test);
      },
    );
  }
}

class TestListItem extends StatelessWidget {
  final Test test;

  TestListItem({required this.test});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(test.title),
      subtitle: Text(test.date),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Action pour modifier le test
              // Utilisez Navigator pour naviguer vers l'écran de modification du test
            },
            color: Theme.of(context).primaryColor, // Couleur modifiée lorsqu'appuyée
          ),
          SizedBox(width: 8), // Espacement entre les boutons
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Action pour supprimer le test
              // Utilisez showDialog pour demander confirmation
            },
            color: Theme.of(context).errorColor, // Couleur modifiée lorsqu'appuyée
          ),
        ],
      ),
    );
  }
}

class Test {
  final String title;
  final String date;

  Test({required this.title, required this.date});
}
