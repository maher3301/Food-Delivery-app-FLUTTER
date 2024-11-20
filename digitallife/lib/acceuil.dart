import 'package:digitallife/authentificationClient.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'InscriptionClient.dart';

class Homie extends StatefulWidget {
  @override
  _HomieState createState() => _HomieState();
}

class _HomieState extends State<Homie> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: WavePainter(_controller.value),
                child: Container(),
              );
            },
          ),
          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/assets/del.png', // Corrected image path
                      width: 250,
                      height: 250,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement action for Get Started button
                    print('Bouton de démarrage enfoncé');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(double.infinity, 50), // Full-width button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Démarrer',
                    style: TextStyle(color: Colors.white, fontSize: 18), // Adjust text size if needed
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to the login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthentificationPage()),
                  );
                },
                child: Text(
                  "Déjà un membre? S'identifier",
                  style: TextStyle(color: Colors.black),
                ),
              ),


            ],
          ),
        ],
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
    final double waveHeight = 10.0;
    final double waveSpeed = 2 * pi * animationValue;
    final double waveWidth = size.width;
    final double waveStartHeight = size.height / 1.5;

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
