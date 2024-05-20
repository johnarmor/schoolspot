import 'package:flutter/material.dart';

class RiversideCollege extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverside College'),
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
                    colors: [Color.fromARGB(255, 39, 132, 255), Color.fromARGB(255, 22, 52, 187)],
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
                  'Welcome to Riverside College!',
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
                'Choose your college course:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildDepartmentTile('BS Psychology',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/BS_Psycho.jpg'),
              _buildDepartmentTile('BS in Radiologic Technology',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/BS_Radio.jpg'),
              _buildDepartmentTile('BS Medical Technology',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/BS_Medical.jpg'),
              _buildDepartmentTile('BS Entrepreneurship',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/BS_Entre.jpg'),
              _buildDepartmentTile('BS Business Administration',
                  'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/BS_Business.jpg'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your desired action when the button is pressed
          // For example, navigate to a new screen or perform some action.
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildDepartmentTile(String departmentName, String imageURL) {
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
        ),
      ),
    );
  }

  void main() {
    runApp(MaterialApp(
      home: RiversideCollege(),
    ));
  }
}
