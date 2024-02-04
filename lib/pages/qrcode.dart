import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';
import 'package:proj/pages/nextpage.dart';

class QRCODE extends StatelessWidget {
  Future<void> scanQR(BuildContext context) async {
    try {
      ScanResult qrResult = await BarcodeScanner.scan();
      String qrText = qrResult.rawContent ?? 'Aucune donnée scannée';

      // Once the QR code is scanned, you can use qrText as needed.
      // For example, you can navigate to another page with the scanned data.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NextPage(data: qrText)),
      );
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        // User denied camera access.
        print('Permission denied');
      } else {
        // An unexpected error occurred.
        print('Error: $e');
      }
    } on FormatException {
      // User pressed the back button before scanning anything.
      print('You canceled the scan');
    } catch (e) {
      // An unexpected error occurred.
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Scanner',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue, // App bar background color
        elevation: 0, // Remove app bar shadow
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => scanQR(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Scan QR Code',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
