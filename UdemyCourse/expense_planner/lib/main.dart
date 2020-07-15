import 'package:expense_planner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekely Groceries',
        amount: 16.53,
        date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Fultter App"),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // position element from top to bottom in columns vice versa in rows
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // position element from left to right in columns vice versa in rows
              children: <Widget>[
                Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.blue,
                      child: Text("Chart!"),
                    )),
                Column(
                  children: transactions.map((tx) {
                    return Card(
                        child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            )),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "\$ ${tx.amount}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            )),
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(tx.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            Text(
                              DateFormat('yyyy/MM/dd').format(tx.date),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ],
                        ))
                      ],
                    ));
                  }).toList(),
                )
              ])),
    );
  }
}
