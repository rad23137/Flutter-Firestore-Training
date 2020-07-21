import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  static const routeName =
      '/category-meals'; // store the route name to this screen

  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,
        String>; // Extraction of Route Arguments using ModalRoute

    final categoryId =
        routeArgs['id']; // saving the argument value of id in variable
    final categoryTitle =
        routeArgs['title']; // Saving the argument value of title in variable

    final categoryMeals = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
