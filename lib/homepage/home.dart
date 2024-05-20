import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schoolspot/screens/login_page.dart';
import 'package:schoolspot/screens/profile.dart';
import 'package:schoolspot/screens/search.dart';
import 'package:schoolspot/screens/subscription_page.dart';
import 'package:schoolspot/screens/test.dart';
import 'package:schoolspot/screens/test_results_page.dart';
import 'package:schoolspot/school/UniversityOfSaintLaSalle.dart';
import 'package:schoolspot/school/ColegioSanAgustinBacolod.dart';
import 'package:schoolspot/school/UniversityOfNegrosOccidentalRecoletos.dart';
import 'package:schoolspot/school/RiversideCollege.dart';

const double _listItemHeight = 160.0;

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text(
    'SchoolSpot',
    style: TextStyle(
      color: Colors.white,
      
      fontSize: 24, // Increase font size for prominence
      fontWeight: FontWeight.bold, // Bold text
      letterSpacing: 1.5, // Add letter spacing for emphasis
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.3), // Add shadow for depth
          blurRadius: 2,
          offset: Offset(2, 2),
        ),
      ],
    ),
  ),
  backgroundColor: Colors.transparent, // Transparent background
  elevation: 0, // No elevation
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.shade400, // Adjust gradient colors for vibrancy
          Colors.indigo.shade700,
        ],
      ),
    ),
  ),
),
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image with Frosted Glass
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color:
                    Colors.black.withOpacity(0), // Adjust the opacity as needed
              ),
            ),
            SchoolName(),
          ],
        ),
      ),
      bottomNavigationBar: _isLoggedIn
    ? Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade400,
              Colors.indigo.shade700,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
            onTap: (index) {
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              }
            },
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: true,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(0, 2),
                  blurRadius: 2,
                ),
              ],
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(0, 20),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ),
      )
    : null,

      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 150,
            child: DrawerHeader(
               decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.blue.shade400,
        Colors.indigo.shade700,
      ],
    ),
  ),
  child: Center(
    child: Container(
      height: 150, // Adjust height as needed
      width: 150, // Adjust width as needed
      child: Image.network(
        'https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/logo%20(silaw).png',
        fit: BoxFit.contain,
      ),
    ),
  ),
),),
          _buildListTileWithBox(
            title: 'Profile',
            icon: Icons.person,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          _buildListTileWithBox(
            title: 'Subscription',
            icon: Icons.monetization_on,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionPage()),
              );
            },
          ),
          _buildListTileWithBox(
            title: 'Retake Test',
            icon: Icons.undo,
            onTap: () {
              _showRetakeTestConfirmation();
            },
          ),
          _buildListTileWithBox(
            title: 'View Results',
            icon: Icons.bar_chart,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestResultsPage()),
              );
            },
          ),
          _buildListTileWithBox(
            title: 'Logout',
            icon: Icons.logout,
            onTap: () {
              _logout();
            },
          ),
        ],
      ),
    );
  }

Widget _buildListTileWithBox({required String title, required IconData icon, required Function onTap}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 113, 188, 250),
            Color.fromARGB(255, 83, 147, 255),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        border: Border.all(
          color: Colors.blueAccent,
          width: 2,
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          onTap();
        },
      ),
    ),
  );
}


  void _showRetakeTestConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          backgroundColor: Colors.blue,
          content: Text(
            "Are you sure you want to retake the test?",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestPage()),
                );
              },
              child: Text(
                "Retake",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    setState(() {
      _isLoggedIn = false;
    });
    Navigator.pop(context); // Close the drawer
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}

class SchoolName extends StatefulWidget {
  const SchoolName({Key? key}) : super(key: key);

  @override
  State<SchoolName> createState() => _SchoolNameState();
}

class _SchoolNameState extends State<SchoolName> {
  final List<String> descriptions = [
    "A prestigious university known for its excellence in various fields.",
    "A renowned institution providing quality education for decades.",
    "A leading university fostering academic and personal growth.",
    "A dynamic college committed to innovation and learning."
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          0.8, // Adjust the height as needed
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildListItem(index);
        },
      ),
    );
  }

  Widget _buildListItem(int index) {
    String imageURL = (index % 4 == 0)
        ? "https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/usls.png"
        : (index % 4 == 1)
            ? "https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/san-ag.png"
            : (index % 4 == 2)
                ? "https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/unor.jpeg"
                : "https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/rci.png";

    String schoolName = (index % 4 == 0)
        ? "University of Saint La Salle"
        : (index % 4 == 1)
            ? "Colegio San Agustin Bacolod"
            : (index % 4 == 2)
                ? "University of Negros Occidental Recoletos"
                : "Riverside College";

    String description = descriptions[index % descriptions.length];

    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UniversityOfSaintLaSalle()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ColegioSanAgustinBacolod()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UniversityOfNegrosOccidentalRecoletos()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RiversideCollege()),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 160, // Adjusted height
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        schoolName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20, // Adjusted font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6), // Adjusted spacing
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
