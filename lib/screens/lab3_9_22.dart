import 'package:flutter/material.dart';

class AnimationLab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.white, primarySwatch: Colors.green),
      home: Scaffold(
          appBar: AppBar(title: Text("Hello")),
          body: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            height: 300,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/school.jpg",
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.black54),
          )),
    );
  }
}
