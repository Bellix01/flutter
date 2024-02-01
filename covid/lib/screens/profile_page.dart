import 'package:covid/utils/config.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  final String deviceUDID;
  const ProfilPage({Key? key, required this.deviceUDID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Config.primaryColor,
        toolbarHeight: 70,
        title: Text('Profil'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30.0), // Increase padding
            width: 400, // Increase width
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15.0), // Increase border radius
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 160, // Increase image container size
                  height: 120, // Increase image container size
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Config.primaryColor, width: 3), // Increase border width
                    image: DecorationImage(
                      image: AssetImage('assets/ammine.png'), // Verify the image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 30), // Increase spacing
                Text(
                  'Belhadj Ammine',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Increase font size
                ),
                SizedBox(height: 18),
                Text(
                  'Email: belhadj@gmail.com',
                  style: TextStyle(fontSize: 24), // Increase font size
                ),
                SizedBox(height: 8),
                Text(
                  'UDID: $deviceUDID',
                  style: TextStyle(fontSize: 24), // Increase font size
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
