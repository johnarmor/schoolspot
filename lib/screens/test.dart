import 'package:flutter/material.dart';
import 'test_results_page.dart'; // Import the TestResultsPage

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Map<String, int> answers = {};

  void answerQuestion(String question, int score) {
    setState(() {
      answers[question] = score;
    });
  }

  int calculateTotalScore() {
    int totalScore = 0;
    answers.forEach((key, value) {
      totalScore += value;
    });
    return totalScore;
  }

  String getRecommendation() {
    int totalScore = calculateTotalScore();
    if (totalScore >= 80) {
      return "Congratulations! Based on your score, you are well-prepared for advanced IT concepts.";
    } else if (totalScore >= 60) {
      return "Good job! You have a decent understanding of fundamental IT concepts.";
    } else {
      return "Consider reviewing basic IT concepts to strengthen your knowledge.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SCHOOL SPOT EXAM'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Information Technology Exam:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    QuestionWidget(
                      question:
                          'Which of the following is NOT a programming language?',
                      options: [
                        'a) Python',
                        'b) Java',
                        'c) HTML',
                        'd) C++',
                        'e) JavaScript'
                      ],
                      onAnswerSelected: (score) => answerQuestion('Q1', score),
                    ),
                    QuestionWidget(
                      question: 'What does RAM stand for?',
                      options: [
                        'a) Random Access Memory',
                        'b) Read-Only Memory',
                        'c) Remote Access Management',
                        'd) Real-time Allocation Mechanism',
                        'e) None of the above'
                      ],
                      onAnswerSelected: (score) => answerQuestion('Q2', score),
                    ),
                    QuestionWidget(
                      question:
                          'Which of the following is used for network communication?',
                      options: [
                        'a) TCP/IP',
                        'b) HTTP',
                        'c) FTP',
                        'd) SMTP',
                        'e) All of the above'
                      ],
                      onAnswerSelected: (score) => answerQuestion('Q3', score),
                    ),
                    QuestionWidget(
                      question: 'What does HTML stand for?',
                      options: [
                        'a) Hyper Transfer Markup Language',
                        'b) Hypertext Markup Language',
                        'c) High-level Text Markup Language',
                        'd) Hyperlink and Text Markup Language',
                        'e) How To Make Lumpia'
                      ],
                      onAnswerSelected: (score) => answerQuestion('Q4', score),
                    ),
                    QuestionWidget(
                      question: 'What is the purpose of a firewall?',
                      options: [
                        'a) To protect against physical theft',
                        'b) To filter network traffic',
                        'c) To enhance computer performance',
                        'd) To provide backup storage',
                        'e) None of the above'
                      ],
                      onAnswerSelected: (score) => answerQuestion('Q5', score),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _showSubmitConfirmationDialog();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.blue,
                        ),
                        child: Text('Finish Exam'),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSubmitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Submit Answers'),
          content: Text('Are you sure you want to submit your answers?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showResultsDialog();
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showResultsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exam Completed'),
          content: Text(getRecommendation()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestResultsPage(),
                  ),
                );
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final String question;
  final List<String> options;
  final Function(int) onAnswerSelected;

  QuestionWidget({
    required this.question,
    required this.options,
    required this.onAnswerSelected,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
        Column(
          children: widget.options
              .asMap()
              .entries
              .map(
                (entry) => RadioListTile<int>(
                  title: Text(
                    entry.value,
                    style: TextStyle(color: Colors.blue), // Changed text color
                  ),
                  value: entry.key + 1,
                  groupValue: selectedAnswer,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAnswer = value;
                    });
                    if (value != null) {
                      widget.onAnswerSelected(value);
                    }
                  },
                ),
              )
              .toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TestPage(),
  ));
}
