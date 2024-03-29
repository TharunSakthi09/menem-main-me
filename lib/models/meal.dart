import 'package:flutter/foundation.dart';

enum Affordability { Affordable, Pricey, Luxurious }

enum Complexity { Simple, Challenging, Hard }

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final Affordability affordability;
  final Complexity complexity;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.ingredients,
      @required this.steps,
      @required this.affordability,
      @required this.complexity,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}
