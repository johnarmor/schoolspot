import 'package:flutter/material.dart';
import 'package:schoolspot/chatroompage/ChatRoomPageCABECS.dart'; // Import the ChatRoomPage

class CABECSPage extends StatefulWidget {
  const CABECSPage({Key? key}) : super(key: key);

  @override
  _CABECSPageState createState() => _CABECSPageState();
}

class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });
}

class _CABECSPageState extends State<CABECSPage> {
  final List<Post> posts = [
    Post(
      title: 'Tourism Management',
      content:
          ' a specialized field of study that focuses on the principles and practices involved in planning, organizing, marketing, and managing travel and tourism-related activities.',
    ),
    Post(
      title: 'Hospitality Management',
      content:
          'Focuses on the administration and coordination of services within the hospitality industry. This industry encompasses a wide range of businesses and services, including hotels, restaurants, event planning, theme parks, cruise lines, and more. Hospitality management programs prepare individuals for leadership roles in these sectors by providing a comprehensive understanding of business, customer service, and industry-specific practices.',
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CABECS Courses'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildPostCard(posts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the ChatRoomPage when the FAB is clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatRoomPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildPostCard(Post post) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  post.content,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // You can add more widgets or modify this section as needed
                  ],
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
    debugShowCheckedModeBanner: false,
    home: CABECSPage(),
  ));
}
