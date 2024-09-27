import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Determine if dark mode is active
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[850] : Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('lib/assets/images/user_icon.jpg'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subodhya Alahakoon', // Replace with dynamic user name
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'cb012855@students.apiit.lk',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Settings Options
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: Color(0xD8225BDC)),
                    title: Text('Profile', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                    onTap: () {
                      // Navigate to profile screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.pets, color: Color(0xD8225BDC)),
                    title: Text('Pet Profile', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                    onTap: () {
                      // Navigate to pet profile screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications, color: Color(0xD8225BDC)),
                    title: Text('Notifications', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                    onTap: () {
                      // Navigate to notifications settings
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.history, color: Color(0xD8225BDC)),
                    title: Text('Order History', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                    onTap: () {
                      // Navigate to order history
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.payment, color: Color(0xD8225BDC)),
                    title: Text('Payment Methods', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                    onTap: () {
                      // Navigate to payment methods
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.security, color: Color(0xD8225BDC)),
                    title: Text('Privacy Settings', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                    onTap: () {
                      // Navigate to privacy settings
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text('Logout', style: TextStyle(color: Colors.red)),
                    onTap: () {
                      // Handle logout functionality by navigating to the login screen
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
