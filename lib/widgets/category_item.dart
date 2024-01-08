import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final color;
  final String id;
  CategoryItem(this.color, this.title, this.id);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealScreen.routeName,
        arguments: {'id': id, 'title': title}
        //   MaterialPageRoute(builder: (_) {
        //   return CategoryMealScreen(id, title, color);
        // })
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
              //fontWeight: FontWeight.bold
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
