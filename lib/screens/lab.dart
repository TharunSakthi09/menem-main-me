//23-8-22
import 'package:flutter/material.dart';

void main() {
  runApp(StudentLogin());
}

class StudentLogin extends StatelessWidget {
  final String imgUrl =
      "https://cdn-icons-png.flaticon.com/512/5087/5087579.png";
  var userId = TextEditingController();
  var pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.lightGreen, accentColor: Colors.redAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 50,
              child: Icon(
                Icons.face,
                size: 100,
              )
              //Image.network(imgUrl)
              ),
          Card(
            color: Colors.black54,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "User Id"),
                    controller: userId,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Password"),
                    controller: pass,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child:
                          Text("Login", style: TextStyle(color: Colors.white)))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
