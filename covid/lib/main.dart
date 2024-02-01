import 'package:covid/main_layout.dart';
import 'package:covid/screens/auth_page.dart';
import 'package:covid/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String deviceUDID = await getDeviceUDID();

  runApp(MyApp(deviceUDID: deviceUDID));
}

Future<String> getDeviceUDID() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String udid;

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    udid = androidInfo.androidId; // Utilisation de l'ID Android comme UDID pour Android
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    udid = iosInfo.identifierForVendor; // Utilisation de l'identifiant pour iOS
  } else {
    udid = 'Unknown'; // Pour les autres plateformes
  }

  return udid;
}

class MyApp extends StatelessWidget {
  final String deviceUDID;

  const MyApp({Key? key, required this.deviceUDID}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'SafeNetTrace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          // Predéfinir le thème pour les widgets d'entrée
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          // Thème pour la barre de navigation
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        'main': (context) => MainLayout(deviceUDID: deviceUDID), // Passer l'UDID à MainLayout
      },
    );
  }
}
