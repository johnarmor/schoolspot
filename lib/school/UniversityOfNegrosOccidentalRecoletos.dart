import 'package:flutter/material.dart';
import 'package:schoolspot/UNO-R/Law_Forum.dart';
import 'package:schoolspot/UNO-R/CJE_Forum.dart';
import 'package:schoolspot/UNO-R/GradSchool_Forum.dart';
import 'package:schoolspot/UNO-R/COBA_Forum.dart';

class UniversityOfNegrosOccidentalRecoletos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Of Negros Occidental Recoletos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to University Of Negros Occidental Recoletos!',
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
                  'School of Law',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/schoollaw.jpg',
                  context,
                  LawPage()),
              _buildDepartmentTile(
                  'College of Criminal Justice Education',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/cje.jpg',
                  context,
                  CJEPage()),
              _buildDepartmentTile(
                  'Recoletos de Bacolod Graduate School',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/gradschool.jpg',
                  context,
                  GradSchoolPage()),
              _buildDepartmentTile(
                  'College of Business and Accountancy',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/coba.jpg',
                  context,
                  COBAPage()),
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
      home: UniversityOfNegrosOccidentalRecoletos(),
    ));
  }
}
