import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree;
  bool _vegan;
  bool _vegetarian;
  bool _lactoseFree;

  Widget _buildSwitchListTile(String title, bool currentValue,
      String description, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Meal Selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile('Gluten-Free', _glutenFree,
                      'Only include gluten-free meals', (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian', _vegetarian,
                      'Only include vegetarian meals', (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan', _vegan, 'Only include vegan meals', (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  _buildSwitchListTile('Lactose-Free', _lactoseFree,
                      'Only include lactose-free meals', (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
