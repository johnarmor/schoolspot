import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schoolspot/school/UniversityOfSaintLaSalle.dart';
import 'package:schoolspot/school/ColegioSanAgustinBacolod.dart';
import 'package:schoolspot/school/UniversityOfNegrosOccidentalRecoletos.dart';
import 'package:schoolspot/school/RiversideCollege.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Expanded(
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
        height: 160,
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
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              schoolName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Homepage(),
    debugShowCheckedModeBanner: false,
  ));
}
