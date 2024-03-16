import 'package:flutter/material.dart';
import 'package:schoolspot/SAN-AG/CASE_Forum.dart';
import 'package:schoolspot/SAN-AG/CABECS_Forum.dart';
import 'package:schoolspot/SAN-AG/COE_Forum.dart';
import 'package:schoolspot/SAN-AG/CHAP_Forum.dart';

class ColegioSanAgustinBacolod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colegio San Agustin Bacolod'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to Colegio San Agustin Bacolod!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20), // Reduced the height of this SizedBox
              Text(
                'Choose your college department:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Reduced the height of this SizedBox
              _buildDepartmentTile(
                  'College of Arts, Science and Education',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/case.png',
                  context,
                  CASEPage()),
              _buildDepartmentTile(
                  'College of Accountancy, Business Education, and Computer Studies',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/cabecs.png',
                  context,
                  CABECSPage()),
              _buildDepartmentTile(
                  'College of Engineering',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/ce.png',
                  context,
                  COEPage()),
              _buildDepartmentTile(
                  'College of Health and Allied Professions',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/chap.png',
                  context,
                  CHAPPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDepartmentTile(String departmentName, String imageURL,
      BuildContext context, Widget forumPage) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageURL),
            fit: BoxFit.cover,
          ),
        ),
        child: ListTile(
          title: Container(
            color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                departmentName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => forumPage,
              ),
            );
          },
        ),
      ),
    );
  }

  void main() {
    runApp(MaterialApp(
      home: ColegioSanAgustinBacolod(),
    ));
  }
}
