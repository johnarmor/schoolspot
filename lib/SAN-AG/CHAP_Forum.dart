import 'package:flutter/material.dart';
import 'package:schoolspot/chatroompage/ChatRoomPageCHAP.dart';

class CHAPPage extends StatefulWidget {
  const CHAPPage({Key? key}) : super(key: key);

  @override
  _CHAPPageState createState() => _CHAPPageState();
}

class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });
}

class _CHAPPageState extends State<CHAPPage> {
  final List<Post> posts = [
    Post(
      title: 'Pharmacy',
      content:
          'A field of study and profession that involves the study of drugs, medications, and their therapeutic applications.',
    ),
    Post(
      title: 'Medical Technology',
      content:
          'Also known as Clinical Laboratory Science or Medical Laboratory Technology, is a healthcare profession that involves the use of laboratory techniques and technology to perform diagnostic tests and analyze medical samples.',
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHAP Courses'),
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
    home: CHAPPage(),
  ));
}
