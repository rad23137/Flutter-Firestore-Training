import 'package:flutter/material.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fultter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // position element from top to bottom in columns vice versa in rows
          crossAxisAlignment: CrossAxisAlignment.stretch, // position element from left to right in columns vice versa in rows
          children:<Widget>[
          Container(
          width:double.infinity,
          child:Card(
          color: Colors.blue,
          child:Text("Chart!"),
          )
          ),
          Container(
          child:Card(  // Card take width of child but to change that either wrap card in container or child in container
            color: Colors.red,
          child:Text("List of Transactions!"),
          ),
          )

          ]
         
        )),
      );
  }
}
