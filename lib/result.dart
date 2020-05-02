import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function reset;

  Result(this.totalScore, this.reset);

  String get resultPhrase {
    String phrase = 'Your score is: ';
    int score = this.totalScore;
    return phrase + score.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            FlatButton(onPressed: reset, child: Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
