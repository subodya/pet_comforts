import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/homes_screen.dart';
import 'screens/account_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),  // Light theme
      darkTheme: ThemeData.dark(),  // Dark theme
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,  // Switching theme based on user choice
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(toggleTheme: _toggleTheme, isDarkMode: _isDarkMode),  // Passing toggle function to LoginScreen
        '/signup': (context) => SignUpScreen(toggleTheme: _toggleTheme, isDarkMode: _isDarkMode),  // Passing toggle to SignUpScreen
        '/home': (context) => HomeScreen(toggleTheme: _toggleTheme, isDarkMode: _isDarkMode),  // Passing toggle to HomeScreen
      },
    );
  }
}
