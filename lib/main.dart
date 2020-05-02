import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'What\s your favourite color?',
      'answers': [
        {'text': 'Blue', 'value': 10},
        {'text': 'Red', 'value': 5},
        {'text': 'Yellow', 'value': 2}
      ],
    },
    {
      'question': 'What\s your favourite animal?',
      'answers': [
        {'text': 'Turtle', 'value': 10},
        {'text': 'Cat', 'value': 5},
        {'text': 'Dog', 'value': 2}
      ],
    },
    {
      'question': 'What\s your favourite food?',
      'answers': [
        {'text': 'Pasta', 'value': 10},
        {'text': 'Soup', 'value': 5},
        {'text': 'Pizza', 'value': 2}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerPressed(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The App'),
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Colors.amberAccent,
        body: (_questionIndex < _questions.length)
            ? Quiz(
                questions: _questions,
                answerPressed: _answerPressed,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
