import 'package:digitallife/profilclient.dart';
import 'package:flutter/material.dart';
import 'package:digitallife/InscriptionClient.dart';
import 'package:digitallife/authentificationTransporteur.dart';
import 'package:digitallife/profileTransporteur.dart';
import 'package:digitallife/acceuil.dart'; // Assurez-vous que l'importation est correcte
import 'package:digitallife/authentificationClient.dart';
import 'package:digitallife/detailsplat.dart'; // Assurez-vous que l'importation est correcte
import 'dashboard.dart';
import 'listeComm.dart'; // Assurez-vous que l'importation est correcte

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.orangeAccent,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
        backgroundColor: Colors.blue,
        elevation: 0, // No shadow under the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AuthentificationPage()),
                );
              },
              child: Text('Naviguer vers Authentifierclient'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => InscriptionPage()),
                );
              },
              child: Text('Naviguer vers inscriptionclient'),
            ),SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CommandListPage()),
                );
              },
              child: Text('Naviguer vers listecommande'),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Transporteur()),
                );
              },
              child: Text('Naviguer vers Transporteur'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Homie()),
                );
              },
              child: Text('Accueil'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductDetails()),
                );
              },
              child: Text('Détails plat'),
            ),



          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfilePage()),
              );
            },
            child: Text('profile Client'),
          ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FoodDashboard()),
                );
              },
              child: Text('FoodDashboard'),
            ),
      SizedBox(height: 16),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProfilTrans()),
          );
        },
        child: Text('profil transporteur'),
      ),

            SizedBox(height: 16),
            
        ],
        ),
      ),
    );
  }
}
