import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.lightBlueAccent, //background color
      ///Center widget to show the content in center
      /// child to keep the content inside center widget
      /// text widget to write text on screen
      child: new Center(
        child: new Text(
          // calling a function in a widget
          generateLuckyNumber(), textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0), // text styling fontsize should be in decimal
        ), //Text
      ), //Center
    ); //Material
  }
  
//function to return string of lucky number
String generateLuckyNumber() {
  var random = Random();
  int luckyNumber = random.nextInt(10);
  return "Your Lucky Number is $luckyNumber";
}
}