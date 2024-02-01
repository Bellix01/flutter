import 'package:covid/components/interaction.dart';
import 'package:covid/components/listeteste.dart';
import 'package:covid/components/test_form.dart';
import 'package:covid/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SuiviCovid19 extends StatefulWidget {
  final String deviceUDID;
  const SuiviCovid19({Key? key, required this.deviceUDID}) : super(key: key);

  @override
  State<SuiviCovid19> createState() => _SuiviCovid19State();
}

class _SuiviCovid19State extends State<SuiviCovid19> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showTests = false; // Ajout d'un booléen pour gérer l'affichage des tests

  @override
  void initState() {
    super.initState();
   _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Test> positiveTests = [
      Test(title: 'Test 1', date: '1st Jan'),
      Test(title: 'Test 2', date: '5th Feb'),
      Test(title: 'Test 3', date: '10th Mar'),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Config.primaryColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.people),
                    SizedBox(height: 2),
                    Text('Interactions'),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.qr_code),
                    SizedBox(height: 2),
                    Text('QR Codes'),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(FontAwesomeIcons.solidCheckCircle),
                    SizedBox(height: 2),
                    Text('Test Positif'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                InteractionLogPreview(),
                Center(child: Text('qr code')),
                showTests ? PositiveTestsList(positiveTests: positiveTests) : TestPositifForm(),
                
                  
              ],
            ),
          ),
          // Ajout de la Card "Voir mes tests" sous la TabBarView
          Card(
  child: InkWell(
    onTap: () {
      setState(() {
        showTests = !showTests; // Inverse la valeur pour basculer entre les vues
      });
    },
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(showTests ? 'Retour au formulaire' : 'Voir mes tests'),
          Icon(showTests ? Icons.arrow_back : Icons.arrow_forward),
        ],
      ),
    ),
  ),
),
        ],
      ),
    );
  }
}