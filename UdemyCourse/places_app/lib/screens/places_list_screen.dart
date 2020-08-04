import 'package:flutter/material.dart';
import 'package:places_app/providers/great_places.dart';
import 'package:places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.route);
              },
            ),
          ],
        ),
        body: FutureBuilder(
             future: Provider.of<GreatPlaces>(context).fetchAndSetPlaces(),
            builder:(ctx,snapshot)=> snapshot.connectionState== ConnectionState.waiting?
            Center( child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
            child: Center(
              child: const Text('Got no places yet,Start adding some!!')) ,
              builder: (ctx,greatPlaces,ch)=> greatPlaces.places.length<=0 ? ch : 
              ListView.builder(itemBuilder:(ctx,index)=>
              ListTile(leading: CircleAvatar(
                backgroundImage: FileImage(greatPlaces.places[index].image),
              ),
              title: Text(greatPlaces.places[index].title),
              onTap: (){

              },
              ),
              
              itemCount: greatPlaces.places.length,),
          ),
        )
        );
  }
}
