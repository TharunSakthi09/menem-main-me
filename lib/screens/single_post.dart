import 'package:flutter/material.dart';

class SinglePost extends StatefulWidget {
  Color _like;
  bool _flag;
  final String _img;
  SinglePost(this._like, this._flag, this._img);

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Card(
        // decoration: BoxDecoration(
        //     color: Colors.black54, borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        // padding: EdgeInsets.all(10),
        //height: 320,
        color: Colors.black54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onDoubleTap: () {
                  setState(() {
                    widget._like = Colors.red;
                    widget._flag = true;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    widget._img,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (widget._flag == false) {
                          widget._like = Colors.red;
                          widget._flag = true;
                        } else {
                          widget._like = Colors.black54;
                          widget._flag = false;
                        }
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      color: widget._like,
                      size: 30,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
