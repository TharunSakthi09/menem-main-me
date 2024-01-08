import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function isFavorite;
  final Function arFavorite;
  MealDetailScreen(this.arFavorite, this.isFavorite);

  Widget subTitleBuilder(String title) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
            fontFamily: 'Raleway', fontSize: 18, fontWeight: FontWeight.bold),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget containerBuilder(Widget child, BuildContext context) {
    return Container(
        //padding: EdgeInsets.all(10),
        // margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).primaryColor)),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMealItem =
        DUMMY_MEALS.firstWhere((element) => mealId == element.id);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                //Navigator.of(context).pop();
                Navigator.of(context).pop(mealId);
              },
              icon: Icon(Icons.delete),
              label: Text("Delete"))
        ],
        title: Text(selectedMealItem.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMealItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            subTitleBuilder('Ingredient'),
            containerBuilder(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color:
                          Colors.amberAccent, //Theme.of(context).canvasColor,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(selectedMealItem.ingredients[index]),
                      ),
                    );
                  },
                  itemCount: selectedMealItem.ingredients.length,
                ),
                context),
            subTitleBuilder('Steps'),
            containerBuilder(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('#${index + 1}')),
                        title: Text(selectedMealItem.steps[index]),
                      ),
                      Divider()
                    ]);
                  },
                  itemCount: selectedMealItem.steps.length,
                ),
                context),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(mealId)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
        onPressed: () => arFavorite(mealId),
      ),
    );
  }
}
