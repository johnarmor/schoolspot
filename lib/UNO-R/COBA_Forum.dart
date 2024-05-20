import 'package:flutter/material.dart';

class COBAPage extends StatefulWidget {
  const COBAPage({Key? key}) : super(key: key);

  @override
  _COBAPageState createState() => _COBAPageState();
}

class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });
}

class _COBAPageState extends State<COBAPage> {
  final List<Post> posts = [
    Post(
      title: 'Financial Management',
      content:
          'This program provides each graduate with information and practice on financial institutions and equip them with the technical skills needed to be highly competent in the world of finance. These skills and practice are based on established financial theories, methodologies, and various analytical tools. Ethics, market integrity, regulations, good governance, and competitive global perspective necessary for effective financial decision making are especially being uphold by the program.',
    ),
    Post(
      title: 'Science in Accountancy',
      content:
          'Equips students with knowledge and skills in both basic and advanced accounting concepts, principles and procedures to enable them to understand their accountability and, as a result, will enable them to meet the demands of the profession. It is aimed that students will become professional and competent accountants, who will make greater contributions to society.',
    ),
    Post(
      title: 'Marketing Management',
      content:
          'This program provides each graduate with both technical skills and competencies required in the field of marketing, at the same time mold in them the flexible mindset that is necessary to stay competitive in a dynamic business environment. Furthermore, the program aims to broaden the knowledge and skills of the marketing students for both local and international environments.',
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COBA Courses'),
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
    home: COBAPage(),
  ));
}
