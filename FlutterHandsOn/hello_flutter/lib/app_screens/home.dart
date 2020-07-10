import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Container widget similar to div element
    return Center(
      // used Center widget so that container
      //does not take width and height of parent i.e MaterialApp
      // due to box constraints

      child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 40.0),
          alignment: Alignment.center,
          color: Colors.deepPurple,
          //width:200.0, //always in decimal
          //     height:100.0, //always in decimal
          //    margin:EdgeInsets.all(20.0), //all constructor apply margin in all sides
          //  margin:EdgeInsets.only(left:35.0,top: 100.0), //only constructor apply margin on given side like here in left sid
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Spice Jet",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 35.0,
                              fontFamily:
                                  'Raleway', //adding custom fonts by adding them in a folder fonts
                              fontWeight: FontWeight
                                  .w700, // weight tell which font of font family to apply
                              //fontStyle: FontStyle.italic //to show style of a font in font family
                              color: Colors.white) //TextSTyle
                          ) //Text
                      ), //Expanded

                  Expanded(
                      child: Text("From Mumbai to Bangalore via Delhi",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 30.0,
                              fontFamily:
                                  'Raleway', //adding custom fonts by adding them in a folder fonts
                              fontWeight: FontWeight
                                  .w300, // weight tell which font of font family to apply
                              //fontStyle: FontStyle.italic //to show style of a font in font family
                              color: Colors.white) //TextStyle
                          ) //Text
                      ), //expanded
                ],
              ), //Row Widget

              Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Air India",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 35.0,
                              fontFamily:
                                  'Raleway', //adding custom fonts by adding them in a folder fonts
                              fontWeight: FontWeight
                                  .w700, // weight tell which font of font family to apply
                              //fontStyle: FontStyle.italic //to show style of a font in font family
                              color: Colors.white) //TextSTyle
                          ) //Text
                      ), //Expanded

                  Expanded(
                      child: Text("From Jaipur to Goa",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 30.0,
                              fontFamily:
                                  'Raleway', //adding custom fonts by adding them in a folder fonts
                              fontWeight: FontWeight
                                  .w300, // weight tell which font of font family to apply
                              //fontStyle: FontStyle.italic //to show style of a font in font family
                              color: Colors.white) //TextStyle
                          ) //Text
                      ), //expanded
                ],
              )
            ], //column widget
          ) //column
          ), //Container
    ); //Center
  }
}
