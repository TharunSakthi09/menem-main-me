import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/screens/filter_Screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Theme.of(context).canvasColor,
          alignment: Alignment.centerLeft,
          child: Text(
            "Cooking up..!",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed("/hm");
          },
          leading: Icon(
            Icons.category,
            size: 26,
          ),
          title: Text(
            "Category",
            style: TextStyle(
              //fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Filter.routeName);
            },
            leading: Icon(Icons.settings),
            title: Text(
              "Filter",
              style: TextStyle(
                // fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ))
      ],
    );
  }
}
