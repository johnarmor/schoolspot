import 'package:flutter/material.dart';
import 'package:schoolspot/chatroompage/ChatRoomPageCOE.dart'; // Import the ChatRoomPage

class COEPage extends StatefulWidget {
  const COEPage({Key? key}) : super(key: key);

  @override
  _COEPageState createState() => _COEPageState();
}

class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });
}

class _COEPageState extends State<COEPage> {
  final List<Post> posts = [
    Post(
      title: 'Chemical Engineering',
      content:
          'A branch of engineering that applies principles of chemistry, physics, mathematics, and economics to efficiently use, produce, design, transport, and transform energy and materials. It involves the study and application of chemical processes and technologies for large-scale manufacturing and production.',
    ),
    Post(
      title: 'Civil Engineering',
      content:
          'A branch of engineering that deals with the design, construction, and maintenance of the physical and natural built environment. Civil engineers are responsible for planning, designing, and overseeing various infrastructure projects that are essential for society.',
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COE Courses'),
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
    home: COEPage(),
  ));
}
