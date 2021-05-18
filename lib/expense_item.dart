import 'package:flutter/material.dart';
import 'package:plantsnest/Screens/ExpenseScreen.dart';
import 'Screens/TimelineScreen.dart';

class ExpenseItem extends StatelessWidget {
  String title;
  String body;
  double cost;

  ExpenseItem(
    this.title,
    this.body,
    this.cost,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ExpenseScreen.routeName,
      arguments: {
        'title': title,
        'body': body,
        'cost': cost,
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
            Column(
              children: <Widget>[
                Text(
                  "Cost: ",
                  textAlign: TextAlign.center,
                ),
                Text('$cost' ?? 'Default Value'),
              ],
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
