import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transaction.isEmpty
          ? Column(children: <Widget>[
              Text("No Transactions added Yet!",
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                  height:
                      10), // This is to create a box which shows gap between text and image we are just giving a height no content
              Container(
                height: 200,
                child:
                    Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
              )
            ])
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text(
                                "\$${transaction[index].amount.toStringAsFixed(2)}")),
                      ),
                    ),
                    title: Text(transaction[index].title,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(
                        DateFormat('yyyy/MMM/dd')
                            .format(transaction[index].date),
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () {
                          deleteTx(transaction[index].id);
                        }),
                  ),
                );
              }),
    );
  }
}
