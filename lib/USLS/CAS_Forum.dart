import 'package:flutter/material.dart';
import 'package:schoolspot/chatroompage/ChatRoomPageCAS.dart'; // Import the ChatRoomPage

class CASPage extends StatefulWidget {
  const CASPage({Key? key}) : super(key: key);

  @override
  _CASPageState createState() => _CASPageState();
}

class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });
}

class _CASPageState extends State<CASPage> {
  final List<Post> posts = [
    Post(
      title: 'Communication',
      content:
          ' A communication-based program that covers fields of journalism, development communication, broadcasting, communication research, multi media studies, film, public relations, advertising, and the creative arts like theater and stage performance.',
    ),
    Post(
      title: 'Biology',
      content:
          'Structured as a generalized framework of study with the end view of grounding students with the fundamental concepts and principles and theories of the biological, natural and physical sciences and the conduct of research.',
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAS Courses'),
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
        child: Icon(Icons.forum), // Change the icon to represent a forum
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
    home: CASPage(),
  ));
}
