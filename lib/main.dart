import 'package:flutter/material.dart';
import 'package:schoolspot/screens/login_page.dart'; // Import the login page

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

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // Define animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    // Start animation
    _controller.forward();
    // Add listener to navigate when animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the login screen after the animation completes
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      body: Center(
        child: Stack(
          children: [
            // Background with glass-like effect
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.5), // Adjust opacity as needed
                    Colors.blue.withOpacity(0.3), // Adjust opacity as needed
                  ],
                ),
              ),
            ),
            // Content in the middle
            Center(
              child: FadeTransition(
                opacity: _animation, // Apply fade animation
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png', // Path to your image asset
                      width: 100, // Adjust image width
                      height: 100, // Adjust image height
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome to SchoolSpot!',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to black
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose animation controller
    super.dispose();
  }
}