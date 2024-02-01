import 'package:covid/screens/home_page.dart';
import 'package:covid/screens/notification.dart';
import 'package:covid/screens/profile_page.dart';
import 'package:covid/screens/suivi_covid19.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainLayout extends StatefulWidget{
  final String deviceUDID;
  const MainLayout({Key? key, required this.deviceUDID}) : super(key:key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          setState(() {
            //update page index when tab pressed/switch page
            currentPage = value;
          });
        }),
        children:  <Widget>[
          HomePage(deviceUDID: widget.deviceUDID),
          NotificationPage(deviceUDID: widget.deviceUDID),
          SuiviCovid19(deviceUDID: widget.deviceUDID),
          ProfilPage(deviceUDID: widget.deviceUDID),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page){
          setState(() {
            currentPage = page;
            _page.animateToPage(
              page,
              duration: const Duration(milliseconds: 500), 
              curve: Curves.easeInOut,
              );
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
            label: 'Home',
            ),
             BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bell),
            label: 'notification',
            ),

             BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.virus),
            label: 'Suivi Covid-19',
            ),
             BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user ),
            label: 'Profil',
            ),

        ],
      ),
    );
  }
}