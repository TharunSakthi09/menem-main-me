import 'package:flutter/material.dart';
import './main_drawer.dart';

class Filter extends StatefulWidget {
  static const routeName = "/filter";

  Map<String, bool> filterOption;
  final Function saveFilter;

  Filter(this.filterOption, this.saveFilter);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  Widget buildSwitchListTile(String title, bool value, Function onChange) {
    return SwitchListTile(
        title: Text(title), value: value, onChanged: onChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: [
          IconButton(
              onPressed: () => widget.saveFilter(widget.filterOption),
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            padding: EdgeInsets.all(10),
            child: Text(
              "Filter Your Foods",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile("You Need GlutenFree Meal ",
                  widget.filterOption["GlutenFree"], (newValue) {
                setState(() {
                  widget.filterOption["GlutenFree"] = newValue;
                });
              }),
              buildSwitchListTile(
                  "You Need Vegan Meal ", widget.filterOption["Vegan"],
                  (newValue) {
                setState(() {
                  widget.filterOption["Vegan"] = newValue;
                });
              }),
              buildSwitchListTile("You Need Vegetarian Meal ",
                  widget.filterOption["Vegetarian"], (newValue) {
                setState(() {
                  widget.filterOption["Vegetarian"] = newValue;
                });
              }),
              buildSwitchListTile("You Need LactoseFree Meal ",
                  widget.filterOption["LactoseFree"], (newValue) {
                setState(() {
                  widget.filterOption["LactoseFree"] = newValue;
                });
              })
            ],
          ))
        ],
      ),
      drawer: Drawer(child: MainDrawer()),
    );
  }
}
