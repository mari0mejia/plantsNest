import 'package:flutter/material.dart';

class ImageItem extends StatefulWidget {
  ImageItem();

  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text("Insert Image"),
                  onPressed: () {
                    print("pressed");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
