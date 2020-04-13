import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color',
      'answers': [
        {'text': 'Black', 'score': 8},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 10},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 2},
        {'text': 'Horse', 'score': 5},
        {'text': 'Tiger', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite car',
      'answers': [
        {'text': 'Vios', 'score': 1},
        {'text': 'Avanza', 'score': 6},
        {'text': 'Innova', 'score': 9},
        {'text': 'Fortuner', 'score': 10}
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                questions: _questions,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
