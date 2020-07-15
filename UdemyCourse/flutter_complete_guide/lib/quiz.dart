import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  Quiz({
      @required this.answerQuestion,
      @required this.questions,
      @required this.questionIndex
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]
            ['questionText']), // Text will change on click of button
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
          return Answer(()=>answerQuestion(answer['score']), answer['text']);
        }).toList(), //_answerQuestion is a callback function passing in answer widget
        // ... is a spread operator which add values of a list into a list
        // map function is used to map every value of list answer into a list of widgets
      ],
    );
  }
}
