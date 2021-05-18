import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantsnest/Screens/ExpenseScreen.dart';
import 'package:plantsnest/Screens/TimelineScreen.dart';
import '../goal_item.dart';
import '../dummy_data.dart';

class GoalScreen extends StatelessWidget {
  static const routeName = '/goal-list';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, User>;
    final userInfo = routeArgs['user'];
    print('lol');
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Container(
              child: Text(
                'Goals List',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            leading: Icon(
              Icons.flag_outlined,
              color: Colors.white,
            ),
          ),
        ),
        drawer: Drawer(
          elevation: .5,
          child: Column(children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "PlantsNest",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('Timeline'),
                  leading: Icon(Icons.timeline_outlined),
                  onTap: () async {
                    await Navigator.popAndPushNamed(
                        context, TimelineScreen.routeName,
                        arguments: {'user': userInfo});
                  },
                ),
                ListTile(
                  title: Text('Goal List'),
                  leading: Icon(Icons.flag_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Expenses'),
                  leading: Icon(Icons.receipt_outlined),
                  onTap: () async {
                    await Navigator.popAndPushNamed(
                        context, ExpenseScreen.routeName,
                        arguments: {'user': userInfo});
                  },
                ),
                ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () => _signOut(context),
                )
              ],
            )),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 0.1,
            ),
            Container(
                padding: EdgeInsets.all(10),
                height: 100,
                child: Text(
                  "V1.0.0",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ]),
        ),
        body: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_GOALS
              .map(
                (catData) => GoalItem(
                  catData.title,
                  catData.body,
                  catData.date,
                ),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 350,
            childAspectRatio: 6 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade200,
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await Navigator.popAndPushNamed(context, '/');
  }
}
