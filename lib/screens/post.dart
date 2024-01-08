import 'package:flutter/material.dart';
import 'single_post.dart';

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  Color _like = Colors.black54;
  bool _flag = false;
  final List<String> img = [
    "https://images.newindianexpress.com/uploads/user/imagelibrary/2022/7/8/w1200X800/mrunalthakur.png",
    "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202208/Sita_Ramam_movie_review_Dulque_1200x768.jpeg?7MhKrULX.pgocAYxXP1_WS59XvvQHJ5e&size=1200:675"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SinglePost(_like, _flag, img[index]);

          //return SinglePost(flag, like, img);
        },
        itemCount: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          setState(() {
            if (_flag == false) {
              _like = Colors.red;
              _flag = true;
            } else {
              _like = Colors.white54;
              _flag = false;
            }
          });
        }),
        child: Icon(Icons.repeat),
      ),
    );
  }
}
