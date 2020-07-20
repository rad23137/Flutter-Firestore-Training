import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color bgColor;

  CategoryItem(this.title, this.bgColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title),
      decoration: BoxDecoration(gradient: LinearGradient(  // Gradient Shades of color 
        colors:
         [bgColor.withOpacity(0.7),
         bgColor],
         begin: Alignment.topLeft,     //starting alignment of content
         end: Alignment.bottomRight), // Ending alignment of content

         borderRadius: BorderRadius.circular(15),  // creates circular border
         
                
    )
    );
  }
}
