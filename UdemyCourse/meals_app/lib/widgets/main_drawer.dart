import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

Widget _buildListTile(String title, IconData icon, Function tapHandler) {
  return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler);
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
          height: 120,
          width: double.infinity,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(height: 20),
        _buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
        }),
        _buildListTile('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ],
    ));
  }
}
