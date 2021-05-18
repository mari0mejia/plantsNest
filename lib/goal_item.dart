import 'package:flutter/material.dart';
import 'package:plantsnest/Screens/GoalsScreen.dart';
import 'Screens/TimelineScreen.dart';

class GoalItem extends StatelessWidget {
  final String title;
  final String body;
  final String date;

  GoalItem(
    this.title,
    this.body,
    this.date,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      GoalScreen.routeName,
      arguments: {
        'title': title,
        'body': body,
        'date': date,
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(body ?? 'Default Value'),
            ),
            Text(
              date ?? 'Default Value',
              textAlign: TextAlign.right,
            ),
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
