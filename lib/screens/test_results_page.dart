import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:schoolspot/homepage/home.dart';

class TestResultsPage extends StatelessWidget {
  final bool cameFromTest; // Flag indicating navigation from TestPage

  const TestResultsPage({
    Key? key,
    this.cameFromTest = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace this with the actual test scores data
    final testResults = _createSampleData();
    final highestResult = _findHighestResult(testResults);

    final seriesList = [
      charts.Series<CourseTestResults, String>(
        id: 'Course',
        colorFn: (CourseTestResults results, _) =>
            charts.ColorUtil.fromDartColor(getColor(results.course)),
        domainFn: (CourseTestResults results, _) => results.course,
        measureFn: (CourseTestResults results, _) => results.score,
        data: testResults,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Test Results'),
      ),
      // Remove the drawer to hide the navigation drawer
      // drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Your Test Results',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 300,
                child: SimpleBarChart(seriesList, animate: true),
              ),
              SizedBox(height: 30),
              Text(
                'You performed well! Consider exploring more topics for improvement.',
                style: TextStyle(fontSize: 18),
              ),
              RecommendationWidget(course: highestResult.course),
              SizedBox(height: 20),
              // Conditionally render the button based on cameFromTest flag
              if (cameFromTest)
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the home page after viewing test results
                    // Just like login button in LoginPage, no need for explicit navigation
                    print('Go to Home Page Button Pressed');
                    // Perform any necessary actions here if needed
                    // For now, just printing a message
                    print('Navigating to Home Page...');
                    // Navigate to Home Page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Go to Home Page',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Create sample data for test results.
  static List<CourseTestResults> _createSampleData() {
    return [
      CourseTestResults('Computer Science', 90),
      CourseTestResults('Electrical Engineering', 85),
      CourseTestResults('Business Administration', 80),
      CourseTestResults('Psychology', 75),
      CourseTestResults('Mathematics', 85),
      CourseTestResults('Information Technology', 95),
      CourseTestResults('Nursing', 82),
    ];
  }

  /// Find the course with the highest score.
  static CourseTestResults _findHighestResult(List<CourseTestResults> results) {
    return results
        .reduce((curr, next) => curr.score > next.score ? curr : next);
  }

  /// Get color based on the course
  static Color getColor(String course) {
    switch (course) {
      case 'Computer Science':
        return Colors.blue;
      case 'Electrical Engineering':
        return Colors.green;
      case 'Business Administration':
        return Colors.orange;
      case 'Psychology':
        return Colors.red;
      case 'Mathematics':
        return Colors.purple;
      case 'Information Technology':
        return Colors.teal;
      case 'Nursing':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}

/// Sample data type for test results.
class CourseTestResults {
  final String course;
  final int score;

  CourseTestResults(this.course, this.score);
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<CourseTestResults, String>> seriesList;
  final bool animate;

  const SimpleBarChart(this.seriesList, {Key? key, required this.animate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [charts.SeriesLegend()],
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 2.0,
      ),
      primaryMeasureAxis:
          charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelRotation: 45, // Rotate labels for better visibility
          labelAnchor: charts.TickLabelAnchor.after,
        ),
        showAxisLine: true, // Set to true to display axis line
      ),
    );
  }
}

class RecommendationWidget extends StatelessWidget {
  final String course;

  const RecommendationWidget({Key? key, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String recommendation = getRecommendation(course);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        recommendation,
        style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
      ),
    );
  }

  String getRecommendation(String course) {
    switch (course) {
      case 'Computer Science':
        return 'Consider exploring more advanced topics in computer science to deepen your understanding.';
      case 'Electrical Engineering':
        return 'Explore practical applications of electrical engineering and consider pursuing related internships.';
      case 'Business Administration':
        return 'Enhance your business acumen by studying successful business models and practices.';
      case 'Psychology':
        return 'Dive deeper into psychological theories and methodologies to broaden your understanding of human behavior.';
      case 'Mathematics':
        return 'Practice solving complex mathematical problems to sharpen your analytical skills.';
      case 'Information Technology':
        return 'Explore various aspects of information technology and consider specializing in a specific area such as cybersecurity or software development.';
      case 'Nursing':
        return 'Deepen your understanding of healthcare practices and consider pursuing practical experience through internships or volunteer work.';
      default:
        return 'Continue exploring various courses to discover your interests and strengths.';
    }
  }
}
