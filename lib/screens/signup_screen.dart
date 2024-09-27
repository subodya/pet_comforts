import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  SignUpScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _keepMeSignedIn = false; // State for the checkbox

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
                  widget.isDarkMode
                      ? 'lib/assets/images/paw_bkgrd_dark.jpg'
                      : 'lib/assets/images/paw_bkgrd.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: widget.isDarkMode
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
                      // Centered "Create Account" Title
                      Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            fontFamily: 'CarmenSans',  // Added font-family
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: widget.isDarkMode ? Colors.white : Colors.black,  // Text color in dark/light mode
                          ),
                        ),
                      ),

                      SizedBox(height: 16),
                      // Full Name TextField
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                            color: widget.isDarkMode ? Colors.white : Colors.black,  // Label color in dark/light mode
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.isDarkMode ? Colors.white : Colors.grey,  // Border color in dark/light mode
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.isDarkMode ? Colors.white : Colors.grey,  // Enabled border color
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.isDarkMode ? Colors.white : Color(0xFF001952),  // Focused border color
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                        style: TextStyle(color: widget.isDarkMode ? Colors.white : Colors.black),  // Text color inside TextFormField
                      ),
                      SizedBox(height: 16),
                      // Email TextField
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            color: widget.isDarkMode ? Colors.white : Colors.black,  // Label color in dark/light mode
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.isDarkMode ? Colors.white : Colors.grey,  // Border color in dark/light mode
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.isDarkMode ? Colors.white : Colors.grey,  // Enabled border color
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.isDarkMode ? Colors.white : Color(0xFF001952),  // Focused border color
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                        style: TextStyle(color: widget.isDarkMode ? Colors.white : Colors.black),  // Text color inside TextFormField
                      ),
                      SizedBox(height: 16),
                      // Password TextField
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Create Password',
                          labelStyle: TextStyle(
                            color: widget.isDarkMode ? Colors.white : Colors.black,  // Label color in dark/light mode
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.isDarkMode ? Colors.white : Colors.grey,  // Border color in dark/light mode
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.isDarkMode ? Colors.white : Colors.grey,  // Enabled border color
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.isDarkMode ? Colors.white : Color(0xFF001952),  // Focused border color
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                        style: TextStyle(color: widget.isDarkMode ? Colors.white : Colors.black),  // Text color inside TextFormField
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      // CheckboxListTile with toggling
                      CheckboxListTile(
                        value: _keepMeSignedIn,
                        onChanged: (bool? value) {
                          setState(() {
                            _keepMeSignedIn = value!;
                          });
                        },
                        title: Text(
                          'Keep me signed in',
                          style: TextStyle(
                            color: widget.isDarkMode ? Colors.white : Colors.black,  // Text color in dark/light mode
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: widget.isDarkMode ? Colors.white : Color(0xFF001952),
                        checkColor: widget.isDarkMode ? Colors.black : Colors.white,  // Checkbox tick color
                        tileColor: Colors.transparent,  // No hover/grey background
                      ),
                      SizedBox(height: 20),
                      // Create Account button
                      ElevatedButton(
                        onPressed: () {
                          // Add your account creation logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.isDarkMode ? Colors.white : Color(0xFF001952),  // Button color in dark/light mode
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            fontFamily: 'CarmenSans',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: widget.isDarkMode ? Colors.black : Colors.white,  // Button text color in dark/light mode
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Already have an account? Sign In text button
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Already have an account? Sign In',
                            style: TextStyle(
                              color: widget.isDarkMode ? Colors.white : Color(0xFF001952),  // Text color in dark/light mode
                              decoration: TextDecoration.underline,
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
                widget.isDarkMode ? Icons.wb_sunny : Icons.nights_stay,
                color: widget.isDarkMode ? Colors.yellow : Colors.blueGrey,
              ),
              onPressed: () => widget.toggleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}
