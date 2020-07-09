import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Container widget similar to div element
    return Center( // used Center widget so that container
    //does not take width and height of parent i.e MaterialApp
    // due to box constraints
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepPurple,
        width:200.0, //always in decimal
        height:100.0, //always in decimal
        child: Text("Flight", textDirection: TextDirection.ltr), //Text
      ),//Container
    ); //Center
  }
}
