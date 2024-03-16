import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Results App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestResultsPage(),
    );
  }
}

class TestResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with the actual test scores data
    final testResults = _createSampleData();
    final highestResult = _findHighestResult(testResults);

    final seriesList = [
      charts.Series<SubjectTestResults, String>(
        id: highestResult.subject,
        colorFn: (SubjectTestResults results, _) =>
            charts.ColorUtil.fromDartColor(getColor(results.subject)),
        domainFn: (SubjectTestResults results, _) => results.subject,
        measureFn: (SubjectTestResults results, _) => results.score,
        data: testResults,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Test Results'),
      ),
      body: Padding(
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

            // Display the test results as a graph
            Container(
              height: 300, // Adjust the height as needed
              child: SimpleBarChart(seriesList, animate: true),
            ),
            SizedBox(height: 30),

            // Display the names of the subjects below the graph
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: testResults
                  .map((result) => Text(
                        result.subject,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                  .toList(),
            ),

            SizedBox(height: 10),

            // Example: Provide insights or recommendations based on results
            Text(
              'You performed well in ${highestResult.subject}! Consider exploring more topics for improvement.',
              style: TextStyle(fontSize: 18),
            ),

            // Automatic Recommendation Widget
            RecommendationWidget(subject: highestResult.subject),
          ],
        ),
      ),
    );
  }

  /// Create sample data for test results.
  static List<SubjectTestResults> _createSampleData() {
    return [
      SubjectTestResults('Math', 105),
      SubjectTestResults('Science', 100),
      SubjectTestResults('English', 85),
      SubjectTestResults('History', 75),
      SubjectTestResults('Art', 80),
    ];
  }

  /// Find the subject with the highest score.
  static SubjectTestResults _findHighestResult(
      List<SubjectTestResults> results) {
    return results
        .reduce((curr, next) => curr.score > next.score ? curr : next);
  }

  /// Get color based on the subject
  static Color getColor(String subject) {
    switch (subject) {
      case 'Math':
        return Colors.blue;
      case 'Science':
        return Colors.green;
      case 'English':
        return Colors.orange;
      case 'History':
        return Colors.red;
      case 'Art':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

/// Sample data type for test results.
class SubjectTestResults {
  final String subject;
  final int score;

  SubjectTestResults(this.subject, this.score);
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<SubjectTestResults, String>> seriesList;
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
  final String subject;

  const RecommendationWidget({Key? key, required this.subject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String recommendation = getRecommendation(subject);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        recommendation,
        style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
      ),
    );
  }

  String getRecommendation(String subject) {
    switch (subject) {
      case 'Math':
        return 'Consider practicing more advanced math problems to further enhance your skills.';
      case 'Science':
        return 'Explore additional scientific topics and conduct hands-on experiments.';
      case 'English':
        return 'Read a variety of literature to improve your language and comprehension skills.';
      case 'History':
        return 'Dive deeper into historical events and their significance.';
      case 'Art':
        return 'Experiment with different art forms and techniques to express your creativity.';
      default:
        return 'Keep exploring and learning in various subjects to broaden your knowledge.';
    }
  }
}
