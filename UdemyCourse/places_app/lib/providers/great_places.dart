import 'package:flutter/cupertino.dart';
import 'package:places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get placess {
    return [..._places];
  }
}
