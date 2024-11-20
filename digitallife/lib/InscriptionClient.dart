import 'package:flutter/material.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController telephone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription - Livraison à Domicile'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            _buildSectionTitle('Informations Personnelles'),
            _buildTextField('Nom', nom),
            SizedBox(height: 10),
            _buildTextField('Prénom', prenom),
            SizedBox(height: 10),
            _buildTextField('Adresse Email', email),
            SizedBox(height: 10),
            _buildTextField('Numéro de téléphone', telephone),
            SizedBox(height: 20),
            _buildSectionTitle('Informations de Connexion'),
            _buildTextField('Mot de passe', pass, isPassword: true),
            SizedBox(height: 20),
            _buildSectionTitle('Adresse '),
            _buildTextField('Adresse', adresse),
            SizedBox(height: 20),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
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
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(Icons.visibility),
            onPressed: () {},
          )
              : null,
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Ajouter ici la logique pour s'inscrire
          // Par exemple, enregistrer les informations dans une base de données
          // ou envoyer une demande d'inscription au serveur
          print('Inscription en cours...');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          'S\'inscrire',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}


