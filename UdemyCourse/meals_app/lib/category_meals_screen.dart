import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  static const routeName = '/category-meals'; // store the route name to this screen
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,
        String>; // Extraction of Route Arguments using ModalRoute

    final categoryId =
        routeArgs['id']; // saving the argument value of id in variable
    final categoryTitle =
        routeArgs['title']; // Saving the argument value of title in variable

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
        child: Text('The recipies are...'),
      ),
    );
  }
}
