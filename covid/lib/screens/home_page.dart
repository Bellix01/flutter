import 'package:covid/utils/config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String deviceUDID;
  const HomePage({Key? key, required this.deviceUDID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Config.primaryColor,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Expanded(
             // child: Text(
              //  'Noha Morsse',
               // style: TextStyle(
                 // fontSize: 24,
                  //fontWeight: FontWeight.bold,
                 // color: Colors.black,
                //),
              //),
            //),
            Expanded(
              child: Text(
                'UDID: $deviceUDID',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/ammine.png'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: ListView(
          children: [
            Text(
                  'Quelques conseils',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
              
                ),
                
            _buildAdviceCard(
              icon: Icons.clean_hands,
              title: 'Lavez-vous les mains',
              description: 'Utilisez du savon et de l\'eau pendant au moins 20 secondes.',
            ),
            _buildAdviceCard(
              icon: Icons.masks,
              title: 'Portez un masque',
              description: 'Portez un masque dans les lieux publics pour vous protéger et protéger les autres.',
            ),
            _buildAdviceCard(
              icon: Icons.social_distance,
              title: 'Pratiquez la distanciation sociale',
              description: 'Maintenez une distance d\'au moins 1 mètre avec les autres personnes.',
            ),
            _buildAdviceCard(
               icon: Icons.medical_services,
               title: 'Consultez un professionnel de la santé si nécessaire',
               description: 'En cas de symptômes du COVID-19, consultez immédiatement un médecin.',
            ),  
            _buildAdviceCard(
      icon: Icons.cleaning_services,
      title: 'Nettoyez régulièrement les surfaces fréquemment touchées',
      description: 'Utilisez des désinfectants pour nettoyer les surfaces que vous touchez fréquemment.',
    ),
    _buildAdviceCard(
      icon: Icons.local_hospital,
      title: 'Restez informé des directives locales',
      description: 'Suivez les directives des autorités locales pour les protocoles de sécurité spécifiques.',
    ),
    _buildAdviceCard(
      icon: Icons.sick,
      title: 'Restez à la maison si vous êtes malade',
      description: 'Si vous vous sentez mal, restez à la maison pour éviter la propagation du virus.',
    ),
  
            
            // Ajoutez d'autres conseils ici...
          ],
        ),
      ),
    );
  }

  Widget _buildAdviceCard({required IconData icon, required String title, required String description}) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Config.primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
