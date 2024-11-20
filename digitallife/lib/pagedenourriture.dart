import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FoodApp(),
  ));
}

class FoodApp extends StatefulWidget {
  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> with SingleTickerProviderStateMixin {
  final ScrollController _restaurantScrollController = ScrollController();

  List<Map<String, dynamic>> restaurants = [
    {"name": "Restaurant 1", "image": "images/restaurant1.jpg"},
    {"name": "Restaurant 2", "image": "images/restaurant2.jpg"},
    {"name": "Restaurant 3", "image": "images/restaurant3.jpg"},
    {"name": "Restaurant 4", "image": "images/restaurant4.jpg"},
  ];

  List<String> scrollingImages = [
    'images/banner1.jpg',
    'images/banner2.jpg',
    'images/banner3.jpg',
  ];

  List<Map<String, dynamic>> promotions = [
    {"title": "Promotion 1", "image": "images/promo1.png", "description": "Description de la promotion 1"},
    {"title": "Promotion 2", "image": "images/promo2.png", "description": "Description de la promotion 2"},
  ];

  List<Map<String, dynamic>> categories = [
    {"name": "Pizza", "icon": Icons.local_pizza},
    {"name": "Sushi", "icon": Icons.restaurant_menu},
    {"name": "Burgers", "icon": Icons.fastfood},
    {"name": "Chinese", "icon": Icons.local_dining},
  ];

  List<String> recommendedDishes = [
    "Pizza",
    "Sushi",
    "Burger",
  ];

  List<Map<String, dynamic>> specialOffers = [
    {"title": "Offre spéciale 1", "image": "images/offer1.png", "description": "Description de l'offre spéciale 1"},
    {"title": "Offre spéciale 2", "image": "images/offer2.png", "description": "Description de l'offre spéciale 2"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery '),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildRestaurantScroll(context),
            _buildScrollingImagesSection(context),
            _buildPromotionsSection(context),
            _buildCategoriesSection(context),
            _buildRecommendedDishesSection(context),
            _buildSpecialOffersSection(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Rechercher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Compte',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Ajouter la navigation entre les différentes sections
        },
      ),
    );
  }

  Widget _buildRestaurantScroll(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        controller: _restaurantScrollController,
        scrollDirection: Axis.horizontal,
        children: restaurants.map((restaurant) {
          return _buildRestaurantItem(context, restaurant['name'], restaurant['image']);
        }).toList(),
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, String name, String imagePath) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollingImagesSection(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: scrollingImages.map((imagePath) {
          return _buildScrollingImage(imagePath);
        }).toList(),
      ),
    );
  }

  Widget _buildScrollingImage(String imagePath) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPromotionsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.yellow[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: promotions.map((promotion) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                promotion['title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset(promotion['image']),
              SizedBox(height: 10),
              Text(promotion['description']),
              Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.orange[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: categories.map((category) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                category['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Icon(category['icon'], size: 50),
              Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRecommendedDishesSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.green[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: recommendedDishes.map((dishName) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/$dishName.jpg'),
            ),
            title: Text(dishName),
            onTap: () {
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSpecialOffersSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: specialOffers.map((offer) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                offer['title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset(offer['image']),
              SizedBox(height: 10),
              Text(offer['description']),
              Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
