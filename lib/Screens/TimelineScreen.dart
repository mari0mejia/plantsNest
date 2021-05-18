import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:plantsnest/Screens/ExpenseScreen.dart';
import 'package:plantsnest/Screens/GoalsScreen.dart';
import '../post_item.dart';
import '../dummy_data.dart';
import '../image_item.dart';
import '../Screens/ImageScreen.dart';

class TimelineScreen extends StatelessWidget {
  static const routeName = '/time-line';
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
                'Timeline',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            leading: Icon(
              Icons.timeline_outlined,
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
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Goal List'),
                  leading: Icon(Icons.flag_outlined),
                  onTap: () async {
                    await Navigator.pushNamed(
                      context,
                      GoalScreen.routeName,
                      arguments: {'user': userInfo},
                    );
                  },
                ),
                ListTile(
                  title: Text('Expenses'),
                  leading: Icon(Icons.receipt_outlined),
                  onTap: () async {
                    await Navigator.pushNamed(context, ExpenseScreen.routeName,
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
          children: DUMMY_CATEGORIES
              .map(
                (catData) => PostItem(
                  catData.uid,
                  catData.title,
                  catData.img,
                  catData.body,
                ),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 350,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade200,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          highlightElevation: 8.0,
          onPressed: () async {
            await Navigator.pushNamed(
              context,
              ImageScreen.routeName,
              arguments: {'user': userInfo},
            );
          },
          tooltip: "Insert Image",
          child: Icon(
            Icons.insert_comment,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await Navigator.popAndPushNamed(context, '/');
  }
}
