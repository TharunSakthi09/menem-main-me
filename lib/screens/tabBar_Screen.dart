import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/screens/main_drawer.dart';
import '../models/meal.dart';
import './category_screen.dart';
import './favorite_screen.dart';

class TabBarScreen extends StatefulWidget {
  List<Meal> favoriteMeal = [];
  TabBarScreen(this.favoriteMeal);
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      CategoryScreen(),
      FavoriteScreen(widget.favoriteMeal)
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Meal"),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        // type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorite")
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
    );

    // return DefaultTabController(
    //     length: 2,
    //     initialIndex: 0,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text("Meal"),
    //         bottom: TabBar(tabs: [
    //           Tab(
    //             text: "Categories",
    //             icon: Icon(Icons.category),
    //           ),
    //           Tab(
    //             text: "Favorite",
    //             icon: Icon(Icons.star),
    //           ),
    //         ]),
    //       ),
    //       body: TabBarView(children: [CategoryScreen(), FavoriteScreen()]),
    //     ));
  }
}
