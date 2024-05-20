import 'package:flutter/material.dart';
import 'package:schoolspot/chatroompage/ChatRoomPageCN.dart';

class CNPage extends StatefulWidget {
  const CNPage({Key? key}) : super(key: key);

  @override
  _CNPageState createState() => _CNPageState();
}

class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });
}

class _CNPageState extends State<CNPage> {
  final List<Post> posts = [
    Post(
      title: 'Nursing',
      content:
          'A four-year degree program with general education and professional courses which are threaded thru the program emphasizing the nursing concepts aligned with Related Learning Experiences (RLE). The intensive nursing practicum further refines nursing competencies to ensure achievement of the BSN program outcomes required of an entry level nurse to help individuals, families, groups and communities cope with current and potential threats to health.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CN Courses'),
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
    home: CNPage(),
  ));
}
