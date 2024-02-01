import 'package:covid/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestPositifmodifier extends StatefulWidget {
  @override
  _TestPositifmodifierState createState() => _TestPositifmodifierState();
}

class _TestPositifmodifierState extends State<TestPositifmodifier> {
  DateTime? selectedDate; // Variable pour stocker la date sélectionnée
  bool isConfirmed = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Date du Test:',
              style: TextStyle(fontSize: 16),
            ),
            TextFormField(
              controller: TextEditingController(
                text: selectedDate != null ? DateFormat.yMd().format(selectedDate!) : '',
              ),
              decoration: InputDecoration(
                hintText: 'Sélectionnez une date',
                border: OutlineInputBorder(),
              ),
              readOnly: true, // Pour afficher le calendrier
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2015),
                  lastDate: DateTime(2050),
                  builder: (BuildContext context, Widget? child){
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: Config.primaryColor,
                        
                        colorScheme: ColorScheme.light(primary: Config.primaryColor),
                        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
                        
                      ), 
                      child: child!,
                      );
                  }
                  
                );
                if (pickedDate != null && pickedDate != selectedDate) {
                  setState(() {
                    // Mettre à jour la date sélectionnée
                    selectedDate = pickedDate;
                  });
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              'Résultat du Test:',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButtonFormField<String>(
              items: ['Positif', 'Testé positif au COVID-19']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                // Gérez la sélection du dropdown ici
              },
              decoration: InputDecoration(
                hintText: 'Sélectionnez le résultat du test',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Informations Supplémentaires (optionnelles):',
              style: TextStyle(fontSize: 16),
            ),
            TextFormField(
              maxLines: null, // Pour permettre plusieurs lignes de texte
              decoration: InputDecoration(
                hintText: 'Entrez des détails supplémentaires...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: isConfirmed,
                  onChanged: (value) {
                    setState(() {
                      isConfirmed = value ?? false;
                    });
                    // Gérez le changement de valeur de la case à cocher ici
                  },
                  activeColor: Config.primaryColor,
                ),
                Text('Confirmation'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Gérez la logique de soumission ici
              },
              child: Text('modification'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Config.primaryColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
