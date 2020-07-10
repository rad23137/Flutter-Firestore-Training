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
              ), //Row
              FlightImageAsset(), //show image of flight
              FlightBookingButton() //show a raised button of book your flight
            ], //column widget
          ) //column
          ), //Container
    ); //Center
  }
}

//class to return Image to be the third element of column Widget
class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Having image from images folder by updating in pubspac.yaml
    AssetImage assetImage = AssetImage('images/flight.png');
    //specifying image and its width and height
    Image image = Image(image: assetImage, width: 250.0, height: 250.0);
    return Container(child: image);
  }
}

class FlightBookingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        // Should mention onPressed in Raised Button it is mandatory.
        child: RaisedButton(
            color: Colors.deepOrange,
            child: Text("Book your Flight",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700)), //textStyle
            elevation: 6.0,
            onPressed: () =>
              bookFlight(context) )// calling alertdialog, // Raised Button
        ); //container
  }

// function to be called on pressing the raised button 
  void bookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text("Flight Booked Successfully"),
        content: Text("Have a pleasant flight")); //alertDialog

    showDialog(
        context: context,
        builder: (BuildContext context) => alertDialog
      ); //ShowDialog function to show the alertDialog
  }
}
