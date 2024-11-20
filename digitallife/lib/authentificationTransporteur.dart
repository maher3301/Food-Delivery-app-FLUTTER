import 'dart:math';
import 'package:flutter/material.dart';

import 'listeComm.dart';


class Transporteur extends StatefulWidget {
  const Transporteur({Key? key}) : super(key: key);

  @override
  State<Transporteur> createState() => _TransporteurState();
}

class _TransporteurState extends State<Transporteur> with TickerProviderStateMixin {
  TextEditingController numeroController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification Transporteur'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
              painter: WavePainter(_animation.value),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/assets/trans.png', // Corrected image path
                      width: 350,
                      height: 350,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Connectez-vous en tant que transporteur',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    _buildTextField('Numéro', numeroController),
                    SizedBox(height: 10),
                    _buildTextField('Mot de passe', passwordController, isPassword: true),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Logique de connexion ici
                        String numero = numeroController.text;
                        String password = passwordController.text;

                        // Exemple de validation simple pour la démonstration
                        if (numero == '123456' && password == 'password') {
                          // Connexion réussie, naviguer vers la page suivante
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => CommandListPage()),
                          );
                        } else {
                          // Afficher un message d'erreur
                          setState(() {
                            errorMessage = 'Numéro ou mot de passe incorrect.';
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.green, // Couleur du texte du bouton
                        padding: EdgeInsets.symmetric(vertical: 16), // Espacement du bouton
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Bord arrondi du bouton
                        ),
                      ),
                      child: Text('Se connecter'),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: errorMessage.isNotEmpty ? Text(errorMessage, style: TextStyle(color: Colors.red)) : SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
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
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue;

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final Path path = Path();
    final double waveHeight = 20.0;
    final double waveSpeed = 2 * pi * animationValue;
    final double waveWidth = size.width;
    final double waveStartHeight = size.height / 2;

    path.moveTo(0, waveStartHeight);
    for (double i = 0; i <= waveWidth; i++) {
      double y = waveStartHeight + waveHeight * sin((i / waveWidth * 2 * pi) + waveSpeed);
      path.lineTo(i, y);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
