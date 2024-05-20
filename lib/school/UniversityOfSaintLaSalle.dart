import 'package:flutter/material.dart';
import 'package:schoolspot/USLS/CET_Forum.dart';
import 'package:schoolspot/USLS/CBA_Forum.dart';
import 'package:schoolspot/USLS/CAS_Forum.dart';
import 'package:schoolspot/USLS/CE_Forum.dart';
import 'package:schoolspot/USLS/CN_Forum.dart';

class UniversityOfSaintLaSalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University of Saint La Salle'),
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
                    colors: [Color.fromARGB(255, 64, 255, 90), Color.fromARGB(255, 32, 139, 46)],
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
                  'Welcome to the University of Saint La Salle!',
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
              SizedBox(height: 20),
              Text(
                'Choose your college department:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildDepartmentTile(
                  'College of Engineering And Technology',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/cet.png',
                  context,
                  CETPage()),
              _buildDepartmentTile(
                  'College of Business and Accountancy',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/cba.png',
                  context,
                  CBAPage()),
              _buildDepartmentTile(
                  'College of Arts and Science',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/cas.png',
                  context,
                  CASPage()),
              _buildDepartmentTile(
                  'College of Education',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/cod.png',
                  context,
                  CEPage()),
              _buildDepartmentTile(
                  'College of Nursing',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/con.png',
                  context,
                  CNPage()),
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
      home: UniversityOfSaintLaSalle(),
    ));
  }
}