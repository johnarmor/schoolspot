import 'package:flutter/material.dart';
import 'package:schoolspot/chatroompage/ChatRoomPageCASE.dart'; // Import the ChatRoomPage

class CASEPage extends StatefulWidget {
  const CASEPage({Key? key}) : super(key: key);

  @override
  _CASEPageState createState() => _CASEPageState();
}

class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });
}

class _CASEPageState extends State<CASEPage> {
  final List<Post> posts = [
    Post(
      title: 'Psychology',
      content:
          'Focuses on the assessment, diagnosis, and treatment of mental illnesses and emotional disorders..',
    ),
    Post(
      title: 'Culture and Arts Education',
      content:
          'Includes the study of anthropology, sociology, history, literature, and languages. It often emphasizes the importance of cultural diversity and encourages respect for various perspectives. Arts education involves both the theoretical understanding of artistic principles and hands-on, practical experiences. It may include art history, music theory, drama classes, creative writing workshops, and more.',
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CASE Courses'),
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
    home: CASEPage(),
  ));
}
