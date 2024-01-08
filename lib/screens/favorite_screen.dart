import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeal = [];
  FavoriteScreen(this.favoriteMeal);

  void removeMeal(String mealId) {
    favoriteMeal.removeWhere((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return favoriteMeal.isEmpty
        ? Center(
            child: Text(
              "There is no favorite meal you have yet",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                  favoriteMeal[index].id,
                  favoriteMeal[index].imageUrl,
                  favoriteMeal[index].title,
                  favoriteMeal[index].affordability,
                  favoriteMeal[index].complexity,
                  favoriteMeal[index].duration,
                  removeMeal);
            },
            itemCount: favoriteMeal.length,
          );
  }
}
