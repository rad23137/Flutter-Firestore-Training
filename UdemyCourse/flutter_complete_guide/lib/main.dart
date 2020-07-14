import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

void main() {
  runApp(MyApp());
}

// extended statefulwidget to create state and change data internally
class MyApp extends StatefulWidget {
  @override
  // this method return the class instance which extends the class State
  // It is used to form a connection between MyApp and MyAppState class
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

// Extends State Class to have a persistent State and type is MyApp to form a connection
class MyAppState extends State<MyApp>{

  int questionIndex = 0;

  // function to be called on pressing the raised button
  void answerQuestion() {
    // this method is used so that when changes happen flutter re run the build method
    // we put the code inside which is going to change the data internally on any action like here on click of button
    setState(() {
       questionIndex = questionIndex + 1 ;
    });
   
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What\'s your favourite color?",
      "What\'s your favourite animal?"
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("My First app")),
            body: Column(
              children: <Widget>[
                Question(questions[questionIndex]), // Text will change on click of button
                RaisedButton(
                  child: Text("Answer 1"),
                  onPressed: answerQuestion,
                ),
                RaisedButton(
                  child: Text("Answer 2"),
                  onPressed: answerQuestion,
                ),
                RaisedButton(
                  child: Text("Answer 3"),
                  onPressed: answerQuestion,
                )
              ],
            )));
  }
}
