import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories-screen';
  @override
  Widget build(BuildContext context) {
    return GridView(
          children: DUMMY_CATEGORIES
              .map(
                // Mapping list of dummy data into category Item and returning as a widget
                (catData) =>
                    CategoryItem(catData.id, catData.title, catData.color),
              )
              .toList(),
          padding: const EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // grid delegate is required to make a grid scrollable and create a grid view
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )
    );
  }
}
