import 'package:flutter/material.dart';
import 'Screens/TimelineScreen.dart';

class PostItem extends StatelessWidget {
  final String id;
  final String title;
  final String img;
  final String body;

  PostItem(
    this.id,
    this.title,
    this.img,
    this.body,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      TimelineScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
        'img': img,
        'body': body,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(title);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title ?? 'Default Value'),
            ),
            Container(
              alignment: Alignment.center,
              child: Container(
                width: 400.0,
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: NetworkImage(
                        img,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Text(body ?? 'Default Value'),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.withOpacity(0.5),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
