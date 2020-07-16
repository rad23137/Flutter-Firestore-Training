import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter App",
    home: MyHome()));
}

class MyHome extends StatefulWidget {
  //String titleInput;
  //String amountInput;

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
      id: 't2',
      title: 'Weekely Groceries',
      amount: 16.53,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fultter App"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context))
          ],
        ),
        body: SingleChildScrollView(
            //Make the wholde content under body scrollable
            child: Column(
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
              TransactionList(
                  _userTransaction), //Rendering Lists of Transaction
            ])),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context)),
      );
    
  }
}
