import 'package:flutter/material.dart';

class CommandListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste de Commandes'),
      ),
      body: ListView.builder(
        itemCount: 10, // Remplacez par la longueur de votre liste de commandes
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Commande #$index'),
            subtitle: Text('Adresse de Livraison : Adresse $index\nTotal : \$${index * 10}.00'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailPage(orderId: index),
                  ),
                );
              },
              child: Text('Détails'),
            ),
          );
        },
      ),
    );
  }
}

class OrderDetailPage extends StatelessWidget {
  final int orderId;

  OrderDetailPage({required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Commande #$orderId'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date de Commande : ${DateTime.now()}'),
            SizedBox(height: 8),
            Text('Heure de Commande : ${DateTime.now().hour}:${DateTime.now().minute}'),
            SizedBox(height: 8),
            Text('Total : \$${orderId * 10}.00'),
            SizedBox(height: 8),
            Text('Adresse de Livraison : Adresse $orderId'),
            SizedBox(height: 16),
            Text(
              'Lignes de Panier :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // Ajoutez ici les détails des lignes de panier
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Remplacez par la longueur de votre liste d'articles
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('ID Plat : $index'),
                    subtitle: Text('ID Supplément : ${index + 1}\nQuantité : ${index + 2}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
