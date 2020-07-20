import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color bgColor;

  CategoryItem(this.title, this.bgColor);

   void selectCategory(BuildContext ctx)
   {
     Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {  // Navigation to a new page as new page is push as in stack
      return CategoryMealsScreen();  // returning the new page in MaterialPageRoute
     }));
   }
 
  @override
  Widget build(BuildContext context) {
    return InkWell(  // Inkwell to allow tapping on the category
          onTap:()=> selectCategory(context),
          borderRadius: BorderRadius.circular(15),
          splashColor: Theme.of(context).primaryColor,
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, 
        style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(gradient: LinearGradient(  // Gradient Shades of color 
          colors:
           [bgColor.withOpacity(0.7),
           bgColor],
           begin: Alignment.topLeft,     //starting alignment of content
           end: Alignment.bottomRight), // Ending alignment of content

           borderRadius: BorderRadius.circular(15),  // creates circular border
           
                  
      )
      ),
    );
  }
}
