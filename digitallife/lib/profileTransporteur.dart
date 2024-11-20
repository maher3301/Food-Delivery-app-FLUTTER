import 'package:flutter/material.dart';

import 'listeComm.dart';

class ProfilTrans extends StatefulWidget {
  const ProfilTrans({Key? key}) : super(key: key);

  @override
  State<ProfilTrans> createState() => _ProfilTransState();
}

class _ProfilTransState extends State<ProfilTrans> {
  TextEditingController nomController = TextEditingController(text: 'Arij');
  TextEditingController prenomController = TextEditingController(text: 'hafnaoui');
  TextEditingController numeroController = TextEditingController(text: '123456789');
  TextEditingController cinController = TextEditingController(text: '1234567890123');

  bool isEditing = false;

  int _selectedIndex = 0; // Indice de l'onglet sélectionné

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Espace Transporteur'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 12),
              Text(
                'Espace Transporteur',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        'images/assets/phonedelivery.png',
                        width: 500,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildCommandButton(
                      text: 'Liste de commandes',
                      icon: Icons.list,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommandListPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 12),
                    Divider(color: Colors.white), // Séparateur
                    SizedBox(height: 12),
                    _buildCommandButton(
                      text: 'Historique de commande',
                      icon: Icons.history,
                      onPressed: () {
                        // Implémentez la navigation vers l'historique des commandes
                      },
                    ),
                    SizedBox(height: 12),
                    Divider(color: Colors.white), // Séparateur
                    SizedBox(height: 12),
                    _buildCommandButton(
                      text: 'Modifier Profil',
                      icon: Icons.edit,
                      onPressed: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                    ),
                    SizedBox(height: 24),
                    if (isEditing) ...[
                      _buildEditableField('Nom', nomController),
                      SizedBox(height: 12),
                      _buildEditableField('Prénom', prenomController),
                      SizedBox(height: 12),
                      _buildEditableField('Numéro', numeroController),
                      SizedBox(height: 12),
                      _buildEditableField('Carte CIN', cinController),
                      SizedBox(height: 24),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isEditing = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Enregistrer'),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        enabled: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildCommandButton({required String text, required IconData icon, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilTrans(),
  ));
}
