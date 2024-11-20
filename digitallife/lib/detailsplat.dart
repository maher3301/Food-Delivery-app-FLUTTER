import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with AutomaticKeepAliveClientMixin<ProductDetails> {
  double rating = 4.0; // Default rating
  int quantity = 1; // Default quantity

  List<Map<String, dynamic>> foods = [
    {
      'img': 'images/assets/plat2.jpg',
      'name': 'Plat',
    },
    {
      'img': 'images/assets/plat3.jpg',
      'name': 'Food Item 2',
    },
    {
      'img': 'images/assets/plat4.jpg',
      'name': 'Food Item 3',
    },
    {
      'img': 'images/assets/plat5.jpg',
      'name': 'Food Item 4',
    },
    {
      'img': 'images/assets/plat6.jpg',
      'name': 'Food Item 5',
    },
    {
      'img': 'images/assets/plat7.jpg',
      'name': 'Food Item 6',
    },
  ];

  int _selectedIndex = 0; // Index de l'onglet sélectionné

  @override
  Widget build(BuildContext context) {
    super.build(context); // Necessary for AutomaticKeepAliveClientMixin
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            _buildProductInfo(),
            _buildDescription(),
            _buildAddToCartButton(),
            _buildCommentsSection(),
            _buildPopularItemsSection(), // Added popular items section
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
            label: 'Cart',
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/assets/img.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Salade César',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Prix:  10.99\dinar',
            style: TextStyle(fontSize: 18, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "moutarde, tabasco, huile, poivre, sel, oeuf, parmesan râpé, câpres, citron, ail, huile, laitue, Parmesan, pain" ,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildQuantitySelector(),
          ElevatedButton(
            onPressed: () {
              // Logic to add to cart
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Produit ajouté au panier'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(width: 8),
                Text('Ajouter au panier'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (quantity > 1) {
                quantity--;
              }
            });
          },
        ),
        Text(
          quantity.toString(),
          style: TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCommentsSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Avis des clients',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          _buildCommentTile('Laila Doe', 'Excellent produit ! Hautement recommandé.', Icons.person),
          SizedBox(height: 8),
          _buildCommentTile('Jasmine Smith', 'Bonne qualité et livraison rapide.', Icons.person),
          SizedBox(height: 8),
          _buildCommentTile('Alia Smif', "Excellente expérience, service rapide et produit de qualité.",Icons.person),

        ],
      ),
    );
  }

  Widget _buildCommentTile(String author, String comment, IconData iconData) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(iconData),
              SizedBox(width: 8),
              Text(
                author,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            comment,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Plats populaires ",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Action when the user presses "View More"
              },
              child: Text(
                "Voir",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
            MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.30),
          ),
          itemCount: foods.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic> food = foods[index];
            return GridProduct(
              img: food['img'],
              isFav: false,
              name: food['name'],
              rating: 5.0, // Average rating (can be dynamic)
              raters: 23, // Number of raters (can be dynamic)
            );
          },
        ),
        SizedBox(height: 15),
      ],
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

  @override
  bool get wantKeepAlive => true;
}

class GridProduct extends StatelessWidget {
  final String img;
  final bool isFav;
  final String name;
  final double rating;
  final int raters;

  const GridProduct({
    Key? key,
    required this.img,
    required this.isFav,
    required this.name,
    required this.rating,
    required this.raters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      '$raters FeedBack',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Product Details Example',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: ProductDetails(),
  ));
}
