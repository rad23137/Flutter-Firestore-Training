import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // final so that no one can change
  final Function selectHandler; // this will have function which will execute on click of any answer
  final String answerText; // it will contain the answers text
  Answer(this.selectHandler,this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
