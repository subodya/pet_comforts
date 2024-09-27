import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  // Sample cart items
  final List<Map<String, String>> cartItems = [
    {
      'image': 'lib/assets/images/D1.jpg',
      'name': 'Royal Canin Rottweiler Adult Breed',
      'price': '14,300 LKR',
      'quantity': '1'
    },
    {
      'image': 'lib/assets/images/D5.jpg',
      'name': 'Pedigree Complete Nutrition Adult',
      'price': '8,500 LKR',
      'quantity': '2'
    },
    {
      'image': 'lib/assets/images/D2.jpg',
      'name': 'Purina Pro Plan Sensitive',
      'price': '7,000 LKR',
      'quantity': '1'
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.asset(
                            cartItems[index]['image']!,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItems[index]['name']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Price: ${cartItems[index]['price']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isDarkMode ? Colors.grey : Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Quantity: ${cartItems[index]['quantity']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isDarkMode ? Colors.grey : Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.red),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    '29,100 LKR', // Total amount calculation
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Checkout logic can be added here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF001952), // Button color
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontFamily: 'LeagueSpartan',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Change text color as needed
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
