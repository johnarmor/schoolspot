import 'package:flutter/material.dart';

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
      return "Congratulations! Based on your score, we recommend pursuing a STEM-related course.";
    } else if (totalScore >= 60) {
      return "Great job! Your score suggests that you may excel in business or social sciences.";
    } else {
      return "Consider exploring various fields to determine the best fit for your interests and strengths.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Career Exploration Questionnaire'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Career Exploration Questionnaire:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              QuestionWidget(
                question: 'My favorite way to spend free time is:',
                options: [
                  'a) Exploring and participating in physical activities.',
                  'b) Working with my hands and creating things.',
                  'c) Reading, writing, and thinking deeply.',
                  'd) Interacting with people and helping them.',
                  'e) Analyzing data and solving problems logically.'
                ],
                onAnswerSelected: (score) => answerQuestion('Q1', score),
              ),
              QuestionWidget(
                question: 'I prefer to learn through:',
                options: [
                  'a) Hands-on activities and experiments.',
                  'b) Lectures, discussions, and reading.',
                  'c) Interactive projects and teamwork.',
                  'd) Independent research and analysis.',
                  'e) Visual demonstrations and practical applications.'
                ],
                onAnswerSelected: (score) => answerQuestion('Q2', score),
              ),
              QuestionWidget(
                question: 'When faced with a challenge, I am most likely to:',
                options: [
                  'a) Tackle it head-on with determination.',
                  'b) Seek guidance from others to solve it.',
                  'c) Analyze the situation and come up with a strategic plan.',
                  'd) Collaborate with a team to overcome it.',
                  'e) Reflect on past experiences to find a solution.'
                ],
                onAnswerSelected: (score) => answerQuestion('Q3', score),
              ),
              QuestionWidget(
                question: 'In a group project, my role is usually:',
                options: [
                  'a) The hands-on contributor.',
                  'b) The coordinator and communicator.',
                  'c) The strategic planner.',
                  'd) The team player who supports others.',
                  'e) The analyst who evaluates the project.'
                ],
                onAnswerSelected: (score) => answerQuestion('Q4', score),
              ),
              QuestionWidget(
                question: 'My preferred work environment is:',
                options: [
                  'a) Outdoors or a hands-on workspace.',
                  'b) A collaborative and interactive office.',
                  'c) A quiet and organized office space.',
                  'd) A people-oriented and social setting.',
                  'e) A tech-savvy and analytical workspace.'
                ],
                onAnswerSelected: (score) => answerQuestion('Q5', score),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _showSubmitConfirmationDialog();
                },
                child: Text('Finish Questionnaire'),
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
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showResultsDialog();
              },
              child: Text('Submit'),
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
          title: Text('Questionnaire Completed'),
          content: Text(getRecommendation()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
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
                  title: Text(entry.value),
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
