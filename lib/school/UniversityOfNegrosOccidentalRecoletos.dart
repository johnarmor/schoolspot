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
              AnimatedContainer(
                duration: Duration(seconds: 1),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromARGB(255, 214, 202, 25), Color.fromARGB(255, 16, 60, 179)],
                  ),
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'Welcome to University of Negros Occidental Recoletos!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
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
