import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pet_comforts_mobile/screens/category_screen.dart';
import 'package:pet_comforts_mobile/screens/cart_screen.dart';
import 'package:pet_comforts_mobile/screens/account_screen.dart';



class HomeScreen extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  HomeScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentCarouselIndex = 0;

  final List<String> promoImages = [
    'lib/assets/images/banner1.png',
    'lib/assets/images/banner2.png',
    'lib/assets/images/banner3.png'
  ];

  final List<Map<String, String>> dogFoodProducts = [
    {
      'image': 'lib/assets/images/D1.jpg',
      'name': 'Royal Canin Rottweiler Adult.. ',
      'price': '14,300 LKR'
    },
    {
      'image': 'lib/assets/images/D5.jpg',
      'name': 'Pedigree Complete Nutrition Adult',
      'price': '8500 LKR'
    },
    {
      'image': 'lib/assets/images/D6.jpg',
      'name': 'Hill\'s Science Diet Adult...',
      'price': '16,800 LKR'
    },
    {
      'image': 'lib/assets/images/D4.jpg',
      'name': 'Merricks Grain Free Rea...',
      'price': '11,999 LKR'
    },
    {
      'image': 'lib/assets/images/D2.jpg',
      'name': 'Purina Pro Plan Sensitive',
      'price': '7000 LKR'
    }
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      SingleChildScrollView(
        child: Column(
          children: [
            // Promotions Carousel
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                ),
                items: promoImages.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: widget.isDarkMode ? Colors.black54 : Colors
                              .white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            // Carousel Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: promoImages.map((url) {
                int index = promoImages.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentCarouselIndex == index
                        ? (widget.isDarkMode ? Color(0xD8225BDC) : Color(0xFF001952))
                        : (widget.isDarkMode ? Colors.grey : Colors.blueGrey),
                  ),
                );
              }).toList(),
            ),

            // Promo Banner
            Card(
              color: Colors.lightBlue[100],
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    'Spend 10000 LKR & Save 20% | Code: SAVE20',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: widget.isDarkMode ? Colors.black : Colors
                          .blue[900],
                    ),
                  ),
                ),
              ),
            ),

            // Deals for You Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Deals for You',
                    style: TextStyle(
                      fontFamily: 'LeagueSpartan',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  // GridView for Deals
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two cards per row
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 /
                          1, // Adjust the height ratio to make cards more responsive
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return buildDealCard(
                        index == 0
                            ? 'Extra 10% OFF on your First Order'
                            : index == 1
                            ? 'Clearance Sale'
                            : index == 2
                            ? 'Toys'
                            : 'Pet Accessories',
                        index == 0
                            ? 'CODE: NEW10'
                            : index == 1
                            ? '50% OFF'
                            : index == 2
                            ? 'Up to 30% OFF'
                            : '75% OFF',
                        widget.isDarkMode,
                      );
                    },
                  ),
                  SizedBox(height: 20),

                  // Top Selling Dog Food Section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top Selling Dog Food',
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Horizontal Scroll for Dog Food Products
                  SizedBox(
                    height: 240, // Set height for vertical cards
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dogFoodProducts.length,
                      itemBuilder: (context, index) {
                        return buildDogFoodCard(
                          dogFoodProducts[index]['image']!,
                          dogFoodProducts[index]['name']!,
                          dogFoodProducts[index]['price']!,
                          widget.isDarkMode,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      CategoryScreen(), // Update this line
      CartScreen(),
      AccountScreen(),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/images/logo.png', height: 40),
            const SizedBox(width: 10),
            Text(
              'Pet Comforts',
              style: TextStyle(
                color: Color(0xFFDE2723),
                fontFamily: 'CarmenSans',
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: () {
              widget.toggleTheme();
              setState(() {});
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.other_houses_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: widget.isDarkMode ? Color(0xD8225BDC) : Color(
            0xFF001952),
        unselectedItemColor: widget.isDarkMode ? Colors.white60 : Colors
            .blueGrey,
        backgroundColor: widget.isDarkMode ? Colors.black45 : Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Helper function to build Deal Cards
  Widget buildDealCard(String title, String subtitle, bool isDarkMode) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage('lib/assets/images/cards.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'CarmenSans',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF001952),
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'CarmenSans',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent[700],
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build Dog Food Cards
  Widget buildDogFoodCard(String imagePath, String name, String price,
      bool isDarkMode) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: isDarkMode ? Colors.grey[800] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // Center the content horizontally
                children: [
                  Image.asset(imagePath, height: 140, fit: BoxFit.cover),
                  SizedBox(height: 10),
                  // Center-aligned product name
                  Text(
                    name,
                    textAlign: TextAlign.center, // Center the text horizontally
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Color(0xDBFFA95D) : Color(0xFFCC690F),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Color(0xFF001952),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
