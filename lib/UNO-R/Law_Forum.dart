import 'package:flutter/material.dart';

class LawPage extends StatefulWidget {
  const LawPage({Key? key}) : super(key: key);

  @override
  _LawPageState createState() => _LawPageState();
}

class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });
}

class _LawPageState extends State<LawPage> {
  final List<Post> posts = [
    Post(
      title: 'Law',
      content:
          'This program covers a wide range of topics, such as constitutional law, criminal law, contract law, property law, international law, and more.',
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Law School Courses'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildPostCard(posts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add the functionality you want when the button is pressed
          // For example, navigate to another page, show a dialog, etc.
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
    home: LawPage(),
  ));
}
