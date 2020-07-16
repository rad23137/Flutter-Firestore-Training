import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount:transaction.length,
         itemBuilder: (context, index) {
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
                  color: Theme.of(context).primaryColor,
                  width: 2,
                )),
                padding: EdgeInsets.all(10),
                child: Text(
                  "\$${transaction[index].amount.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor, //Using the color of theme
                  ),
                )),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(transaction[index].title,
                    style: Theme.of(context).textTheme.headline6
                    ),
                Text(DateFormat('yyyy/MMM/dd').format(transaction[index].date),
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ))
          ],
        ));
      }),
    );
  }
}
