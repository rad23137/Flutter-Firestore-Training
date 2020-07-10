import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Exploring ListView",
    home: Scaffold(
        appBar: AppBar(title: Text("Basic List View")),
        body: getListView() // called it in scaffold widget because
                            // the scrollable content can overflow screen
                           // so would through exception on direct calling so wrapped inside scaffold widget
        ),
  ));
}

Widget getListView() {
  //ListView used for small number of items
  // Listview loads all items in memory so not memory efficient
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.landscape), //Expects a widget so used Icon widget
        title: Text("Landscape"),
        subtitle: Text("Beautiful View!"),
        trailing: Icon(Icons.wb_sunny), //Expects a widget so used Icon Widget
        onTap: () {
          debugPrint("Landscape tapped");
        },
      ),

      ListTile(
          leading: Icon(
              Icons.laptop_chromebook), //Expects a widget so used Icon widget
          title: Text("Windows")), //ListTile

      ListTile(
          leading: Icon(Icons.phone), //Expects a widget so used Icon widget
          title: Text("Phone")), //ListTile

      Text("Yet another element in List"),

      Container(color: Colors.red, height: 50.0)
    ], //Widget
  ); //ListView
  return listView;
}
