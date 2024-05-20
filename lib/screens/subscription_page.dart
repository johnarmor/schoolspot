import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unlock Premium Features'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Subscription title with bold and larger font
            Text(
              'Unlock Premium Features',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Subscription description with smaller font and increased line spacing
            Text(
              'Upgrade to a premium subscription for an enhanced experience:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            SizedBox(height: 20),

            // Features list with icons and descriptions
            _buildFeature(Icons.verified, 'Accurate Results',
                'Enjoy precise and reliable information.'),
            _buildFeature(Icons.accessibility, 'Premium Content',
                'Access exclusive content and insights.'),
            _buildFeature(Icons.remove_red_eye, 'Ad-Free Experience',
                'Immerse yourself without interruptions.'),
            // Add more features as needed

            SizedBox(height: 30),

            // Subscribe button with rounded corners, gradient background, and elevated shadow
            ElevatedButton(
              onPressed: () {
                // TODO: Implement subscription logic
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, padding: EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text('Subscribe Now'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each feature row with an icon and description
  Widget _buildFeature(IconData icon, String title, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Feature icon
          Icon(
            icon,
            size: 36,
            color: Colors.blueAccent,
          ),
          SizedBox(width: 20),

          // Feature description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
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
    home: SubscriptionPage(),
  ));
}
