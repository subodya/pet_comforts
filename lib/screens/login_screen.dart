import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  LoginScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image for light or dark mode
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  isDarkMode
                      ? 'lib/assets/images/paw_bkgrd_dark.jpg'
                      : 'lib/assets/images/paw_bkgrd.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Form card in the center
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: isDarkMode
                    ? Colors.black.withOpacity(0.8) // Dark mode form background
                    : Colors.white.withOpacity(0.9), // Light mode form background
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Centered Sign In title
                      Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontFamily: 'CarmenSans',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,  // Text color in dark/light mode
                          ),
                        ),
                      ),

                      SizedBox(height: 16),
                      // Email TextField
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,  // Label color in dark/light mode
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isDarkMode ? Colors.white : Colors.grey,  // Border color in dark/light mode
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isDarkMode ? Colors.white : Colors.grey,  // Enabled border color
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isDarkMode ? Colors.white : Color(0xFF001952),  // Focused border color
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),  // Text color inside TextFormField
                      ),
                      SizedBox(height: 16),
                      // Password TextField
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,  // Label color in dark/light mode
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isDarkMode ? Colors.white : Colors.grey,  // Border color in dark/light mode
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isDarkMode ? Colors.white : Colors.grey,  // Enabled border color
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isDarkMode ? Colors.white : Color(0xFF001952),  // Focused border color
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),  // Text color inside TextFormField
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      // Continue button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode ? Colors.white : Color(0xFF001952),  // Button color in dark/light mode
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',  // Added font-family
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.black : Colors.white,  // Button text color in dark/light mode
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Sign Up text button
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            "Don't have an account? Register Now",
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Color(0xFF001952),  // Text color in dark/light mode
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Dark/Light mode toggle button on the top-right corner
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: Icon(
                isDarkMode ? Icons.wb_sunny : Icons.nights_stay,
                color: isDarkMode ? Colors.yellow : Colors.blueGrey,
              ),
              onPressed: () => toggleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}
