import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(24.903623, 67.158367));
  GoogleMapController _contorller;

  List<Marker> _markers = [];
  String searchAddress;
  
  addMarker(cordinate) {
    int id = Random().nextInt(100);
    setState(() {
      _markers
          .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: Stack(children: <Widget>[
        GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            _contorller = controller;
          });
        },
        onTap: (cordinate) {
          _contorller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
      ),

      Positioned(
        top:30.0,
        right: 15.0,
        left: 15.0,
        child: Container(
          height: 50.0,
          width:double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
          color: Colors.white),
          child: TextField(
            decoration: InputDecoration(hintText:"Enter Address",
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top:15.0,left: 15.0),
            suffixIcon: IconButton(icon: Icon(Icons.search,),
            onPressed: searchAndNavigate,
            iconSize: 30.0,),
            ),
           onChanged: (val){
             setState(() {
               searchAddress=val;
             });
           }

          ),
        ),)
      ],),
     

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _contorller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  searchAndNavigate(){
    
  }
}
