import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class TESTREPORT extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Initialize Firebase
  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  Future<void> _updateUserCovidStatus(BuildContext context, bool isPositive) async {
    await _initializeFirebase(); // Initialize Firebase
    final User? user = _auth.currentUser;
    if (user != null) {
      // Use Firebase Auth instead of Firestore directly
      // Here, you can replace Firestore with other Firebase services as needed
      await user.updateProfile(
        displayName: isPositive ? 'positive' : 'negative',
      );
      _showAlert(context, 'Message', 'Your COVID status has been updated to ${isPositive ? 'Positive' : 'Negative'}.');
    }
  }

  Future<void> _showAlert(BuildContext context, String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // L'utilisateur doit appuyer sur un bouton pour fermer la boîte de dialogue
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Give Your Report Result of COVID Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select your COVID test result:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _updateUserCovidStatus(context, true); // Définir le statut COVID comme positif
              },
              child: Text(
                'Positive',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20), // Espacement entre les boutons
            ElevatedButton(
              onPressed: () async {
                await _updateUserCovidStatus(context, false); // Définir le statut COVID comme négatif
              },
              child: Text(
                'Negative',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
