import 'package:flutter/material.dart';
import 'modifierprofilclient.dart';
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Merci de nous soutenir !',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
" En tant qu’entreprise locale, nous vous remercions de nous soutenir et espérons que vous apprécierez.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Column(
              children: [
                _buildProfileOption(
                  context,
                  icon: Icons.person_outline_rounded,
                  label: 'Modifier Profil',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => EditProfilePage()),
                    );
                  },
                ),
                Divider(), // Ligne séparatrice
                _buildProfileOption(
                  context,
                  icon: Icons.history,
                  label: 'Historique des commandes',
                  onTap: () {
                    Navigator.pushNamed(context, 'OrderHistory');
                  },
                ),
                Divider(), // Ligne séparatrice
                _buildProfileOption(
                  context,
                  icon: Icons.payment,
                  label: 'Paiement',
                  onTap: () {
                    Navigator.pushNamed(context, 'PaymentMethods');
                  },
                ),
                Divider(), // Ligne séparatrice
                _buildProfileOption(
                  context,
                  icon: Icons.settings,
                  label: 'Paramètres',
                  onTap: () {
                    // Logique pour les paramètres
                    Navigator.pushNamed(context, 'Settings');
                  },
                ),
                Divider(), // Ligne séparatrice
                _buildContactUsOption(
                  context,
                  icon: Icons.contact_phone_rounded,
                  label: 'Contactez Nous',
                  onTap: () {
                    // Logique pour la page de contact
                    Navigator.pushNamed(context, 'ContactUs');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green, // Couleur verte pour le cercle
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white, // Couleur blanche pour l'icône
                  size: 24, // Taille de l'icône
                ),
              ),
            ),
            SizedBox(width: 16), // Espacement entre l'icône et le texte
            Text(
              label,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactUsOption(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green, // Couleur verte pour le cercle
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white, // Couleur blanche pour l'icône
                  size: 24, // Taille de l'icône
                ),
              ),
            ),
            SizedBox(width: 16), // Espacement entre l'icône et le texte
            Text(
              label,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
