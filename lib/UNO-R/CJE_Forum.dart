import 'package:flutter/material.dart';

class CJEPage extends StatefulWidget {
  const CJEPage({Key? key}) : super(key: key);

  @override
  _CJEPageState createState() => _CJEPageState();
}

class Post {
  final String title;
  final String content;

  Post({
    required this.title,
    required this.content,
  });
}

class _CJEPageState extends State<CJEPage> {
  final List<Post> posts = [
    Post(
      title: 'Criminology',
      content:
          'This program is committed to provide law enforcement agencies (PNP, BJMP, BFP, NBI) personnel to earn a degree in B.S. Criminology through assessment and accreditation by giving equivalency of their earned trainings, schoolings and seminars attended related to B.S. Criminology course..',
    ),
    Post(
      title: 'Science in Criminology',
      content:
          'The course covers the six areas of concentration, such as Criminal Law and Jurisprudence, Law Enforcement Administration, Forensics/Criminalistics, Crime Detection and Investigation, Sociology of Crimes and Ethics, and Correctional Administration. This course will equip the students with knowledge and training in modern law enforcement work, scientific crime detection, investigation, corrections, and social defense.',
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CJE Courses'),
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
    home: CJEPage(),
  ));
}
