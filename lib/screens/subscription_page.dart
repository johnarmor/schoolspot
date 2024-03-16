import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Subscription title with a bold and slightly larger font
              Text(
                'Unlock Premium Features',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              // Description of what to expect with a smaller font
              Text(
                'Upgrade to a premium subscription for an enhanced experience:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),

              // Features list with a smaller font
              _buildFeature('✓ Accurate Results',
                  'Enjoy precise and reliable information.'),
              _buildFeature('✓ Premium Content',
                  'Access exclusive content and insights.'),
              _buildFeature('✓ Ad-Free Experience',
                  'Immerse yourself without interruptions.'),
              // Add more features as needed

              SizedBox(height: 20),

              // Subscribe button with a slightly smaller font and reduced padding
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement your subscription logic here
                  // For simplicity, we're not handling the actual subscription process in this example
                  // You might want to navigate to a payment screen or show a subscription dialog
                },
                // Styled button with reduced padding for a better touch experience
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Subscribe Now',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build each feature row
  Widget _buildFeature(String featureIcon, String featureText) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          // Feature icon (checkmark) with a slightly smaller font
          Text(
            featureIcon,
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
          SizedBox(width: 8),

          // Feature text with a slightly smaller font
          Flexible(
            child: Text(
              featureText,
              style: TextStyle(fontSize: 14),
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
