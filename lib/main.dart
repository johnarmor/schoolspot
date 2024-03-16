import 'package:flutter/material.dart';
import 'dart:async'; // Add this import for using Timer
import 'package:schoolspot/homepage/home.dart';
import 'package:schoolspot/screens/login_page.dart';
import 'package:schoolspot/screens/profile.dart';
import 'package:schoolspot/screens/search.dart';
import 'package:schoolspot/screens/subscription_page.dart';
import 'package:schoolspot/screens/test.dart';
import 'package:schoolspot/screens/test_results_page.dart';

void main() {
  runApp(const MaterialApp(
    home: SplashScreen(), // Set the splash screen as the initial screen
    debugShowCheckedModeBanner: false, // Remove debug banner
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay using Timer to simulate the splash screen for 2 seconds
    Timer(
      Duration(seconds: 5),
      () {
        // Navigate to the login screen after the delay
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/logo.png',
          fit: BoxFit.contain,
          width: 200.0, // Adjust the width as needed
          height: 200.0, // Adjust the height as needed
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'SchoolSpot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AppNavigator(),
    );
  }
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(),
      bottomNavigationBar: _isLoggedIn
          ? BottomNavigationBar(
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.blueAccent),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.blueAccent),
                  label: 'Search',
                ),
              ],
              onTap: (index) {
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                }
              },
              backgroundColor: Colors.white70,
              selectedItemColor: const Color.fromARGB(255, 6, 2, 14),
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
            )
          : null,
    );
  }

  Widget _getSelectedScreen() {
    if (_isLoggedIn) {
      return _buildHomePage();
    } else {
      return LoginPage(onLoginPressed: () {
        setState(() {
          _isLoggedIn = true;
        });
      });
    }
  }

  Widget _buildHomePage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('SchoolSpot'),
      ),
      drawer: _buildDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Homepage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Container(
                padding: EdgeInsets.all(0),
                child: Image.network(
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/logo%20(silaw).png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            title: Text('Subscription'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionPage()),
              );
            },
          ),
          ListTile(
            title: Text('Retake Test'),
            onTap: () {
              _showRetakeTestConfirmation();
            },
          ),
          ListTile(
            title: Text('View Results'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestResultsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              _logout();
            },
          ),
        ],
      ),
    );
  }

  void _showRetakeTestConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          backgroundColor: Colors.blue,
          content: Text(
            "Are you sure you want to retake the test?",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestPage()),
                );
              },
              child: Text(
                "Retake",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    setState(() {
      _isLoggedIn = false;
    });
    Navigator.pop(context); // Close the drawer
  }
}