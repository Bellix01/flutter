import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proj/auth.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:proj/pages/qrcode.dart';
import 'package:proj/pages/testreport.dart';
import 'package:proj/pages/trucking.dart'; // Importer FlutterUdid
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:proj/auth.dart';
import 'package:proj/pages/qrcode.dart';
import 'package:proj/pages/testreport.dart';
import 'package:proj/pages/trucking.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text(
      'Home',
      style: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _userUid() {
    return FutureBuilder<String>(
      future: FlutterUdid.udid,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            'UDID: Loading...',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
          );
        } else {
          if (snapshot.hasData) {
            return Text(
              'UDID: ${snapshot.data}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            );
          } else {
            return Text(
              'UDID: Error',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            );
          }
        }
      },
    );
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
      ),
      child: const Text(
        'Sign Out',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _userUid(),
              SizedBox(height: 20),
              StyledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TESTREPORT()),
                  );
                },
                label: 'Test report',
              ),
              SizedBox(height: 10),
              StyledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRCODE()),
                  );
                },
                label: 'Scan QR code',
              ),
              SizedBox(height: 10),
              StyledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TRACKING()),
                  );
                },
                label: 'Tracking',
              ),
              SizedBox(height: 10),
              _signOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class StyledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const StyledButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
