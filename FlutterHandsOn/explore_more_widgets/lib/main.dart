import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Exploring ListView",
    home: Scaffold(
        appBar: AppBar(title: Text("Long List")),
        body: getListView() // called it in scaffold widget because
        // the scrollable content can overflow screen
        // so would through exception on direct calling so wrapped inside scaffold widget
        ),
  ));
}

// function to generate 1000 strings which is a datasource for long list
List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

// function to wrap datatsource content in widget to show in list view
Widget getListView() {
  var listItems = getListElements();

  // syntax og long list
  //memory efficient because load only those items in memory which are available on screen
  var listView = ListView.builder(
      // create 1000 List Tile for long list
      itemBuilder: (context, index) {
    //returning 1000 listitems
    return ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(listItems[index]),
        onTap: () {
          debugPrint("${listItems[index]} was tapped");
        }); // ListTile
  }); //ListView.builder
  return listView;
}

/*Widget getListView() {
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
}*/
