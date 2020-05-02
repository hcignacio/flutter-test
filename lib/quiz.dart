import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerPressed;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerPressed,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Question(
            questions[questionIndex]['question'],
          ),
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(
              answer['text'],
              () => answerPressed(answer['value']),
            );
          }).toList()
        ],
      ),
    );
  }
}
