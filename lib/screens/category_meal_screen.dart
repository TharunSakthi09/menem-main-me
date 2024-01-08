import 'package:flutter/material.dart';
import '../models/category.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meal';
  final List<Meal> availableMeal;

  CategoryMealScreen(this.availableMeal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  void removeMeal(String mealId) {
    setState(() {
      categoryMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  List<Meal> categoryMeal;
  String categoryName;
  bool flag = false;

  // @override
  // void didChangeDependencies() {

  // }

  @override
  Widget build(BuildContext context) {
    //List<Map<List<String>, int>> agr;
    if (flag == false) {
      final routeData =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryName = routeData['title'];
      categoryMeal = widget.availableMeal.where((meal) {
        // for (var element in meal.categories) {
        //   if (element == routeData['id']) {
        //     return true;
        //   } else {
        //     return false;
        //   }
        // }
        return meal.categories.contains(routeData['id']);
      }).toList();
      flag = true;
      // super.didChangeDependencies();
    }
    print("CategorynMeal Screen");

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              categoryMeal[index].id,
              categoryMeal[index].imageUrl,
              categoryMeal[index].title,
              categoryMeal[index].affordability,
              categoryMeal[index].complexity,
              categoryMeal[index].duration,
              removeMeal);
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
