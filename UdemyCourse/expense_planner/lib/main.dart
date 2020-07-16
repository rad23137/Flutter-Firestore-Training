
import 'package:expense_planner/widgets/user_transactions.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
 
  //String titleInput;
  //String amountInput;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Fultter App"),
          ),
          body: SingleChildScrollView( //Make the wholde content under body scrollable
          child:Column(
              //mainAxisAlignment: MainAxisAlignment  .spaceEvenly, // position element from top to bottom in columns vice versa in rows
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // position element from left to right in columns vice versa in rows
              children: <Widget>[
                Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.blue,
                      child: Text("Chart!"),
                    )),
               
                UserTransactions(), //Rendering Lists of Transaction
              ]
              )
              )
              ),
    );
  }
}
