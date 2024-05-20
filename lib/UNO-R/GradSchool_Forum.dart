import 'package:flutter/material.dart';

class GradSchoolPage extends StatefulWidget {
  const GradSchoolPage({Key? key}) : super(key: key);

  @override
  _GradSchoolPageState createState() => _GradSchoolPageState();
}

class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });
}

class _GradSchoolPageState extends State<GradSchoolPage> {
  final List<Post> posts = [
    Post(
      title: 'Educational Management',
      content:
          'A field of study that focuses on the principles, practices, and strategies involved in effectively managing educational institutions. This area of study is often part of graduate-level programs in education, educational leadership, or educational administration.',
    ),
    Post(
      title: 'Business Management',
      content:
          'Encompasses a range of courses and programs that focus on the principles, theories, and practical aspects of managing businesses and organizations.',
    ),
    Post(
      title: 'Development Management',
      content:
          'A field of study that focuses on managing and overseeing development projects, programs, and initiatives. This can encompass a wide range of areas, including economic development, community development, international development, and project management within the development context.',
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grad School Courses'),
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
    home: GradSchoolPage(),
  ));
}
