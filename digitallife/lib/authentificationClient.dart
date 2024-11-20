import 'package:flutter/material.dart';
import 'InscriptionClient.dart';

class AuthentificationPage extends StatefulWidget {
  @override
  _AuthentificationPageState createState() => _AuthentificationPageState();
}

class _AuthentificationPageState extends State<AuthentificationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification Client'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Connectez-vous à votre compte',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildTextField('Adresse Email', emailController),
            SizedBox(height: 10),
            _buildTextField('Mot de passe', passwordController, isPassword: true),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to the password reset page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                  );
                },
                child: Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSignInButton(),
            SizedBox(height: 10),
            _buildSignUpButton(), // Button "S'inscrire" added here
            SizedBox(height: 10),
            errorMessage.isNotEmpty ? Text(errorMessage, style: TextStyle(color: Colors.red)) : SizedBox.shrink(),
          ],
        ),
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

  Widget _buildSignInButton() {
    return ElevatedButton(
      onPressed: () {
        String email = emailController.text;
        String password = passwordController.text;

        if (email == 'test@example.com' && password == 'password') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
          );
        } else {
          // Display error message
          setState(() {
            errorMessage = 'Adresse email ou mot de passe incorrect.';
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        'Se connecter',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
        onPressed: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InscriptionPage()),
        );
        },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Green background color for the "S'inscrire" button
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        "S'inscrire",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class ResetPasswordPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Réinitialiser le Mot de Passe'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Réinitialiser votre mot de passe',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildTextField('Adresse Email', emailController),
            SizedBox(height: 20),
            _buildResetPasswordButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
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

  Widget _buildResetPasswordButton() {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
        onPressed: () {
      String email = emailController.text;
      if (email.isNotEmpty) {
        // Display success message or send reset email
        // Here you can display a message in the UI instead of using a dialog
      } else {
        // Display error message if email is empty
        // Here you can display a message in the UI instead of using a dialog
      }
        },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            'Réinitialiser le Mot de Passe',
            style: TextStyle(fontSize: 16),
          ),
        ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Accueil'),
    ),
    body: Center(
    child: Text("Bienvenue sur la page d'accueil"),
    ),
    );
  }
}