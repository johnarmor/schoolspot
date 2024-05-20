import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schoolspot/school/UniversityOfSaintLaSalle.dart';
import 'package:schoolspot/school/ColegioSanAgustinBacolod.dart';
import 'package:schoolspot/school/UniversityOfNegrosOccidentalRecoletos.dart';
import 'package:schoolspot/school/RiversideCollege.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> descriptions = [
    "A prestigious university known for its excellence in various fields.",
    "A renowned institution providing quality education for decades.",
    "A leading university fostering academic and personal growth.",
    "A dynamic college committed to innovation and learning."
  ];

  List<String> schoolNames = [
    "University of Saint La Salle",
    "Colegio San Agustin Bacolod",
    "University of Negros Occidental Recoletos",
    "Riverside College"
  ];

  List<String> imageUrls = [
    "https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/usls.png",
    "https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/san-ag.png",
    "https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/unor.jpeg",
    "https://raw.githubusercontent.com/johnarmor/FlutterHotlinkAssets/main/rci.png"
  ];

  String filterText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              filterText = value.toLowerCase();
            });
          },
          decoration: InputDecoration(
            hintText: 'Search...',
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
                color: Colors.black.withOpacity(0),
              ),
            ),
            _buildSchoolList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSchoolList() {
  List<Widget> filteredList = [];
  for (int index = 0; index < schoolNames.length; index++) {
    if (schoolNames[index].toLowerCase().contains(filterText)) {
      filteredList.add(_buildListItem(index));
    }
  }

  if (filteredList.isEmpty && filterText.isNotEmpty) {
    // Display background text if filterText is not empty and no schools are filtered
    return Center(
      child: Text(
        'No matching schools found',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  return Expanded(
    child: ListView(
      children: filteredList.isNotEmpty ? filteredList : [],
    ),
  );
}

  Widget _buildListItem(int index) {
    String schoolName = schoolNames[index];
    String description = descriptions[index];
    String imageURL = imageUrls[index];

    return GestureDetector(
      onTap: () {
        navigateToSchool(index);
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

  void navigateToSchool(int index) {
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
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchPage(),
    debugShowCheckedModeBanner: false,
  ));
}
