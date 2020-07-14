import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
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
    return _MyAppState();
  }
}

// Extends State Class to have a persistent State and type is MyApp to form a connection
class _MyAppState extends State<MyApp>{

  int _questionIndex = 0;

  // function to be called on pressing the raised button
  void _answerQuestion() {
    // this method is used so that when changes happen flutter re run the build method
    // we put the code inside which is going to change the data internally on any action like here on click of button
    setState(() {
       _questionIndex = _questionIndex + 1 ;
    });
   
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "What\'s your favourite color?",
       'answers':['Black','Red','Green','White'],
     },
      
      {
        'questionText': "What\'s your favourite animal?",
       'answers':['Rabbit','Snake','Elephant','Lion'],
     },

     {
        'questionText': "Who\'s your favourite instructor?",
       'answers':['Max','Max','Max','Max'],
     },      
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("My First app")),
            body: Column(
              children: <Widget>[
                Question(questions[_questionIndex]), // Text will change on click of button
               Answer(_answerQuestion), //_answerQuestion is a callback function passing in answer widget
               Answer(_answerQuestion),
               Answer(_answerQuestion)
                
              ],
            )));
  }
}
