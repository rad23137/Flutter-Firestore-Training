import 'package:flutter/material.dart';
import 'app_screens/first_screen.dart';
import 'app_screens/home.dart';

/// entry point of application
///   ///runApp function to stick widget on screen

void main() {
  runApp(new MaterialApp(
    title: "Exploring UI Widgets",
    home: new Home(), // Calling Home Class Build Function
  ) //MaterialApp

      // MyFlutterApp() will call build function of MyFlutterApp Class
      //new MyFlutterApp()
      );
}

//Stateless widget means  a widget that contains no state and will not change in future
// extends the class statelesswidget to organize the code
class MyFlutterApp extends StatelessWidget {
  @override

  ///returns widget
  Widget build(BuildContext context) {
    return //MaterialApp widget to provide material design
        new MaterialApp(
            debugShowCheckedModeBanner: false, //remove debug tag
            title: "My Flutter App", //title of app
            //Material WIdget to add styling
            home: new Scaffold(
                appBar: AppBar(
                  title: Text("My First App Screen"),
                ), //AppBar
                body: new FirstScreen()) //Scaffold

            ); //MaterialApp
  }
}
