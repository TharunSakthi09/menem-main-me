import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/error_page.dart';
import 'screens/filter_Screen.dart';
import './screens/tabBar_Screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/category_screen.dart';

//import './screens/lab3_9_22.dart';
//import 'screens/post.dart';
//import './screens/lab.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    "GlutenFree": false,
    "Vegan": false,
    "Vegetarian": false,
    "LactoseFree": false
  };

  List<Meal> availableMeal = DUMMY_MEALS;

  List<Meal> favoriteMeal = [];

  void saveFilter(Map<String, bool> filterOption) {
    // print("${_filter["GlutenFree"]}\n${_filter["Vegan"]}");
    setState(() {
      _filter = filterOption;

      availableMeal = DUMMY_MEALS.where((meal) {
        if (filterOption["GlutenFree"] && !meal.isGlutenFree) {
          return false;
        }
        if (filterOption["Vegan"] && !meal.isVegan) {
          return false;
        }
        if (filterOption["Vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        if (filterOption["LactoseFree"] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void arFavorite(String mealId) {
    final index = favoriteMeal.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (index >= 0) {
        favoriteMeal.removeAt(index);
        print(index);
      } else {
        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        print(index);
      }
    });
  }

  bool isFavorite(String mealId) {
    // print(favoriteMeal.any((meal) => meal.id == mealId));
    return favoriteMeal.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 52, 1)),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 52, 1)),
                // title:
                //     TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed')
              )),
      // home: CategoryScreen(),
      initialRoute: '/hm',
      routes: {
        '/hm': (context) => TabBarScreen(
            favoriteMeal), // CategoryScreen(),Post(), StudentLogin(), AnimationLab(),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(availableMeal),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(arFavorite, isFavorite),
        Filter.routeName: (context) => Filter(_filter, saveFilter)
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/hm') {
          return MaterialPageRoute(
              builder: ((context) => TabBarScreen(favoriteMeal)));
        }
      },
      onUnknownRoute: (settings) {
        if (1 == 1) {
          return MaterialPageRoute(builder: (context) => ErrorPage());
        } else {
          return MaterialPageRoute(builder: (context) => ErrorPage());
        }
      },
    );
  }
}
