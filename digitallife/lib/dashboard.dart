import 'package:flutter/material.dart';

class FoodDashboard extends StatefulWidget {
  const FoodDashboard({Key? key}) : super(key: key);

  @override
  _FoodDashboardState createState() => _FoodDashboardState();
}

class _FoodDashboardState extends State<FoodDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int _selectedIndex = 0; // Index de l'onglet sélectionné

  final List<Map<String, dynamic>> foods = [
    {
      'img': 'images/assets/plat2.jpg',
      'name': 'Plat',
    },
    {
      'img': 'images/assets/plat3.jpg',
      'name': 'Plat',
    },
    {
      'img': 'images/assets/plat4.jpg',
      'name': 'Plat',
    },
    {
      'img': 'images/assets/plat5.jpg',
      'name': 'Plat',
    },
    {
      'img': 'images/assets/plat6.jpg',
      'name': 'Plat',
    },
    {
      'img': 'images/assets/plat7.jpg',
      'name': 'Plat',
    },
  ];

  final List<Map<String, dynamic>> collections = [
    {
      'title': 'Collection 1',
      'image': 'images/assets/roisbleu.jpg',
    },
    {
      'title': 'Collection 2',
      'image': 'images/assets/plat3.jpg',
    },
    {
      'title': 'Collection 3',
      'image': 'images/assets/plat2.jpg',
    },
    {
      'title': 'Collection 4',
      'image': 'images/assets/plat7.jpg',
    },
    {
      'title': 'Collection 5',
      'image': 'images/assets/plat5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildBannerImage(), // Nouvelle méthode pour l'image de bannière
                SizedBox(height: 16),
                _buildSearchBar(),
                SizedBox(height: 16),
                _buildTopSections(),
                SizedBox(height: 16),
                _buildCollectionList(),
                SizedBox(height: 16),
                _buildFoodsList(),
                SizedBox(height: 16),
                _buildAdvertisements(),
                SizedBox(height: 16),
                _buildSpecialPromotions(),
                SizedBox(height: 16),
              ]),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Plat'),
              onTap: () {
                // Handle drawer item tap
              },
            ),
            ListTile(
              title: Text('Plat'),
              onTap: () {
                // Handle drawer item tap
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Implement navigation logic here based on index
      switch (_selectedIndex) {
        case 0:
        // Navigate to home or refresh home page
          break;
        case 1:
        // Navigate to menu page
          break;
        case 2:
        // Navigate to cart page
          break;
        default:
      }
    });
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      title: Text(
        'Food App ',
        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.black),
          onPressed: () {
            // Cart icon onPressed logic
          },
        ),
      ],
      floating: true,
      elevation: 4,
      pinned: true,
    );
  }

  Widget _buildSearchBar() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Adresse actuelle'),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Rechercher...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTopSections() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: _buildGradientSection(
              [Colors.blue, Colors.blueAccent],
              Icons.restaurant_menu,
              'Ordre de nourriture',
              'Trouver des restaurants à proximité',
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildGradientSection(
              [Colors.orange, Colors.orangeAccent],
              Icons.table_chart,
              'Réserver une table',
              'Peut prendre jusqu’à 3 minutes',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientSection(
      List<Color> colors,
      IconData icon,
      String title,
      String subtitle,
      ) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: colors.last.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: Colors.white),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white)),
          SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildCollectionList() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Explorez les collections',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: collections.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToCollectionDetails(context, collections[index]['title']);
                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                      image: DecorationImage(
                        image: AssetImage(collections[index]['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            color: Colors.black54,
                            child: Text(
                              collections[index]['title'],
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Plats populaires',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: AssetImage(foods[index]['img']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.black54,
                        child: Text(
                          foods[index]['name'],
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAdvertisements() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Publicités',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.ad_units),
            title: Text('Promotions!'),
            subtitle: Text('Économisez 20% sur toutes les commandes.'),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.ad_units),
            title: Text('Nouveautés!'),
            subtitle: Text('Découvrez nos derniers ajouts au menu.'),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.ad_units),
            title: Text('Offre d’une durée limitée!'),
            subtitle: Text('Livraison gratuite pour les commandes supérieures à 50dinars.'),
          ),
        ],
      ),
    );
  }


  Widget _buildSpecialPromotions() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Promotions spéciales',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.star, color: Colors.orange),
            title: Text('50% de réduction sur toutes les commandes aujourd’hui'),
            subtitle: Text('Valable jusqu’à minuit'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.star, color: Colors.orange),
            title: Text('Livraison gratuite pour les commandes de plus de 50dinars'),
            subtitle: Text('Offre d’une durée limitée'),
          ),
        ],
      ),
    );
  }
  Widget _buildBannerImage() {
    return Container(
      height: 120, // Ajustez la hauteur selon vos besoins
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/assets/didi.png'), // Chemin de votre image de bannière
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  void _navigateToCollectionDetails(BuildContext context, String collectionTitle) {
    // Implement navigation to collection details page
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Food App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: FoodDashboard(),
  ));
}
